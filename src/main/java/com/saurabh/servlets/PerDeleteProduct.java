package com.saurabh.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saurabh.validity.ValidityChecker;

/**
 * Servlet implementation class PerDeleteProduct
 */
@WebServlet("/PerDeleteProduct")
public class PerDeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PerDeleteProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
Integer adminID=(Integer)request.getSession().getAttribute("adminid");
		
		if(adminID!=null&&adminID>0)
			{
		
		String perdeleteId=request.getParameter("perdeleteid");
		
		if(perdeleteId!=null)
		{
			ValidityChecker.getValidityChecker().deletePerProduct(Integer.parseInt(perdeleteId));
		}
		response.sendRedirect("RecentlyDelete.jsp");
			}
		else{response.sendRedirect("AdminLogin.jsp");}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
