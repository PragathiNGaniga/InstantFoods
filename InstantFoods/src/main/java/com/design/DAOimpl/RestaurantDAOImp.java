package com.design.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.design.dao.RestaurantDAO;
import com.design.model.Restaurant;
import com.design.utility.DBConnection;

public class RestaurantDAOImp implements RestaurantDAO {

	private static final String INSERT_QUERY =
			"INSERT INTO Restaurant(Name,CuisineType,DeliveryTime,Address,Rating,IsActive,ImagePath) VALUES(?,?,?,?,?,?,?)";

	private static final String UPDATE_QUERY =
			"UPDATE Restaurant SET Name=?,CuisineType=?,DeliveryTime=?,Address=?,Rating=?,IsActive=?,ImagePath=? WHERE RestaurantID=?";

	private static final String DELETE_QUERY =
			"DELETE FROM Restaurant WHERE RestaurantID=?";

	private static final String SELECT_QUERY =
			"SELECT * FROM Restaurant WHERE RestaurantID=?";

	private static final String SELECT_ALL =
			"SELECT * FROM Restaurant";

	@Override
	public void addRestaurant(Restaurant r) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(INSERT_QUERY);

			pstmt.setString(1, r.getName());
			pstmt.setString(2, r.getCuisineType());
			pstmt.setInt(3, r.getDeliveryTime());
			pstmt.setString(4, r.getAddress());
			pstmt.setDouble(5, r.getRating());
			pstmt.setBoolean(6, r.isIsActive());
			pstmt.setString(7, r.getImagePath());

			int i = pstmt.executeUpdate();

			System.out.println(i);

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public void updateRestaurant(Restaurant r) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(UPDATE_QUERY);

			pstmt.setString(1, r.getName());
			pstmt.setString(2, r.getCuisineType());
			pstmt.setInt(3, r.getDeliveryTime());
			pstmt.setString(4, r.getAddress());
			pstmt.setDouble(5, r.getRating());
			pstmt.setBoolean(6, r.isIsActive());
			pstmt.setString(7, r.getImagePath());
			pstmt.setInt(8, r.getRestaurantID());

			pstmt.executeUpdate();

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRestaurant(int RestaurantID) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, RestaurantID);

			pstmt.executeUpdate();

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public Restaurant getRestaurant(int RestaurantID) {

		Connection connection = DBConnection.getConnection();

		Restaurant restaurant = null;

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(SELECT_QUERY);

			pstmt.setInt(1, RestaurantID);

			ResultSet res = pstmt.executeQuery();

			while(res.next()) {

				restaurant = getResultRestaurantSet(res);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return restaurant;
	}

	@Override
	public List<Restaurant> getAllRestaurant() {

		Connection connection = DBConnection.getConnection();

		List<Restaurant> list = new ArrayList<>();

		try {

			Statement stmt = connection.createStatement();

			ResultSet res = stmt.executeQuery(SELECT_ALL);

			while(res.next()) {

				Restaurant r =
						getResultRestaurantSet(res);

				list.add(r);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return list;
	}

	private static Restaurant getResultRestaurantSet(ResultSet res)
			throws SQLException {

		int RestaurantID =
				res.getInt("RestaurantID");

		String Name =
				res.getString("Name");

		String CuisineType =
				res.getString("CuisineType");

		int DeliveryTime =
				res.getInt("DeliveryTime");

		String Address =
				res.getString("Address");

		double Rating =
				res.getDouble("Rating");

		boolean IsActive =
				res.getBoolean("IsActive");

		String ImagePath =
				res.getString("ImagePath");

		return new Restaurant(
				RestaurantID,
				Name,
				CuisineType,
				DeliveryTime,
				Address,
				Rating,
				IsActive,
				ImagePath);
	}
}