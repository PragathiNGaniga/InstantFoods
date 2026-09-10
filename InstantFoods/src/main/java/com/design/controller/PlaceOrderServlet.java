package com.design.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.design.DAOimpl.OrderItemDAOImp;
import com.design.DAOimpl.OrderTableDAOImp;
import com.design.dao.OrderItemDAO;
import com.design.dao.OrderTableDAO;
import com.design.model.Cart;
import com.design.model.OrderItem;
import com.design.model.OrderTable;
import com.design.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private OrderTableDAO orderDAO;
    private OrderItemDAO orderItemDAO;

    @Override
    public void init() throws ServletException {

        orderDAO = new OrderTableDAOImp();
        orderItemDAO = new OrderItemDAOImp();

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("PlaceOrderServlet doPost called");

        HttpSession session = request.getSession(false);

        // User not logged in
        if (session == null || session.getAttribute("loggedInUser") == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        // Cart empty
        ArrayList<Cart> cartList =
                (ArrayList<Cart>) session.getAttribute("cart");

        if (cartList == null || cartList.isEmpty()) {

            response.sendRedirect("cart.jsp");
            return;

        }

        User user =
                (User) session.getAttribute("loggedInUser");

        // Calculate Grand Total
        double grandTotal = 0;

        for (Cart cart : cartList) {

            grandTotal += cart.getTotalPrice();

        }

        // Since your cart allows only one restaurant
        int restaurantId =
                cartList.get(0).getRestaurantID();

        // Payment Method from checkout.jsp
        String paymentMethod =
                request.getParameter("paymentMethod");

        if (paymentMethod == null || paymentMethod.trim().isEmpty()) {

            paymentMethod = "Cash";

        }

        // Create Order
        OrderTable order = new OrderTable(

                user.getUserID(),

                grandTotal,

                "Pending",

                paymentMethod,

                restaurantId

        );

        // Save Order and get generated OrderID
        int orderId = orderDAO.addOrder(order);

        if (orderId <= 0) {

            response.sendRedirect("checkout.jsp");
            return;

        }

        // Save each cart item
        for (Cart cart : cartList) {

            OrderItem orderItem = new OrderItem(

                    orderId,

                    cart.getQuantity(),

                    cart.getTotalPrice(),

                    cart.getMenuID()

            );

            orderItemDAO.addOrderItem(orderItem);

        }

        // Clear Cart
        session.removeAttribute("cart");
        System.out.println("Redirecting to: "
                + request.getContextPath()
                + "/orderSuccess.jsp?orderId=" + orderId);

        // Redirect to Success Page
        response.sendRedirect(request.getContextPath()
                + "/orderSuccess.jsp?orderId=" + orderId);
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);

    }

}