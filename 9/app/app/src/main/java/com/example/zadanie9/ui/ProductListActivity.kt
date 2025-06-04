package com.example.zadanie9.ui

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.zadanie9.R
import com.example.zadanie9.adapter.ProductAdapter
import com.example.zadanie9.model.Product

class ProductListActivity : AppCompatActivity() {

    private val products = listOf(
        Product(1, "Smartfon", 1),
        Product(2, "Laptop", 1),
        Product(3, "Powieść", 2),
        Product(4, "Koszulka", 3)
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_product_list)

        val categoryId = intent.getIntExtra("CATEGORY_ID", -1)
        val filtered = products.filter { it.categoryId == categoryId }

        val recyclerView = findViewById<RecyclerView>(R.id.recyclerViewProducts)
        recyclerView.layoutManager = LinearLayoutManager(this)
        recyclerView.adapter = ProductAdapter(filtered)
    }
}
