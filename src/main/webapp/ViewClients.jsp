<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.saurabh.entities.*,com.saurabh.validity.*,java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Clients</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<!-- navbar -->
<% Integer adminID=(Integer)request.getSession().getAttribute("adminid"); %>
<!-- navbar -->
<%if(adminID!=null&&adminID>0)
	{%>
<%@include file="NavbarUtility.jsp" %>
<br>
<%
List<ClientRegisterInfo> list=ValidityChecker.getValidityChecker().getListClientRegisterInfo();
%>
<h3 style="margin:20px;">View Clients</h3>

<br>

		<div class="table-responsive text-nowrap" style="overflow-x:auto">
		<table class="table table-hove table-bordered" >
		
		<thead>
		<tr >
		<th scope="col">No</th>
		<th scope="col">Id</th>
		<th scope="col">First Name</th>
		<th scope="col">Last Name</th>
		<th scope="col">Email</th>
		<th scope="col">Gender</th>
		<th scope="col">Phone No</th>
		<th scope="col">Location</th>
		<th scope="col">Password</th>
		<th scope="col">History</th>
		<th scope="col">Delete</th>
		<th scope="col">Update</th>
		</tr>
		</thead >
		<tbody>
		<%int i=1;
		for(ClientRegisterInfo client:list ){ %>
		<tr>
		<th scope="row"><%=i++ %></th>
		<td><%=client.getClientId() %></td>
		<td><%=client.getFirstName() %></td>
		<td><%=client.getLastName() %></td>
		<td><%=client.getEmail() %></td>
		<td><%=client.getGender() %></td>
		<td><%=client.getPhone() %></td>
		<td><%=client.getLocation() %></td>
		<td><%=client.getPassword() %></td>
		<td><a class="btn btn-outline-light btn-lg bg-primary" href="HistoryClient.jsp">History</a></td>
		<td><a class="btn btn-outline-light btn-lg bg-danger" href="DeleteClient?deleteid=<%=client.getClientId()%>">Delete</a></td>
	    <td><a class="btn btn-outline-light btn-lg bg-success" href="UpdateClient.jsp?updateid=<%=client.getClientId()%>">Update</a></td>
		</tr>
		<%} %>
		
		</tbody>
		
		
		
		</table>
		</div>

<%}
else{response.sendRedirect("AdminLogin.jsp");} %>
</body>
</html>