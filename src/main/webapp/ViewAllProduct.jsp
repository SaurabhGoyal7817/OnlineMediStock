<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.saurabh.entities.*,com.saurabh.validity.*,java.util.*" %>
<%
List<AddProductInfo> list=ValidityChecker.getValidityChecker().getListAddProductInfo();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Product</title>
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

<h3 style="margin:20px;">View All Products</h3>

<br>




		<div class="table-responsive text-nowrap" style="overflow-x:auto">
		<table class="table table-hove table-bordered" >
		
		<thead>
		<tr >
		<th scope="col">No</th>
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
		<%int i=1;
		for(AddProductInfo api:list)
		{%>
		<tbody>
		
		<tr>
		<th scope="row"><%=i++ %></th>
		<td><%=api.getProductName() %></td>
		<td><%=api.getProductDetaile() %></td>
		<td><%=api.getProductCompany() %></td>
		<td><%=api.getProductPrice() %></td>
		<td><%=api.getProductDiscount() %></td>
		<td><%=api.getMfDate() %></td>
		<td><%=api.getExpireDate() %></td>
		<td><img src="img/<%=api.getImage1() %>" width="100px" height="100px"></td>
		<td><img src="img/<%=api.getImage2() %>" width="100px" height="100px"></td>
		<td><img src="img/<%=api.getImage3() %>" width="100px" height="100px"></td>
		<td><img src="img/<%=api.getImage4() %>" width="100px" height="100px"></td>
		<td><a class="btn btn-outline-light btn-lg bg-danger" href="DeleteProduct?deleteid=<%=api.getProductId()%>">Delete</a></td>
	    <td><a class="btn btn-outline-light btn-lg bg-success" href="UpdateProduct.jsp?updateid=<%=api.getProductId()%>">Update</a></td>
		</tr>
		
		
		</tbody>
		<%} %>
		
		
		</table>
		</div>
<%}else{
	response.sendRedirect("AdminLogin.jsp");
	}%>
}

</body>
</html>