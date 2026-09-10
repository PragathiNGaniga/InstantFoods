package com.design.dao;

import java.util.List;

import com.design.model.Menu;

public interface MenuDAO {

	void addMenu(Menu m);

	void updateMenu(Menu m);

	void deleteMenu(int MenuID);

	Menu getMenu(int MenuID);
	
	
	List<Menu> getMenuByRestaurant(int restaurantId);
	
	List<Menu> getAllMenu();
}