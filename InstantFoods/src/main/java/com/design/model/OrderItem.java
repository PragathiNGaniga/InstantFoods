package com.design.model;

public class OrderItem {

	private int OrderItemID;
	private int OrderID;
	private int Quantity;
	private double ItemTotal;
	private int MenuID;

	public OrderItem() {

	}

	public OrderItem(int OrderID, int Quantity,
			double ItemTotal, int MenuID) {

		this.OrderID = OrderID;
		this.Quantity = Quantity;
		this.ItemTotal = ItemTotal;
		this.MenuID = MenuID;
	}

	public OrderItem(int OrderItemID, int OrderID,
			int Quantity, double ItemTotal,
			int MenuID) {

		this.OrderItemID = OrderItemID;
		this.OrderID = OrderID;
		this.Quantity = Quantity;
		this.ItemTotal = ItemTotal;
		this.MenuID = MenuID;
	}

	public int getOrderItemID() {
		return OrderItemID;
	}

	public void setOrderItemID(int orderItemID) {
		OrderItemID = orderItemID;
	}

	public int getOrderID() {
		return OrderID;
	}

	public void setOrderID(int orderID) {
		OrderID = orderID;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public double getItemTotal() {
		return ItemTotal;
	}

	public void setItemTotal(double itemTotal) {
		ItemTotal = itemTotal;
	}

	public int getMenuID() {
		return MenuID;
	}

	public void setMenuID(int menuID) {
		MenuID = menuID;
	}

	@Override
	public String toString() {
		return "OrderItem [OrderItemID=" + OrderItemID
				+ ", OrderID=" + OrderID
				+ ", Quantity=" + Quantity
				+ ", ItemTotal=" + ItemTotal
				+ ", MenuID=" + MenuID + "]";
	}
}