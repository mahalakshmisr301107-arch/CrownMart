package com.crownmart.app.dao;

import java.util.List;
import java.util.Optional;

import com.crownmart.app.model.Product;

public interface ProductDao {

    Product insert(Product product);

    Optional<Product> findById(long id);

    /**
     * Search active products by optional keyword (matched against name/description)
     * and optional category. Either may be null/blank to skip that filter.
     */
    List<Product> search(String keyword, String category);

    List<Product> findAll();

    void decrementStock(long productId, int quantityToSubtract);
}
