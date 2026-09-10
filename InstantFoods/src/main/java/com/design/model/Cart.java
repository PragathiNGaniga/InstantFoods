package com.design.model;

public class Cart {

    private int MenuID;
    private int RestaurantID;
    private String ItemName;
    private double Price;
    private int Quantity;
    private String ImagePath;

    public Cart() {

    }

    public Cart(int MenuID,
                int RestaurantID,
                String ItemName,
                double Price,
                int Quantity,
                String ImagePath) {

        this.MenuID = MenuID;
        this.RestaurantID = RestaurantID;
        this.ItemName = ItemName;
        this.Price = Price;
        this.Quantity = Quantity;
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

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    public String getImagePath() {
        return ImagePath;
    }

    public void setImagePath(String imagePath) {
        ImagePath = imagePath;
    }

    public double getTotalPrice() {

        return Price * Quantity;

    }

    @Override
    public String toString() {

        return "Cart [MenuID=" + MenuID
                + ", RestaurantID=" + RestaurantID
                + ", ItemName=" + ItemName
                + ", Price=" + Price
                + ", Quantity=" + Quantity
                + ", ImagePath=" + ImagePath + "]";
    }

}