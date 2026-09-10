package com.design.controller;

import java.io.IOException;

import com.design.DAOimpl.UserDAOImp;
import com.design.dao.UserDAO;
import com.design.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO dao = new UserDAOImp();

        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");
        String Email = request.getParameter("Email");
        String Address = request.getParameter("Address");
        String Role = request.getParameter("Role");

        User user = new User();

        user.setUsername(Username);
        user.setPassword(Password);
        user.setEmail(Email);
        user.setAddress(Address);
        user.setRole(Role);

        dao.addUser(user);

        response.sendRedirect("login.jsp");
    }
}
