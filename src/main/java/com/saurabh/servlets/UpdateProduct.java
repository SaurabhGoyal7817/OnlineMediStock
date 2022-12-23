package com.saurabh.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.saurabh.entities.AddProductInfo;
import com.saurabh.entities.ClientRegisterInfo;
import com.saurabh.utility.ConnectionProvider;
import com.saurabh.validity.ValidityChecker;


@WebServlet("/UpdateProduct")
@MultipartConfig
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
Integer adminID=(Integer)request.getSession().getAttribute("adminid");
		
		if(adminID!=null&&adminID>0)
			{
		PrintWriter out=response.getWriter();
		if(setValues(request))
		{
			out.println("done");
		}
		else
		{
			out.println("not");
		}
			}
		else{response.sendRedirect("AdminLogin.jsp");}
		
	}

	private boolean setValues(HttpServletRequest request) throws IOException, ServletException {
		
		String productName=request.getParameter("productname");
		String productDetail=request.getParameter("productdetails");
		String productCompany=request.getParameter("productcompany");
		String productPrice=request.getParameter("productprice");
		String discountPrice=request.getParameter("discountprice");
		String mfd=request.getParameter("mfd");
		String expireDate=request.getParameter("expiredate");
		
		String image1=getImageName(request,"image1");
		String image2=getImageName(request,"image2");
		String image3=getImageName(request,"image3");
		String image4=getImageName(request,"image4");
		boolean flag=false;
		String updateId=request.getParameter("updateid");
		
		if(updateId!=null&&productPrice!=null&&discountPrice!=null)
		{
			Session session=ConnectionProvider.getSession();
			try {
				AddProductInfo api=(AddProductInfo)session.get(AddProductInfo.class,Integer.parseInt(updateId));
			Transaction tx=session.beginTransaction();
		
			api.setProductName(productName);
			api.setProductDetaile(productDetail);
			api.setProductCompany(productCompany);
			api.setProductPrice(Double.parseDouble(productPrice));
			api.setProductDiscount(Double.parseDouble(discountPrice));
			api.setMfDate(mfd);
			api.setExpireDate(expireDate);
			if(image1!=null)
			api.setImage1(image1);
			if(image2!=null)
			api.setImage2(image2);
			if(image3!=null)
			api.setImage3(image3);
			if(image4!=null)
			api.setImage4(image4);
			tx.commit();
			session.close();
			
			flag=true;
			}
			catch(Exception e)
			{
				session.close();
			}
			
		}
	
		return flag;
	}

	private String getImageName(HttpServletRequest request, String string) throws IOException, ServletException {
		Part part=request.getPart(string);
		
		SimpleDateFormat formatter=new SimpleDateFormat("dd_MM_yyyy_HH_mm_ss_SSSZ"); 
		Date date=new Date();
		String datefor=formatter.format(date);
		try {
			if(!part.getSubmittedFileName().isEmpty())
			{
			String filename=datefor+part.getSubmittedFileName();
			String path=request.getRealPath("img")+File.separator+filename;
			System.out.println(path);
			FileOutputStream fos=new FileOutputStream(path);
			
			InputStream in=part.getInputStream();
			byte[] data=new byte[in.available()];
			in.read(data);
			fos.write(data);
			fos.close();
			
			return filename;
			}}
			catch(Exception e)
			{
				return null;
			}
		return null;
	}

}
