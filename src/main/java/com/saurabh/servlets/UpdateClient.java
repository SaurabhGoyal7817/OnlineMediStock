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

/**
 * Servlet implementation class UpdateClient
 */
@WebServlet("/UpdateClient")
@MultipartConfig
public class UpdateClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateClient() {
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
		checkInfo(request,response);
			}
		else{response.sendRedirect("AdminLogin.jsp");}
	}

	
	
	
	private void checkInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String id=request.getParameter("updateid");
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
		if(id!=null&&firstName!=null&&lastName!=null&&email!=null&&phone!=null&&gender!=null)
		{
			ClientRegisterInfo cri=new ClientRegisterInfo();
			cri.setFirstName(firstName);
			cri.setLastName(lastName);
			cri.setGender(gender);
			cri.setPassword(password);
			cri.setLocation(location);
			cri.setPhone(Long.parseLong(phone));
			cri.setEmail(email);
			boolean flag=ValidityChecker.getValidityChecker().updateClientInfo(cri,Integer.parseInt(id));
			if(flag)
			{
				out.println("done");
			}
			else
			{
				out.println("something went wrong try again...1");	
			}	
		}
		else
		{
			out.println("something went wrong try again...2");
		}

		
	}
}
