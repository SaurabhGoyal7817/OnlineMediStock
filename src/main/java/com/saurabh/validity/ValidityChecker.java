package com.saurabh.validity;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.saurabh.entities.*;
import com.saurabh.utility.ConnectionProvider;

public class ValidityChecker {
	
	

	public static final ValidityChecker getValidityChecker() {
		return new ValidityChecker();
	}

	

	public ValidityChecker() {
	}

	public boolean saveClientInfo(ClientRegisterInfo cri) {
		
		boolean flag=false;
		Session session=ConnectionProvider.getSession();
		try {
		Transaction tx=session.beginTransaction();
		
		session.save(cri);
		tx.commit();
		session.close();
		flag=true;
		}catch(Exception e)
		{
			session.close();
		}
		return flag;
	}


	public boolean saveProductInfo(AddProductInfo api) {
		boolean flag=false;
		Session session=ConnectionProvider.getSession();
		try {
		Transaction tx=session.beginTransaction();
		
		session.save(api);
		tx.commit();
		session.close();
		flag=true;
		}catch(Exception e)
		{
			session.close();
		}
		return flag;
		
	}
	public boolean saveBackupClient(BackupClientInfo bcf) {
		boolean flag=false;
		Session session=ConnectionProvider.getSession();
		try {
		Transaction tx=session.beginTransaction();
		
		session.save(bcf);
		tx.commit();
		session.close();
		flag=true;
		}catch(Exception e)
		{
			session.close();
		}
		return flag;
	}
	
	public boolean updateClientInfo(ClientRegisterInfo cri, int i) {
		boolean flag=false;
		Session session=ConnectionProvider.getSession();
		try {
		ClientRegisterInfo cri2=(ClientRegisterInfo)session.get(ClientRegisterInfo.class, i);
		Transaction tx=session.beginTransaction();
		cri2.setFirstName(cri.getFirstName());
		cri2.setLastName(cri.getLastName());
		cri2.setEmail(cri.getEmail());
		cri2.setPhone(cri.getPhone());
		cri2.setGender(cri.getGender());
		cri2.setLocation(cri.getLocation());
		cri2.setPassword(cri.getPassword());
		tx.commit();
		session.close();
		flag=true;
		}catch(Exception e)
		{
			session.close();
		}
		return flag;
	}
	

	public boolean deleteProduct(int parseInt) 
	{
		Session session=ConnectionProvider.getSession();
		
		AddProductInfo api=(AddProductInfo)session.get(AddProductInfo.class, parseInt);
		
		BackupProductInfo bpi=new BackupProductInfo();
		
		bpi.setProductName(api.getProductName());
		bpi.setProductDetaile(api.getProductDetaile());
		bpi.setProductCompany(api.getProductCompany());
		bpi.setProductPrice(api.getProductPrice());
		bpi.setProductDiscount(api.getProductDiscount());
		bpi.setExpireDate(api.getExpireDate());
		bpi.setMfDate(api.getMfDate());
		bpi.setProductId(api.getProductId());
		bpi.setImage1(api.getImage1());
		bpi.setImage2(api.getImage2());
		bpi.setImage3(api.getImage3());
		bpi.setImage4(api.getImage4());
		boolean flag=false;
		
		try {
		Transaction tx=session.beginTransaction();
		session.save(bpi);
		
		session.delete(api);
		tx.commit();
		session.close();
		flag=true;
		}catch(Exception e)
		{
			session.close();
		}
		return flag;
		
		
		
	}

	public boolean restoreProduct(int parseInt) {
Session session=ConnectionProvider.getSession();
		
		BackupProductInfo api=(BackupProductInfo)session.get(BackupProductInfo.class, parseInt);
		boolean flag=false;
		AddProductInfo bpi=new AddProductInfo();
		bpi.setProductName(api.getProductName());
		bpi.setProductDetaile(api.getProductDetaile());
		bpi.setProductCompany(api.getProductCompany());
		bpi.setProductPrice(api.getProductPrice());
		bpi.setProductDiscount(api.getProductDiscount());
		bpi.setExpireDate(api.getExpireDate());
		bpi.setMfDate(api.getMfDate());
		bpi.setImage1(api.getImage1());
		bpi.setImage2(api.getImage2());
		bpi.setImage3(api.getImage3());
		bpi.setImage4(api.getImage4());
		try {
		Transaction tx=session.beginTransaction();
		session.save(bpi);
		session.delete(api);
		tx.commit();
		session.close();
		flag=true;
		}catch(Exception e)
		{
			session.close();
		}
		return flag;
		
	}


	public boolean deletePerProduct(int parseInt) {
		Session session=ConnectionProvider.getSession();
		
		BackupProductInfo bpi=(BackupProductInfo)session.get(BackupProductInfo.class, parseInt);
		boolean flag=false;
		
		try {
		Transaction tx=session.beginTransaction();
		session.delete(bpi);
		tx.commit();
		session.close();
		flag=true;
		}catch(Exception e)
		{
			session.close();
		}
		return flag;
		
	}

