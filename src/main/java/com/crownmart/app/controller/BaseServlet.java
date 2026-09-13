package com.crownmart.app.controller;

import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

import com.crownmart.app.dao.CartDao;
import com.crownmart.app.dao.OrderDao;
import com.crownmart.app.dao.ProductDao;
import com.crownmart.app.dao.UserDao;
import com.crownmart.app.dao.impl.JdbcCartDao;
import com.crownmart.app.dao.impl.JdbcOrderDao;
import com.crownmart.app.dao.impl.JdbcProductDao;
import com.crownmart.app.dao.impl.JdbcUserDao;
import com.crownmart.app.listener.DataSourceListener;
import com.crownmart.app.service.CartService;
import com.crownmart.app.service.OrderService;
import com.crownmart.app.service.ProductService;
import com.crownmart.app.service.UserService;

/**
 * Every controller servlet extends this to get access to the service layer,
 * wired against DAO interfaces (never concrete DB code) backed by the single
 * connection pool owned by {@link DataSourceListener}.
 */
public abstract class BaseServlet extends HttpServlet {

    protected UserService userService;
    protected ProductService productService;
    protected CartService cartService;
    protected OrderService orderService;

    @Override
    public void init() {
        DataSource dataSource = DataSourceListener.getDataSource(getServletContext());

        UserDao userDao = new JdbcUserDao(dataSource);
        ProductDao productDao = new JdbcProductDao(dataSource);
        CartDao cartDao = new JdbcCartDao(dataSource);
        OrderDao orderDao = new JdbcOrderDao(dataSource);

        this.userService = new UserService(userDao);
        this.productService = new ProductService(productDao);
        this.cartService = new CartService(cartDao, productDao);
        this.orderService = new OrderService(orderDao, cartDao, productDao);
    }
}
