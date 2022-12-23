<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.saurabh.entities.*,com.saurabh.validity.*,java.util.*" %>
<%
List<AddProductInfo> listpro=ValidityChecker.getValidityChecker().getListAddProductInfo();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProductDetails</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style2.css">

</head>
<body>
<% String proid=request.getParameter("productid");
AddProductInfo cr=null;
if(proid!=null)
{
	Session sessi=ConnectionProvider.getSession();
	cr=(AddProductInfo)sessi.get(AddProductInfo.class,Integer.parseInt(proid));
	sessi.close();
}
	

%>

<%@include file="NavbarUtility.jsp" %>

<!--  -->
<div class="containermy">

<div class="xzoom-containermy">
<%if(cr!=null){ %>
<img src="img/<%=cr.getImage1() %>" alt="" width="90%" class="xzoom" xoriginal="img/<%=cr.getImage1() %>" >
<div class="xzoom-tumbs">
<a href="img/<%=cr.getImage1() %>">
<img alt="" class="xzoom-gallery" src="img/<%=cr.getImage1() %>" xpreview="img/<%=cr.getImage1() %>">
</a>
<a href="img/<%=cr.getImage2() %>">
<img alt="" class="xzoom-gallery"  src="img/<%=cr.getImage2() %>" >
</a>
<a href="img/<%=cr.getImage3() %>">
<img alt="" class="xzoom-gallery"  src="img/<%=cr.getImage3() %>" >
</a>
<a href="img/<%=cr.getImage4() %>">
<img alt="" class="xzoom-gallery"  src="img/<%=cr.getImage4() %>">
</a>

</div>
</div>
<div class="descriptionmy">
<h1><%=cr.getProductName() %></h1>
<p><%=cr.getProductDetaile() %></p>
<span>$<%=cr.getProductPrice() %></span>
<div>
<a href="BuyNow.jsp?productid=<%=cr.getProductId() %>" class="btn btn-outline-light btn-lg btn-danger" >Buy Now</a>
<a href="AddCart.jsp?productid=<%=cr.getProductId() %>" class="btn btn-outline-light btn-lg btn-warning">Add To Cart</a>

</div>
</div>


</div>
<%}else{
	response.sendRedirect("index.jsp");
}%>
<hr>
<div class="table-responsive mt-5 ml-1">
<table class="table table-borderless caption-top" style="text-align:left;">

  <caption>Brands in this category on OnlineMedical</caption>
  <thead>
    <tr>
      <th scope="col" style="width:30%"></th>
      <th scope="col"></th>
      
    </tr>
  </thead>
  <tbody>
  <%for(AddProductInfo ap:listpro){ %>
  
    <tr>
      
     
      <td><a  href="ProductDetails.jsp?productid=<%=ap.getProductId() %>"><img alt="..." src="img/<%=ap.getImage1() %>" width="100%" style="border-radius:5px;"></a>
  
      
      
      <td><h1 class="text-uppercase fw-bold text-black"><%=ap.getProductName() %></h1><a class="hovera text-decoration-none" href="ProductDetails.jsp?productid=<%=ap.getProductId() %>">
<%=ap.getProductDetaile() %>

<span style="display:block;font-weight:bold;font-size:30px;color:#353535;">$<%=ap.getProductPrice() %></span>

</a></td>
      
    </tr>
     <%} %>
   
  </tbody>
</table>
</div>

<!-- Footer -->

<%@include file="FooterUtility.jsp" %>

 <script src="js/jquery.js"></script>
 <script src="js/zoom.js"></script>
 <script src="js/script.js"></script>
</body>
</html>