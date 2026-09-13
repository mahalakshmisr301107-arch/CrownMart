package com.crownmart.app.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import com.crownmart.app.dao.ProductDao;
import com.crownmart.app.dto.ProductRequest;
import com.crownmart.app.exception.ValidationException;
import com.crownmart.app.model.Product;
import com.crownmart.app.util.ValidationUtil;

public class ProductService {

    private final ProductDao productDao;

    public ProductService(ProductDao productDao) {
        this.productDao = productDao;
    }

    public Product createListing(long sellerId, ProductRequest request) throws ValidationException {
        ValidationUtil.requireNonBlank(request.getName(), "Product name");
        ValidationUtil.requireNonBlank(request.getCategory(), "Category");
        ValidationUtil.requirePositive(request.getPrice(), "Price");
        ValidationUtil.requireNonNegative(request.getStockQty(), "Stock quantity");

        Product product = new Product();
        product.setSellerId(sellerId);
        product.setName(request.getName().trim());
        product.setDescription(request.getDescription() == null ? "" : request.getDescription().trim());
        product.setPrice(request.getPrice());
        product.setStockQty(request.getStockQty());
        product.setCategory(request.getCategory().trim());
        product.setImageUrl(request.getImageUrl() == null ? "" : request.getImageUrl().trim());
        product.setCreatedAt(LocalDateTime.now());

        return productDao.insert(product);
    }

    public List<Product> search(String keyword, String category) {
        return productDao.search(keyword, category);
    }

    public List<Product> findAll() {
        return productDao.findAll();
    }

    public Optional<Product> findById(long id) {
        return productDao.findById(id);
    }
}
