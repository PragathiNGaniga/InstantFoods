package com.design.controller;

import java.io.IOException;
import java.util.List;

import com.design.DAOimpl.RestaurantDAOImp;
import com.design.dao.RestaurantDAO;
import com.design.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private RestaurantDAO restaurantDAO;

	@Override
	public void init() throws ServletException {
		restaurantDAO = new RestaurantDAOImp();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Restaurant> restaurantList = restaurantDAO.getAllRestaurant();

		request.setAttribute("restaurantList", restaurantList);

		RequestDispatcher rd = request.getRequestDispatcher("/restaurant.jsp");
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}