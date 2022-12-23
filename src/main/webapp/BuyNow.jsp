<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
</head>

<body>
<% 


Integer clientID=(Integer)request.getSession().getAttribute("clientid"); %>

<!-- navbar -->

<%if(clientID!=null&&clientID>0)
	{
	String proid=request.getParameter("productid");
	AddProductInfo cr=null;
	if(proid!=null)
	{
		Session sessi=ConnectionProvider.getSession();
		cr=(AddProductInfo)sessi.get(AddProductInfo.class,Integer.parseInt(proid));
		sessi.close();
	}
		
	
	%>
	
	<%@include file="NavbarUtility.jsp" %>
<br>
<div class="table-responsive mt-5">
<table class="table table-border" style="text-align:center;">
	<thead>
	<tr>
	<th scope="col">Product Id</th>
	<th scope="col">Product Image</th>
	<th scope="col">Product Name</th>
	<th scope="col">Product Price</th>
	<th scope="col">Product Discount</th>
	<th scope="col">Bill</th>
	
	</tr>
	</thead>
	<tbody>
	<%if(cr!=null){ %>
	<tr>
	<td><%=cr.getProductId() %></td>
	<td><img alt="" src="img/<%=cr.getImage1() %>" width="40px" height="40px" style="border-radius:5%;"></td>
	<td><%=cr.getProductName() %></td>
	<td><%=cr.getProductPrice() %></td>
	<td><%=cr.getProductDiscount() %></td>
	<td><%=cr.getProductPrice()-cr.getProductDiscount() %></td>
	
	</tr>
	
	<%}else
	{
		HttpSession hs=request.getSession();
		hs.invalidate();
		response.sendRedirect("login.jsp");
	} %>
	</tbody>
	</table>
	</div>
	<%if(cr!=null) {%>
	<div style="text-align:center;font-size:20px;">
	<h5>Total Bill</h5>
	<p><%=cr.getProductPrice()-cr.getProductDiscount() %></p>
	<%} %>
	<a href="#" class="btn btn-outline-light btn-lg btn-primary" >Pay</a>
	</div>
	<%}
else
{
	HttpSession hs=request.getSession();
	hs.invalidate();
	response.sendRedirect("login.jsp");
	
}%>
</body>
</html>