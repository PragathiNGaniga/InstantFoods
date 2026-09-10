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
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private UserDAO dao;

	@Override
	public void init() throws ServletException {
		System.out.println("LoginServlet initialized!");
		    

		dao = new UserDAOImp();

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		String Email = request.getParameter("Email");
		String Password = request.getParameter("Password");
		

		System.out.println("Email = " + Email);
		System.out.println("Password = " + Password);

		User user = dao.getUserByEmail(Email);
		System.out.println(user);

		if (user != null && user.getPassword().equals(Password)) {

			HttpSession session = request.getSession();

			session.setAttribute("loggedInUser", user);

			response.sendRedirect("restaurants");

		}
		else {

			request.setAttribute("errorMessage",
					"Invalid Email or Password");

			request.getRequestDispatcher("login.jsp")
					.forward(request, response);

		}

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

}