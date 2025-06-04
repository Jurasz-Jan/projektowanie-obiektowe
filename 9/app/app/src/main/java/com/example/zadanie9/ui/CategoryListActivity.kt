package com.example.zadanie9.ui

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.zadanie9.R
import com.example.zadanie9.adapter.CategoryAdapter
import com.example.zadanie9.model.Category

class CategoryListActivity : AppCompatActivity() {

    private val categories = listOf(
        Category(1, "Elektronika"),
        Category(2, "Książki"),
        Category(3, "Ubrania")
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_category_list)

        val recyclerView = findViewById<RecyclerView>(R.id.recyclerViewCategories)
        recyclerView.layoutManager = LinearLayoutManager(this)
        recyclerView.adapter = CategoryAdapter(categories) { category ->
            val intent = Intent(this, ProductListActivity::class.java)
            intent.putExtra("CATEGORY_ID", category.id)
            startActivity(intent)
        }
    }
}
