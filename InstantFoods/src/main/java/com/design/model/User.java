package com.design.model;

import java.sql.Timestamp;

public class User {

    private int UserID;
    private String Username;
    private String Password;
    private String Email;
    private String Address;
    private String Role;
    private Timestamp CreatedDate;
    private Timestamp LastLoginDate;

    public User() {
    }

    public User(String Username,String Password,
            String Email,String Address,String Role) {

        this.Username = Username;
        this.Password = Password;
        this.Email = Email;
        this.Address = Address;
        this.Role = Role;
    }

    public User(int UserID,String Username,String Password,
            String Email,String Address,String Role,
            Timestamp CreatedDate,
            Timestamp LastLoginDate) {

        this.UserID = UserID;
        this.Username = Username;
        this.Password = Password;
        this.Email = Email;
        this.Address = Address;
        this.Role = Role;
        this.CreatedDate = CreatedDate;
        this.LastLoginDate = LastLoginDate;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String role) {
        Role = role;
    }

    public Timestamp getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        CreatedDate = createdDate;
    }

    public Timestamp getLastLoginDate() {
        return LastLoginDate;
    }

    public void setLastLoginDate(Timestamp lastLoginDate) {
        LastLoginDate = lastLoginDate;
    }
    @Override
	public String toString() {
		return "User [id=" + UserID + ", name=" + Username + ", password=" + Password + ", email=" + Email + ", address="
				+ Address + ",role=" + Role + ", created_date=" + CreatedDate + ", last_login=" + LastLoginDate + "]";
	}
	
    
}