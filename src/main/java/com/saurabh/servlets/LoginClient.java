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
 * Servlet implementation class LoginClient
 */
@WebServlet("/LoginClient")
@MultipartConfig
public class LoginClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginClient() {
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
		int clientId=0;
		
		if(email!=null&&password!=null)
		{
			clientId=ValidityChecker.getValidityChecker().checkLogin(email,password);
			if(clientId>0)
			{
				HttpSession hs=request.getSession();
				hs.setAttribute("clientid", clientId);
				out.println("done");
			}
			else
			{
			out.println("user not present please go to registration");
			}
			
		}
		else
		{
		out.println("invalid email or password...");
		}

		
	}

}
