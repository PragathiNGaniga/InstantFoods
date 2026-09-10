package com.design.dao;

import java.util.List;

import com.design.model.User;

public interface UserDAO {
	void addUser(User u);
	void updateUser(User u);
	void deleteUser(int UserID);
	User getUser(int UserID);
	User getUserByEmail(String Email);
	List<User>getAllUser();

}
