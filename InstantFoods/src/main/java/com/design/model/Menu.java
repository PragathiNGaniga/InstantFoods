package com.design.model;

public class Menu {

	private int MenuID;
	private int RestaurantID;
	private String ItemName;
	private String Description;
	private double Price;
	private boolean IsAvailable;
	private String ImagePath;

	public Menu() {

	}

	public Menu(int RestaurantID, String ItemName,
			String Description, double Price,
			boolean IsAvailable, String ImagePath) {

		this.RestaurantID = RestaurantID;
		this.ItemName = ItemName;
		this.Description = Description;
		this.Price = Price;
		this.IsAvailable = IsAvailable;
		this.ImagePath = ImagePath;
	}

	public Menu(int MenuID, int RestaurantID,
			String ItemName, String Description,
			double Price, boolean IsAvailable,
			String ImagePath) {

		this.MenuID = MenuID;
		this.RestaurantID = RestaurantID;
		this.ItemName = ItemName;
		this.Description = Description;
		this.Price = Price;
		this.IsAvailable = IsAvailable;
		this.ImagePath = ImagePath;
	}

	public int getMenuID() {
		return MenuID;
	}

	public void setMenuID(int menuID) {
		MenuID = menuID;
	}

	public int getRestaurantID() {
		return RestaurantID;
	}

	public void setRestaurantID(int restaurantID) {
		RestaurantID = restaurantID;
	}

	public String getItemName() {
		return ItemName;
	}

	public void setItemName(String itemName) {
		ItemName = itemName;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public double getPrice() {
		return Price;
	}

	public void setPrice(double price) {
		Price = price;
	}

	public boolean isIsAvailable() {
		return IsAvailable;
	}

	public void setIsAvailable(boolean isAvailable) {
		IsAvailable = isAvailable;
	}

	public String getImagePath() {
		return ImagePath;
	}

	public void setImagePath(String imagePath) {
		ImagePath = imagePath;
	}

	@Override
	public String toString() {
		return "Menu [MenuID=" + MenuID
				+ ", RestaurantID=" + RestaurantID
				+ ", ItemName=" + ItemName
				+ ", Description=" + Description
				+ ", Price=" + Price
				+ ", IsAvailable=" + IsAvailable
				+ ", ImagePath=" + ImagePath + "]";
	}
}