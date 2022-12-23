package com.saurabh.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.saurabh.entities.BackupClientInfo;
import com.saurabh.entities.ClientRegisterInfo;
import com.saurabh.utility.ConnectionProvider;
import com.saurabh.validity.ValidityChecker;

/**
 * Servlet implementation class DeleteClient
 */
@WebServlet("/DeleteClient")
public class DeleteClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteClient() {
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
		
		String deleteId=request.getParameter("deleteid");
		Session sessio=ConnectionProvider.getSession();
		if(deleteId!=null)
		{
		ClientRegisterInfo cri=(ClientRegisterInfo)sessio.get(ClientRegisterInfo.class,Integer.parseInt(deleteId));		
		BackupClientInfo bcf=new BackupClientInfo();
		bcf.setClientId(cri.getClientId());
		bcf.setFirstName(cri.getFirstName());
		bcf.setLastName(cri.getLastName());
		bcf.setEmail(cri.getEmail());
		bcf.setGender(cri.getGender());
		bcf.setLocation(cri.getLocation());
		bcf.setPassword(cri.getPassword());
		bcf.setPhone(cri.getPhone());
		bcf.setType(cri.getType());
		boolean flag=ValidityChecker.getValidityChecker().saveBackupClient(bcf);
		if(flag)
		{
			Transaction tx=sessio.beginTransaction();
			sessio.delete(cri);
			tx.commit();
			
					
		}
		}
		
			response.sendRedirect("ViewClients.jsp");
			sessio.close();
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
