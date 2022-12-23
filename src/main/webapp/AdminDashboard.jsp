<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<style>

.myul li
{
margin-top:10px;
list-style:none;
}
.myul li a{
color:white;
font-size:20px;
text-decoration:none;


}
</style>
</head>
<body>
<% Integer adminID=(Integer)request.getSession().getAttribute("adminid"); %>
<!-- navbar -->
<%if(adminID!=null&&adminID>0)
	{%>
<%@include file="NavbarUtility.jsp" %>
<br>


<ul class="myul">

<li >
          <a  class="btn btn-primary"href="ViewClients.jsp"><span class="	fa fa-user-plus size-f"></span>  View Clients</a>
        </li>
  <li >
          <a class="btn btn-primary" href="AddProduct.jsp"><span class="	fa fa-user-circle size-f"></span>  Add Product</a>
        </li>
         <li >
          <a class="btn btn-primary" href="ViewAllProduct.jsp"><span class="	fa fa-user-circle size-f"></span>  View All Product</a>
        </li>
         <li >
          <a class="btn btn-primary" href="AddSpecialOffer.jsp"><span class="	fa fa-user-circle size-f"></span>  Add Special Offer</a>
        </li>
        <li >
          <a class="btn btn-primary" href="ViewSpecialOffer.jsp"><span class="	fa fa-user-circle size-f"></span>  View Special Offer</a>
        </li>
          <li >
          <a class="btn btn-primary" href="RecentlyDeleteSpecialOffer.jsp"><span class="	fa fa-user-circle size-f"></span>  Recently Delete Special Offer</a>
        </li>
         <li >
          <a  class="btn btn-primary"href="RecentlyDeleteClient.jsp"><span class="	fa fa-user-plus size-f"></span>  Recently Delete Clients</a>
        </li>
        
         <li >
          <a class="btn btn-primary"href="ClientConsignment.jsp"><span class="	fa fa-user-plus size-f"></span>  Consignment For Client</a>
        </li>
         <li >
          <a class="btn btn-primary" href="RecentlyDelete.jsp"><span class="	fa fa-user-plus size-f"></span>  Recently Delete Product</a>
        </li>
         <li >
          <a class="btn btn-primary" href="Consignment.jsp"><span class="	fa fa-user-plus size-f"></span>  Consignment For Product</a>
        </li>
        


</ul>


<%}else
	{
	response.sendRedirect("AdminLogin.jsp");
	}%>

</body>
</html>