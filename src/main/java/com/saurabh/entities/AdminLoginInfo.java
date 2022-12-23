package com.saurabh.entities;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.*;

@Entity
public class AdminLoginInfo {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	private int adminId;
	private String name;
	private String email;
	private String password;
	
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int geAdminId() {
		// TODO Auto-generated method stub
		return adminId;
	}

}
