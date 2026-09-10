package com.design.controller;

import java.io.IOException;
import java.util.List;

import com.design.DAOimpl.MenuDAOImp;
import com.design.DAOimpl.RestaurantDAOImp;
import com.design.dao.MenuDAO;
import com.design.dao.RestaurantDAO;
import com.design.model.Menu;
import com.design.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MenuDAO menuDAO;
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {

        menuDAO = new MenuDAOImp();
        restaurantDAO = new RestaurantDAOImp();

    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int restaurantId =
                Integer.parseInt(request.getParameter("restaurantId"));

        // Fetch Restaurant Details
        Restaurant restaurant =
                restaurantDAO.getRestaurant(restaurantId);

        // Fetch Menu Items
        List<Menu> menuList =
                menuDAO.getMenuByRestaurant(restaurantId);

        // Send data to JSP
        request.setAttribute("restaurant", restaurant);
        request.setAttribute("menuList", menuList);

        request.getRequestDispatcher("menu.jsp")
                .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }
}