package com.design.model;

import java.sql.Timestamp;

public class OrderTable {

	private int OrderID;
	private int UserID;
	private Timestamp OrderDate;
	private double TotalAmount;
	private String Status;
	private String PaymentMethod;
	private int RestaurantID;

	public OrderTable() {

	}

	public OrderTable(int UserID, double TotalAmount,
			String Status, String PaymentMethod,
			int RestaurantID) {

		this.UserID = UserID;
		this.TotalAmount = TotalAmount;
		this.Status = Status;
		this.PaymentMethod = PaymentMethod;
		this.RestaurantID = RestaurantID;
	}

	public OrderTable(int OrderID, int UserID,
			Timestamp OrderDate, double TotalAmount,
			String Status, String PaymentMethod,
			int RestaurantID) {

		this.OrderID = OrderID;
		this.UserID = UserID;
		this.OrderDate = OrderDate;
		this.TotalAmount = TotalAmount;
		this.Status = Status;
		this.PaymentMethod = PaymentMethod;
		this.RestaurantID = RestaurantID;
	}

	public int getOrderID() {
		return OrderID;
	}

	public void setOrderID(int orderID) {
		OrderID = orderID;
	}

	public int getUserID() {
		return UserID;
	}

	public void setUserID(int userID) {
		UserID = userID;
	}

	public Timestamp getOrderDate() {
		return OrderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		OrderDate = orderDate;
	}

	public double getTotalAmount() {
		return TotalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		TotalAmount = totalAmount;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getPaymentMethod() {
		return PaymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		PaymentMethod = paymentMethod;
	}

	public int getRestaurantID() {
		return RestaurantID;
	}

	public void setRestaurantID(int restaurantID) {
		RestaurantID = restaurantID;
	}

	@Override
	public String toString() {
		return "OrderTable [OrderID=" + OrderID +
				", UserID=" + UserID +
				", OrderDate=" + OrderDate +
				", TotalAmount=" + TotalAmount +
				", Status=" + Status +
				", PaymentMethod=" + PaymentMethod +
				", RestaurantID=" + RestaurantID + "]";
	}
}