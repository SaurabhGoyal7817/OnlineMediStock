<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Clients</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">

</head>
<% Integer adminID=(Integer)request.getSession().getAttribute("adminid"); %>
<!-- navbar -->
<%if(adminID!=null&&adminID>0)
	{%>
<body>
<!-- navbar -->
<%
String searchById=request.getParameter("searchpick");
ClientRegisterInfo cr=null;
if(searchById!=null)
{
	Session sessi=ConnectionProvider.getSession();
	cr=(ClientRegisterInfo)sessi.get(ClientRegisterInfo.class,Integer.parseInt(searchById));
	sessi.close();
}
	

%>
<%@include file="NavbarUtility.jsp" %>
<br>

<h3 style="margin:20px;">Clients Search</h3>

<br>


		<div class="table-responsive text-nowrap" style="overflow-x:auto">
		<table class="table table-hove table-bordered" >
		
		<thead>
		<tr >
		
		<th scope="col">First Name</th>
		<th scope="col">Last Name</th>
		<th scope="col">Email</th>
		<th scope="col">Phone No</th>
		<th scope="col">Location</th>
		<th scope="col">Password</th>
		<th scope="col">History</th>
		<th scope="col">Delete</th>
		<th scope="col">Update</th>
		</tr>
		</thead >
		<tbody>
		
		<tr>
		<%if(cr!=null){ %>
		<td><%=cr.getFirstName() %></td>
		<td><%=cr.getLastName() %></td>
		<td><%=cr.getEmail()  %></td>
		<td><%=cr.getPhone() %></td>
		<td><%=cr.getLocation() %></td>
		<td><%=cr.getPassword() %></td>
		<td><a class="btn btn-outline-light btn-lg bg-primary" href="HistoryClient.jsp">History</a></td>
		<td><a class="btn btn-outline-light btn-lg bg-danger" href="DeleteClient?deleteid=<%=cr.getClientId() %>">Delete</a></td>
	    <td><a class="btn btn-outline-light btn-lg bg-success" href="UpdateClient.jsp?updateid=<%=cr.getClientId() %>">Update</a></td>
		</tr>
		<%} %>
		
		</tbody>
		
		
		
		</table>
		</div>

<%}
else{response.sendRedirect("AdminLogin.jsp");} %>
</body>
</html>