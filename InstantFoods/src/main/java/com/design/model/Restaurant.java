package com.design.model;

public class Restaurant {

	private int RestaurantID;
	private String Name;
	private String CuisineType;
	private int DeliveryTime;
	private String Address;
	private double Rating;
	private boolean IsActive;
	private String ImagePath;

	public Restaurant() {

	}

	public Restaurant(String Name, String CuisineType, int DeliveryTime,
			String Address, double Rating,
			boolean IsActive, String ImagePath) {

		this.Name = Name;
		this.CuisineType = CuisineType;
		this.DeliveryTime = DeliveryTime;
		this.Address = Address;
		this.Rating = Rating;
		this.IsActive = IsActive;
		this.ImagePath = ImagePath;
	}

	public Restaurant(int RestaurantID, String Name,
			String CuisineType, int DeliveryTime,
			String Address, double Rating,
			boolean IsActive, String ImagePath) {

		this.RestaurantID = RestaurantID;
		this.Name = Name;
		this.CuisineType = CuisineType;
		this.DeliveryTime = DeliveryTime;
		this.Address = Address;
		this.Rating = Rating;
		this.IsActive = IsActive;
		this.ImagePath = ImagePath;
	}

	public int getRestaurantID() {
		return RestaurantID;
	}

	public void setRestaurantID(int restaurantID) {
		RestaurantID = restaurantID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getCuisineType() {
		return CuisineType;
	}

	public void setCuisineType(String cuisineType) {
		CuisineType = cuisineType;
	}

	public int getDeliveryTime() {
		return DeliveryTime;
	}

	public void setDeliveryTime(int deliveryTime) {
		DeliveryTime = deliveryTime;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public double getRating() {
		return Rating;
	}

	public void setRating(double rating) {
		Rating = rating;
	}

	public boolean isIsActive() {
		return IsActive;
	}

	public void setIsActive(boolean isActive) {
		IsActive = isActive;
	}

	public String getImagePath() {
		return ImagePath;
	}

	public void setImagePath(String imagePath) {
		ImagePath = imagePath;
	}

	@Override
	public String toString() {
		return "Restaurant [RestaurantID=" + RestaurantID
				+ ", Name=" + Name
				+ ", CuisineType=" + CuisineType
				+ ", DeliveryTime=" + DeliveryTime
				+ ", Address=" + Address
				+ ", Rating=" + Rating
				+ ", IsActive=" + IsActive
				+ ", ImagePath=" + ImagePath + "]";
	}
}