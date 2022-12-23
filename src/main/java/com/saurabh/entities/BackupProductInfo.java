package com.saurabh.entities;



import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.*;
@Entity
public class BackupProductInfo {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int backupProductId;
	private int productId;
	private String productName;
	private String productDetaile;
	private double productPrice;
	private double productDiscount;
	private String mfDate;
	private String expireDate;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
private String productCompany;
	
	public String getProductCompany() {
		return productCompany;
	}
	public void setProductCompany(String productCompany) {
		this.productCompany = productCompany;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getImage4() {
		return image4;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	
	public int getProductId() {
		return productId;
	}
	public int getBackupProductId() {
		return backupProductId;
	}
	public void setBackupProductId(int backupProductId) {
		this.backupProductId = backupProductId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDetaile() {
		return productDetaile;
	}
	public void setProductDetaile(String productDetaile) {
		this.productDetaile = productDetaile;
	}
	public double getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}
	public double getProductDiscount() {
		return productDiscount;
	}
	public void setProductDiscount(double productDiscount) {
		this.productDiscount = productDiscount;
	}
	public String getMfDate() {
		return mfDate;
	}
	public void setMfDate(String mfDate) {
		this.mfDate = mfDate;
	}
	public String getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}
	
}
