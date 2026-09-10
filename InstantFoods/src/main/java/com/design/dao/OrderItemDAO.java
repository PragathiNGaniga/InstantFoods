package com.design.dao;

import java.util.List;

import com.design.model.OrderItem;

public interface OrderItemDAO {

	void addOrderItem(OrderItem oi);

	void updateOrderItem(OrderItem oi);

	void deleteOrderItem(int OrderItemID);

	OrderItem getOrderItem(int OrderItemID);

	List<OrderItem> getAllOrderItem();
}