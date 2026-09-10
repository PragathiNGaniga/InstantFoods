package com.design.dao;

import java.util.List;

import com.design.model.OrderTable;

public interface OrderTableDAO {

	int addOrder(OrderTable o);

	void updateOrder(OrderTable o);

	void deleteOrder(int OrderID);

	OrderTable getOrder(int OrderID);

	List<OrderTable> getAllOrder();
}