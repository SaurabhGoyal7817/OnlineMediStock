<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consignment</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">

</head>
<body>
<% Integer adminID=(Integer)request.getSession().getAttribute("adminid"); %>
<!-- navbar -->
<%if(adminID!=null&&adminID>0)
	{%>
<!-- navbar -->
<%
String searchById=request.getParameter("searchpick");
AddProductInfo cr=null;
if(searchById!=null)
{
	Session sessi=ConnectionProvider.getSession();
	cr=(AddProductInfo)sessi.get(AddProductInfo.class,Integer.parseInt(searchById));
	sessi.close();
}
	

%>
<%@include file="NavbarUtility.jsp" %>
<br>

<h3 style="margin:20px;">Product Search</h3>

<br>


		<div class="table-responsive text-nowrap" style="overflow-x:auto">
		<table class="table table-hove table-bordered" >
		
		<thead>
		<tr >
		
		<th scope="col">Product Name</th>
		<th scope="col">Product Details</th>
		<th scope="col">Product Company</th>
		<th scope="col">Product Price</th>
		<th scope="col">Product Discount</th>
		<th scope="col">MFD</th>
		<th scope="col">Expire Date</th>
		<th scope="col">Image1</th>
		<th scope="col">Image2</th>
		<th scope="col">Image3</th>
		<th scope="col">Image4</th>
		<th scope="col">Delete</th>
		<th scope="col">Update</th>
		
		
		</tr>
		
		</thead >
		
		<%if(cr!=null)
		{%>
		<tbody>
		
		<tr>
		
		<td><%=cr.getProductName() %></td>
		<td><%=cr.getProductDetaile() %></td>
		<td><%=cr.getProductCompany() %></td>
		<td><%=cr.getProductPrice() %></td>
		<td><%=cr.getProductDiscount() %></td>
		<td><%=cr.getMfDate() %></td>
		<td><%=cr.getExpireDate() %></td>
		<td><img src="img/<%=cr.getImage1() %>" width="100px" height="100px"></td>
		<td><img src="img/<%=cr.getImage2() %>" width="100px" height="100px"></td>
		<td><img src="img/<%=cr.getImage3() %>" width="100px" height="100px"></td>
		<td><img src="img/<%=cr.getImage4() %>" width="100px" height="100px"></td>
		<td><a class="btn btn-outline-light btn-lg bg-danger" href="DeleteProduct?deleteid=<%=cr.getProductId()%>">Delete</a></td>
	    <td><a class="btn btn-outline-light btn-lg bg-success" href="UpdateProduct.jsp?updateid=<%=cr.getProductId()%>">Update</a></td>
		</tr>
		
		
		</tbody>
		<%} %>
		
		
		
		
		</table>
		</div>
<%}
else{response.sendRedirect("AdminLogin.jsp");} %>

</body>
</html>