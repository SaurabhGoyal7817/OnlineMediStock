package com.saurabh.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saurabh.validity.ValidityChecker;

/**
 * Servlet implementation class LoginAdmin
 */
@WebServlet("/LoginAdmin")
@MultipartConfig
public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		PrintWriter out=response.getWriter();
		int adminId=0;
		
		if(email!=null&&password!=null)
		{
			adminId=ValidityChecker.getValidityChecker().checkLoginAdmin(email,password);
			if(adminId>0)
			{
				HttpSession hs=request.getSession();
				hs.setAttribute("adminid", adminId);
				out.println("done");
			}
			else
			{
			out.println("admin not present");
			}
			
		}
		else
		{
		out.println("invalid email or password...");
		}

	}

}
