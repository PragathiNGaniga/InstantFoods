package com.design.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.design.dao.MenuDAO;
import com.design.model.Menu;
import com.design.utility.DBConnection;

public class MenuDAOImp implements MenuDAO {

	private static final String INSERT_QUERY =
			"INSERT INTO Menu(RestaurantID,ItemName,Description,Price,IsAvailable,ImagePath) VALUES(?,?,?,?,?,?)";

	private static final String UPDATE_QUERY =
			"UPDATE Menu SET RestaurantID=?,ItemName=?,Description=?,Price=?,IsAvailable=?,ImagePath=? WHERE MenuID=?";

	private static final String DELETE_QUERY =
			"DELETE FROM Menu WHERE MenuID=?";

	private static final String SELECT_QUERY =
			"SELECT * FROM Menu WHERE MenuID=?";
	private static final String SELECT_BY_RESTAURANT =
			"SELECT * FROM Menu WHERE RestaurantID=?";

	private static final String SELECT_ALL =
			"SELECT * FROM Menu";

	@Override
	public void addMenu(Menu m) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(INSERT_QUERY);

			pstmt.setInt(1, m.getRestaurantID());
			pstmt.setString(2, m.getItemName());
			pstmt.setString(3, m.getDescription());
			pstmt.setDouble(4, m.getPrice());
			pstmt.setBoolean(5, m.isIsAvailable());
			pstmt.setString(6, m.getImagePath());

			int i = pstmt.executeUpdate();

			System.out.println(i);

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public void updateMenu(Menu m) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(UPDATE_QUERY);

			pstmt.setInt(1, m.getRestaurantID());
			pstmt.setString(2, m.getItemName());
			pstmt.setString(3, m.getDescription());
			pstmt.setDouble(4, m.getPrice());
			pstmt.setBoolean(5, m.isIsAvailable());
			pstmt.setString(6, m.getImagePath());
			pstmt.setInt(7, m.getMenuID());

			pstmt.executeUpdate();

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int MenuID) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, MenuID);

			pstmt.executeUpdate();

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	@Override
	public List<Menu> getMenuByRestaurant(int restaurantId) {

	    Connection connection = DBConnection.getConnection();

	    List<Menu> list = new ArrayList<>();

	    try {

	        PreparedStatement pstmt =
	                connection.prepareStatement(SELECT_BY_RESTAURANT);

	        pstmt.setInt(1, restaurantId);

	        ResultSet res = pstmt.executeQuery();

	        while(res.next()) {

	            list.add(getResultMenuSet(res));

	        }

	    }

	    catch(SQLException e) {

	        e.printStackTrace();

	    }

	    return list;
	}

	@Override
	public Menu getMenu(int MenuID) {

		Connection connection = DBConnection.getConnection();

		Menu menu = null;

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(SELECT_QUERY);

			pstmt.setInt(1, MenuID);

			ResultSet res = pstmt.executeQuery();

			while(res.next()) {

				menu = getResultMenuSet(res);
			}

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return menu;
	}

	@Override
	public List<Menu> getAllMenu() {

		Connection connection = DBConnection.getConnection();

		List<Menu> list = new ArrayList<>();

		try {

			Statement stmt = connection.createStatement();

			ResultSet res = stmt.executeQuery(SELECT_ALL);

			while(res.next()) {

				Menu m = getResultMenuSet(res);

				list.add(m);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return list;
	}

	private static Menu getResultMenuSet(ResultSet res)
			throws SQLException {

		int MenuID =
				res.getInt("MenuID");

		int RestaurantID =
				res.getInt("RestaurantID");

		String ItemName =
				res.getString("ItemName");

		String Description =
				res.getString("Description");

		double Price =
				res.getDouble("Price");

		boolean IsAvailable =
				res.getBoolean("IsAvailable");

		String ImagePath =
				res.getString("ImagePath");

		return new Menu(
				MenuID,
				RestaurantID,
				ItemName,
				Description,
				Price,
				IsAvailable,
				ImagePath);
	}
}