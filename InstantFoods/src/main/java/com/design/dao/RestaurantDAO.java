package com.design.dao;

import java.util.List;
import com.design.model.Restaurant;

public interface RestaurantDAO {

	void addRestaurant(Restaurant r);

	void updateRestaurant(Restaurant r);

	void deleteRestaurant(int RestaurantID);

	Restaurant getRestaurant(int RestaurantID);

	List<Restaurant> getAllRestaurant();
}