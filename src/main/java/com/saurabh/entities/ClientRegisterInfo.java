package com.saurabh.entities;


import javax.persistence.*;

@Entity
public class ClientRegisterInfo {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int clientId;
	private String firstName;
	private String lastName;
	private String email;
	private long phone;
	private String location;
	private String gender;
	private String password;
	private String type;
	
	
public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

public ClientRegisterInfo() {
		// TODO Auto-generated constructor stub
	}

}
