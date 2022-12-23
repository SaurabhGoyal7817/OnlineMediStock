package com.saurabh.entities;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.*;
@Entity
public class ClientPaymentInfo {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int clientPaymentId;
	private int clientId;
	private int productId;
	private double amount;
	private String status;
	private String mode;
	private String date;
	public int getClientPaymentId() {
		return clientPaymentId;
	}
	public void setClientPaymentId(int clientPaymentId) {
		this.clientPaymentId = clientPaymentId;
	}
	public int getClientId() {
		return clientId;
	}
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	

}
