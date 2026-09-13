package com.crownmart.app.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.crownmart.app.dto.ProductRequest;
import com.crownmart.app.exception.ValidationException;
import com.crownmart.app.filter.AuthFilter;
import com.crownmart.app.model.Product;
import com.crownmart.app.model.User;

@WebServlet("/products/create")
public class ProductCreateServlet extends BaseServlet {

    private static final Logger log = LoggerFactory.getLogger(ProductCreateServlet.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/create-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User seller = (User) session.getAttribute(AuthFilter.SESSION_USER_ATTR);

        ProductRequest productRequest = new ProductRequest();
        productRequest.setName(request.getParameter("name"));
        productRequest.setDescription(request.getParameter("description"));
        productRequest.setCategory(request.getParameter("category"));
        productRequest.setImageUrl(request.getParameter("imageUrl"));
        try {
            productRequest.setPrice(new BigDecimal(request.getParameter("price")));
            productRequest.setStockQty(Integer.parseInt(request.getParameter("stockQty")));
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Price and stock quantity must be valid numbers.");
            request.getRequestDispatcher("/WEB-INF/views/create-product.jsp").forward(request, response);
            return;
        }

        try {
            Product product = productService.createListing(seller.getId(), productRequest);
            log.info("Seller {} created product '{}'", seller.getEmail(), product.getName());
            request.getSession().setAttribute("flashMessage", "Listing created: " + product.getName());
            response.sendRedirect(request.getContextPath() + "/products");
        } catch (ValidationException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/create-product.jsp").forward(request, response);
        }
    }
}
