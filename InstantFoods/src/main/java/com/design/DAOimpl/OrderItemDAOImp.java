package com.design.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.design.dao.OrderItemDAO;
import com.design.model.OrderItem;
import com.design.utility.DBConnection;

public class OrderItemDAOImp implements OrderItemDAO {

	private static final String INSERT_QUERY =
			"INSERT INTO OrderItem(OrderID,Quantity,ItemTotal,MenuID) VALUES(?,?,?,?)";

	private static final String UPDATE_QUERY =
			"UPDATE OrderItem SET OrderID=?,Quantity=?,ItemTotal=?,MenuID=? WHERE OrderItemID=?";

	private static final String DELETE_QUERY =
			"DELETE FROM OrderItem WHERE OrderItemID=?";

	private static final String SELECT_QUERY =
			"SELECT * FROM OrderItem WHERE OrderItemID=?";

	private static final String SELECT_ALL =
			"SELECT * FROM OrderItem";

	@Override
	public void addOrderItem(OrderItem oi) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(INSERT_QUERY);

			pstmt.setInt(1, oi.getOrderID());
			pstmt.setInt(2, oi.getQuantity());
			pstmt.setDouble(3, oi.getItemTotal());
			pstmt.setInt(4, oi.getMenuID());

			int i = pstmt.executeUpdate();

			System.out.println(i);

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public void updateOrderItem(OrderItem oi) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(UPDATE_QUERY);

			pstmt.setInt(1, oi.getOrderID());
			pstmt.setInt(2, oi.getQuantity());
			pstmt.setDouble(3, oi.getItemTotal());
			pstmt.setInt(4, oi.getMenuID());
			pstmt.setInt(5, oi.getOrderItemID());

			pstmt.executeUpdate();

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderItem(int OrderItemID) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, OrderItemID);

			pstmt.executeUpdate();

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public OrderItem getOrderItem(int OrderItemID) {

		Connection connection = DBConnection.getConnection();

		OrderItem orderItem = null;

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(SELECT_QUERY);

			pstmt.setInt(1, OrderItemID);

			ResultSet res = pstmt.executeQuery();

			while(res.next()) {

				orderItem = getResultOrderItemSet(res);
			}

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return orderItem;
	}

	@Override
	public List<OrderItem> getAllOrderItem() {

		Connection connection = DBConnection.getConnection();

		List<OrderItem> list = new ArrayList<>();

		try {

			Statement stmt = connection.createStatement();

			ResultSet res = stmt.executeQuery(SELECT_ALL);

			while(res.next()) {

				OrderItem oi =
						getResultOrderItemSet(res);

				list.add(oi);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return list;
	}

	private static OrderItem getResultOrderItemSet(ResultSet res)
			throws SQLException {

		int OrderItemID =
				res.getInt("OrderItemID");

		int OrderID =
				res.getInt("OrderID");

		int Quantity =
				res.getInt("Quantity");

		double ItemTotal =
				res.getDouble("ItemTotal");

		int MenuID =
				res.getInt("MenuID");

		return new OrderItem(
				OrderItemID,
				OrderID,
				Quantity,
				ItemTotal,
				MenuID);
	}
}