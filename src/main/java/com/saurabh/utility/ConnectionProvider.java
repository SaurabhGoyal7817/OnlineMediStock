package com.saurabh.utility;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class ConnectionProvider {

	private static Configuration config;
	
	public static Session getSession()
	{
		
		config=new Configuration();
		config.configure("hibernate.config.xml");
		SessionFactory factory=config.buildSessionFactory();
		Session session=factory.openSession();
		return session;
		
	}

	
	public ConnectionProvider() {
		// TODO Auto-generated constructor stub
	}

}
