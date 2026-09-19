package com.crownmart.app.controller;

import java.io.IOException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Deque;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crownmart.app.model.Product;

@WebServlet(urlPatterns = {""})
public class HomeServlet extends BaseServlet {

    private static final int FEATURED_COUNT = 8;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> all = new ArrayList<>(productService.findAll());
        all.sort(Comparator.comparing(Product::getId, Comparator.reverseOrder()));

        Map<String, Deque<Product>> byCategory = new LinkedHashMap<>();
        for (Product p : all) {
            byCategory.computeIfAbsent(p.getCategory(), k -> new ArrayDeque<>()).add(p);
        }

        List<Product> featuredProducts = new ArrayList<>();
        while (featuredProducts.size() < FEATURED_COUNT && !byCategory.isEmpty()) {
            Iterator<Deque<Product>> it = byCategory.values().iterator();
            while (it.hasNext() && featuredProducts.size() < FEATURED_COUNT) {
                Deque<Product> queue = it.next();
                featuredProducts.add(queue.poll());
                if (queue.isEmpty()) {
                    it.remove();
                }
            }
        }

        request.setAttribute("featuredProducts", featuredProducts);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}