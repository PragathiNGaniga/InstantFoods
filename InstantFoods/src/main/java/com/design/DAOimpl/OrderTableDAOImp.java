package com.design.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.design.dao.OrderTableDAO;
import com.design.model.OrderTable;
import com.design.utility.DBConnection;

public class OrderTableDAOImp implements OrderTableDAO {

	private static final String INSERT_QUERY =
			"INSERT INTO OrderTable(UserID,OrderDate,TotalAmount,Status,PaymentMethod,RestaurantID) VALUES(?,?,?,?,?,?)";

	private static final String UPDATE_QUERY =
			"UPDATE OrderTable SET UserID=?,OrderDate=?,TotalAmount=?,Status=?,PaymentMethod=?,RestaurantID=? WHERE OrderID=?";

	private static final String DELETE_QUERY =
			"DELETE FROM OrderTable WHERE OrderID=?";

	private static final String SELECT_QUERY =
			"SELECT * FROM OrderTable WHERE OrderID=?";

	private static final String SELECT_ALL =
			"SELECT * FROM OrderTable";

	
	@Override
	public int addOrder(OrderTable o) {

	    Connection connection = DBConnection.getConnection();

	    int generatedOrderId = 0;

	    try {

	        PreparedStatement pstmt =
	        connection.prepareStatement(
	                INSERT_QUERY,
	                Statement.RETURN_GENERATED_KEYS);

	        pstmt.setInt(1, o.getUserID());

	        pstmt.setTimestamp(2,
	                new Timestamp(System.currentTimeMillis()));

	        pstmt.setDouble(3, o.getTotalAmount());

	        pstmt.setString(4, o.getStatus());

	        pstmt.setString(5, o.getPaymentMethod());

	        pstmt.setInt(6, o.getRestaurantID());

	        pstmt.executeUpdate();

	        ResultSet rs = pstmt.getGeneratedKeys();

	        if(rs.next()) {

	            generatedOrderId = rs.getInt(1);

	        }

	    }

	    catch(SQLException e) {

	        e.printStackTrace();

	    }

	    return generatedOrderId;

	}

	@Override
	public void updateOrder(OrderTable o) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(UPDATE_QUERY);

			pstmt.setInt(1, o.getUserID());

			pstmt.setTimestamp(2,
					new Timestamp(System.currentTimeMillis()));

			pstmt.setDouble(3, o.getTotalAmount());

			pstmt.setString(4, o.getStatus());

			pstmt.setString(5, o.getPaymentMethod());

			pstmt.setInt(6, o.getRestaurantID());

			pstmt.setInt(7, o.getOrderID());

			pstmt.executeUpdate();

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrder(int OrderID) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, OrderID);

			pstmt.executeUpdate();

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public OrderTable getOrder(int OrderID) {

		Connection connection = DBConnection.getConnection();

		OrderTable order = null;

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(SELECT_QUERY);

			pstmt.setInt(1, OrderID);

			ResultSet res = pstmt.executeQuery();

			while(res.next()) {

				order = getResultOrderSet(res);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return order;
	}

	@Override
	public List<OrderTable> getAllOrder() {

		Connection connection = DBConnection.getConnection();

		List<OrderTable> list = new ArrayList<>();

		try {

			Statement stmt = connection.createStatement();

			ResultSet res = stmt.executeQuery(SELECT_ALL);

			while(res.next()) {

				OrderTable o =
						getResultOrderSet(res);

				list.add(o);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return list;
	}

	private static OrderTable getResultOrderSet(ResultSet res)
			throws SQLException {

		int OrderID =
				res.getInt("OrderID");

		int UserID =
				res.getInt("UserID");

		Timestamp OrderDate =
				res.getTimestamp("OrderDate");

		double TotalAmount =
				res.getDouble("TotalAmount");

		String Status =
				res.getString("Status");

		String PaymentMethod =
				res.getString("PaymentMethod");

		int RestaurantID =
				res.getInt("RestaurantID");

		return new OrderTable(
				OrderID,
				UserID,
				OrderDate,
				TotalAmount,
				Status,
				PaymentMethod,
				RestaurantID);
	}
}