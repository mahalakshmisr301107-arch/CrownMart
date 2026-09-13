package com.crownmart.app.dao;

import java.util.List;
import java.util.Optional;

import com.crownmart.app.model.Order;

public interface OrderDao {

    /** Persists the order and all of its order_items in a single transaction. */
    Order insertWithItems(Order order);

    Optional<Order> findByIdWithItems(long orderId);

    List<Order> findByBuyer(long buyerId);

    List<Order> findAll();
}