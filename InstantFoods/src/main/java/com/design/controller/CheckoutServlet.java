package com.design.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.design.model.Cart;
import com.design.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        /*
         * User not logged in
         */

        if(session == null ||
                session.getAttribute("loggedInUser") == null) {

            response.sendRedirect("login.jsp");

            return;

        }

        /*
         * Cart not available
         */

        ArrayList<Cart> cartList =
                (ArrayList<Cart>) session.getAttribute("cart");

        if(cartList == null || cartList.isEmpty()) {

            response.sendRedirect("cart.jsp");

            return;

        }

        User user =
                (User) session.getAttribute("loggedInUser");

        request.setAttribute("user", user);

        request.setAttribute("cartList", cartList);

        double grandTotal = 0;

        for(Cart cart : cartList) {

            grandTotal += cart.getTotalPrice();

        }

        request.setAttribute("grandTotal", grandTotal);

        request.getRequestDispatcher("checkout.jsp")
               .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }

}