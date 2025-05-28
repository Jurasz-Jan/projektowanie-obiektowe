<?php

namespace App\Controller\Api;

use App\Entity\Product;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/api/product')]
class ProductApiController extends AbstractController
{
    #[Route('', methods: ['GET'])]
    public function index(ProductRepository $repo): JsonResponse
    {
        $products = $repo->findAll();

        return $this->json(array_map(fn($p) => [
            'id' => $p->getId(),
            'name' => $p->getName(),
            'price' => $p->getPrice()
        ], $products));
    }

    #[Route('', methods: ['POST'])]
    public function create(Request $request, EntityManagerInterface $em): JsonResponse
    {
        $data = $request->toArray();

        $product = new Product();
        $product->setName($data['name'] ?? '');
        $product->setPrice($data['price'] ?? 0.0);

        $em->persist($product);
        $em->flush();

        return $this->json(['status' => 'created', 'id' => $product->getId()]);
    }

    #[Route('/{id}', methods: ['GET'])]
    public function show(Product $product): JsonResponse
    {
        return $this->json([
            'id' => $product->getId(),
            'name' => $product->getName(),
            'price' => $product->getPrice()
        ]);
    }

    #[Route('/{id}', methods: ['PUT'])]
    public function update(Request $request, Product $product, EntityManagerInterface $em): JsonResponse
    {
        $data = $request->toArray();
        $product->setName($data['name'] ?? $product->getName());
        $product->setPrice($data['price'] ?? $product->getPrice());

        $em->flush();

        return $this->json(['status' => 'updated']);
    }

    #[Route('/{id}', methods: ['DELETE'])]
    public function delete(Product $product, EntityManagerInterface $em): JsonResponse
    {
        $em->remove($product);
        $em->flush();

        return $this->json(['status' => 'deleted']);
    }
}
