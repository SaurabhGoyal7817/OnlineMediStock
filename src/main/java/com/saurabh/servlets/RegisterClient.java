package com.saurabh.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saurabh.entities.ClientRegisterInfo;
import com.saurabh.validity.ValidityChecker;





@WebServlet("/RegisterClient")
@MultipartConfig
public class RegisterClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public RegisterClient() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		checkInfo(request,response);
		
	}

	
	
	
	private void checkInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String rePassword=request.getParameter("repassword");
		String firstName=request.getParameter("firstname");
		String location=request.getParameter("location");
		String lastName=request.getParameter("lastname");
		String password=request.getParameter("password");
		String gender=request.getParameter("gender");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		PrintWriter out=response.getWriter();
		
		
		
		if(rePassword!=null)
		{	if(!rePassword.equals(password))
			   out.println("password not match try again...");
		}
		if(firstName!=null&&lastName!=null&&email!=null&&phone!=null&&gender!=null)
		{
			ClientRegisterInfo cri=new ClientRegisterInfo();
			cri.setFirstName(firstName);
			cri.setLastName(lastName);
			cri.setGender(gender);
			cri.setPassword(password);
			cri.setLocation(location);
			cri.setPhone(Long.parseLong(phone));
			cri.setEmail(email);
			cri.setType("client");
			boolean flag=ValidityChecker.getValidityChecker().saveClientInfo(cri);
			if(flag)
			{
				out.println("done");
			}
			else
			{
				out.println("something went wrong try again...");	
			}	
		}
		else
		{
			out.println("something went wrong try again...");
		}

		
	}

}
