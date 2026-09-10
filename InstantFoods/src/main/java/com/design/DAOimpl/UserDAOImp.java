package com.design.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.design.dao.UserDAO;
import com.design.model.User;
import com.design.utility.DBConnection;

public class UserDAOImp implements UserDAO{
	private static final String INSERT_QUERY="INSERT INTO user(Username,Password,Email,Address,Role,LastLoginDate)"
			+ "VALUES(?,?,?,?,?,?)";
	private static final String UPDATE_QUERY="UPDATE user SET Username=?,Password=?,Email=?,Address=?,Role=?,LastLoginDate=? WHERE UserID=? ";
	private static final String SELECT_QUERY="SELECT * FROM user WHERE UserID=?";
	private static final String DELETE_QUERY="DELETE FROM user WHERE UserID=?";
	private static final String SELECT_ALL="SELECT * FROM user";
	private static final String SELECT_BY_EMAIL = "SELECT * FROM User WHERE Email=?";

	@Override
	public void addUser(User u) {
		Connection connection=DBConnection.getConnection();
		try {
		PreparedStatement pstmt=connection.prepareStatement(INSERT_QUERY);
		pstmt.setString(1, u.getUsername());
		pstmt.setString(2, u.getPassword());
		pstmt.setString(3,u.getEmail());
		pstmt.setString(4, u.getAddress());
		pstmt.setString(5, u.getRole());
		pstmt.setTimestamp(6,new Timestamp(System.currentTimeMillis()));
		int i=pstmt.executeUpdate();
		System.out.println(i);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		
		
	}

	@Override
	public void updateUser(User u) {
		Connection connection=DBConnection.getConnection();
		try
		{
			PreparedStatement pstmt=connection.prepareStatement(UPDATE_QUERY);
			pstmt.setString(1, u.getUsername());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getEmail());
			pstmt.setString(4, u.getAddress());
			
			pstmt.setString(5, u.getRole());
			pstmt.setTimestamp(6,new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(7, u.getUserID());
			int i=pstmt.executeUpdate();
			
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteUser(int id) {
		 Connection connection = DBConnection.getConnection();

		 try {

			 PreparedStatement pstmt =
			 connection.prepareStatement(DELETE_QUERY);

		     pstmt.setInt(1, id);

		     pstmt.executeUpdate();

		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		
		
	}

	@Override
	public User getUser(int id) {
		Connection connection=DBConnection.getConnection();
		User u=null;
		try
		{
			PreparedStatement pstmt=connection.prepareStatement(SELECT_QUERY);
			pstmt.setInt(1,id);
			ResultSet res=pstmt.executeQuery();
			while(res.next())
			{
				u=getResultUserSet(res);
			}
			
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return u;
	}
	
	@Override
	public User getUserByEmail(String Email) {

		Connection connection = DBConnection.getConnection();

		User user = null;

		try {

			PreparedStatement pstmt =
					connection.prepareStatement(SELECT_BY_EMAIL);

			pstmt.setString(1, Email);

			ResultSet res = pstmt.executeQuery();

			if (res.next()) {

				user = getResultUserSet(res);

			}

		}
		catch (SQLException e) {

			e.printStackTrace();

		}

		return user;

	}

	@Override
	public List<User> getAllUser() {
		Connection connection=DBConnection.getConnection();
		List<User> list=new ArrayList<User>();
		try {
			
		
			Statement stmt=connection.createStatement();
			ResultSet res=stmt.executeQuery(SELECT_ALL);
			while(res.next())
			{
				User u=getResultUserSet(res);
				list.add(u);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return list;
	}
	private static User getResultUserSet(ResultSet res) throws SQLException
	{
		int UserID=res.getInt("UserID"); 
		String Username=res.getString("Username");
		String Password=res.getString("Password");
		String Email=res.getString("Email");
		String Address=res.getString("Address");
		String Role=res.getString("Role");
		Timestamp CreatedDate=res.getTimestamp("CreatedDate");
		Timestamp LastLoginDate=res.getTimestamp("LastLoginDate");
		User u=new User(UserID,Username,Password,Email,Address,Role,CreatedDate,LastLoginDate);
		return u;
		
		
	}

}