	public int checkLogin(String email, String password) {
		
	
		Session session=ConnectionProvider.getSession();
		@SuppressWarnings("unchecked")
		Query<ClientRegisterInfo> q=session.createQuery("from ClientRegisterInfo");
		List<ClientRegisterInfo> list=q.list();
		session.close();
		int id=0;
		
	
		for(ClientRegisterInfo cri:list)
		{
			if(cri.getEmail().equals(email)&&cri.getPassword().equals(password))
			{
				id=cri.getClientId();
			}
		}
		
		
		return id;
	}

	


	public int checkLoginAdmin(String email, String password) {
		Session session=ConnectionProvider.getSession();
		@SuppressWarnings("unchecked")
		Query<AdminLoginInfo> q=session.createQuery("from AdminLoginInfo");
		List<AdminLoginInfo> list=q.list();
		session.close();
		int id=0;
		
	
		for(AdminLoginInfo cri:list)
		{
			if(cri.getEmail().equals(email)&&cri.getPassword().equals(password))
			{
				id=cri.geAdminId();
			}
		}
		
		
		return id;
	}
	
	
	//get list
	
	
	
	public List<ClientRegisterInfo> getListClientRegisterInfo()
	{
		Session session=ConnectionProvider.getSession();
		@SuppressWarnings("unchecked")
		Query<ClientRegisterInfo> q=session.createQuery("from ClientRegisterInfo");
		List<ClientRegisterInfo> list=q.list();
		session.close();
		return list;
	}
	
	
	public List<AddProductInfo> getListAddProductInfo()
	{
		Session session=ConnectionProvider.getSession();
		@SuppressWarnings("unchecked")
		Query<AddProductInfo> q=session.createQuery("from AddProductInfo");
		List<AddProductInfo> list=q.list();
		session.close();
		return list;
	}
	
	
	public List<ClientPaymentInfo> getListClientPaymentInfo()
	{
		Session session=ConnectionProvider.getSession();
		@SuppressWarnings("unchecked")
		Query<ClientPaymentInfo> q=session.createQuery("from ClientPaymentInfo");
		List<ClientPaymentInfo> list=q.list();
		session.close();
		return list;
	}
	
	
	public List<AdminLoginInfo> getListAdminLoginInfo()
	{
		Session session=ConnectionProvider.getSession();
		@SuppressWarnings("unchecked")
		Query<AdminLoginInfo> q=session.createQuery("from AdminLoginInfo");
		List<AdminLoginInfo> list=q.list();
		session.close();
		return list;
	}
	public List<BackupClientInfo> getListBackupClientInfo()
	{
		Session session=ConnectionProvider.getSession();
		@SuppressWarnings("unchecked")
		Query<BackupClientInfo> q=session.createQuery("from BackupClientInfo");
		List<BackupClientInfo> list=q.list();
		session.close();
		return list;
	}
	public List<BackupProductInfo> getListBackupProductInfo()
	{
		Session session=ConnectionProvider.getSession();
		@SuppressWarnings("unchecked")
		Query<BackupProductInfo> q=session.createQuery("from BackupProductInfo");
		List<BackupProductInfo> list=q.list();
		session.close();
		return list;
	}
	public List<ClientBackupProductInfo> getListClientBackupProductInfo()
	{
		Session session=ConnectionProvider.getSession();
		@SuppressWarnings("unchecked")
		Query<ClientBackupProductInfo> q=session.createQuery("from ClientBackupProductInfo");
		List<ClientBackupProductInfo> list=q.list();
		session.close();
		return list;
	}
	public List<ClientCartInfo> getListClientCartInfo()
	{
		Session session=ConnectionProvider.getSession();
		@SuppressWarnings("unchecked")
		Query<ClientCartInfo> q=session.createQuery("from ClientCartInfo");
		List<ClientCartInfo> list=q.list();
		session.close();
		return list;
	}
	public List<ClientProductInfo> getListClientProductInfo()
	{
		Session session=ConnectionProvider.getSession();
		@SuppressWarnings("unchecked")
		Query<ClientProductInfo> q=session.createQuery("from ClientProductInfo");
		List<ClientProductInfo> list=q.list();
		session.close();
		return list;
	}



	public boolean saveProductInfo(AddSpecialOfferInfo api) {
		boolean flag=false;
		Session session=ConnectionProvider.getSession();
		try {
		Transaction tx=session.beginTransaction();
		
		session.save(api);
		tx.commit();
		session.close();
		flag=true;
		}catch(Exception e)
		{
			session.close();
		}
		return flag;
	}



	public List<AddSpecialOfferInfo> getListAddSpecialOfferInfo()
	{
		Session session=ConnectionProvider.getSession();
		@SuppressWarnings("unchecked")
		Query<AddSpecialOfferInfo> q=session.createQuery("from AddSpecialOfferInfo");
		List<AddSpecialOfferInfo> list=q.list();
		session.close();
		return list;
	}
	






	



	



	
	
	
	
	

}
