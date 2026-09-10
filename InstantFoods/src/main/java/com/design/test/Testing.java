package com.design.test;
import java.util.List;
import java.util.Scanner;
import com.design.DAOimpl.UserDAOImp;
import com.design.model.User;

public class Testing {
	public static void main(String args[])
	{//this is connection testing
		//Connection connection=DBConnection.getConnection();
		//System.out.println("Connection is done");
		
		//this is addUser testing
		Scanner scan=new Scanner(System.in);
		
		System.out.println("Entr thr name:");
		String name=scan.next();
		System.out.println("Enter the password:");
		String password=scan.next();
		System.out.println("Enter the email:");
		String email=scan.next();
		System.out.println("Enter the address:");
		String address=scan.next();
		System.out.println("Enter the role:");
		String role=scan.next();
		User u=new User(name,password,email,address,role);
		UserDAOImp udao=new UserDAOImp();
		udao.addUser(u);
		System.out.println("User Add");
		
		//this is to get a user
		//UserDAoImpl udao=new UserDAoImpl();
		//User u=udao.getUser(1);
		//System.out.println(u);
		
		//this is to get all user
		// udao=new UserDAoImpl();
		//List<User> allUser=udao.getAllUser();
		//for(User user:allUser)
		//{
			//System.out.println(user);
		//}
		//This is to update
		//UserDAoImpl udao=new UserDAoImpl();
		//System.out.println("Enter the id:");
		//int id=scan.nextInt();
		//User u=udao.getUser(id);
		//System.out.println(u);
		//u.setAddress("Gurugram");
		//udao.updateUser(u);
		//System.out.println(u);
		
		
		
		
	}

}
