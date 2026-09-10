package com.design.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.design.DAOimpl.MenuDAOImp;
import com.design.dao.MenuDAO;
import com.design.model.Cart;
import com.design.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MenuDAO menuDAO;

    @Override
    public void init() throws ServletException {

        menuDAO = new MenuDAOImp();

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        ArrayList<Cart> cartList =
                (ArrayList<Cart>) session.getAttribute("cart");

        if (cartList == null) {

            cartList = new ArrayList<Cart>();

        }

        String action = request.getParameter("action");

        if (action == null) {

            action = "add";

        }

        switch(action) {

        case "add":

            addItem(request, cartList);

            break;

        case "remove":

            removeItem(request, cartList);

            break;

        case "increase":

            increaseQuantity(request, cartList);

            break;

        case "decrease":

            decreaseQuantity(request, cartList);

            break;

        }

        session.setAttribute("cart", cartList);

        response.sendRedirect("cart.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("cart.jsp");

    }

    private void addItem(HttpServletRequest request,
            ArrayList<Cart> cartList) {

        int menuId =
                Integer.parseInt(request.getParameter("menuId"));

        Menu menu = menuDAO.getMenu(menuId);

        if(menu == null) {

            return;

        }

        /*
         * Allow items from only one restaurant
         */

        if(!cartList.isEmpty()) {

            int currentRestaurant =
                    cartList.get(0).getRestaurantID();

            if(currentRestaurant != menu.getRestaurantID()) {

                cartList.clear();

            }

        }

        /*
         * Already exists?
         */

        for(Cart cart : cartList) {

            if(cart.getMenuID() == menuId) {

                cart.setQuantity(cart.getQuantity() + 1);

                return;

            }

        }

        Cart cart = new Cart(

                menu.getMenuID(),

                menu.getRestaurantID(),

                menu.getItemName(),

                menu.getPrice(),

                1,

                menu.getImagePath()

        );

        cartList.add(cart);

    }

    private void removeItem(HttpServletRequest request,
            ArrayList<Cart> cartList) {

        int menuId =
                Integer.parseInt(request.getParameter("menuId"));

        cartList.removeIf(cart ->
                cart.getMenuID() == menuId);

    }

    private void increaseQuantity(HttpServletRequest request,
            ArrayList<Cart> cartList) {

        int menuId =
                Integer.parseInt(request.getParameter("menuId"));

        for(Cart cart : cartList) {

            if(cart.getMenuID() == menuId) {

                cart.setQuantity(cart.getQuantity() + 1);

                return;

            }

        }

    }

    private void decreaseQuantity(HttpServletRequest request,
            ArrayList<Cart> cartList) {

        int menuId =
                Integer.parseInt(request.getParameter("menuId"));

        for(int i = 0; i < cartList.size(); i++) {

            Cart cart = cartList.get(i);

            if(cart.getMenuID() == menuId) {

                if(cart.getQuantity() > 1) {

                    cart.setQuantity(cart.getQuantity() - 1);

                }
                else {

                    cartList.remove(i);

                }

                return;

            }

        }

    }

}