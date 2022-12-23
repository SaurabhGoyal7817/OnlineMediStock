<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Special Offer</title>
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

<h3 style="margin:20px;">Add Special Offer</h3>

<br>

<main class="d-flex align-items-center" style="height:100%;">
<div class="container">

<div class="row">
<div class="col-md-4 offset-md-4">

<div class="card">

<div class="card-header bg-colo text-white text-center">


<h3>Add Special Offer</h3>
</div>
<div class="card-body">
<form id="productform" action="AddSpecialOffer" method="POST" enctype="multipart/form-data">
<div class="form-group">
    <label for="productname">Product Name</label>
    <input type="text" name="productname" class="form-control" id="productname" placeholder="product name">
  </div>
  <div class="form-group">
    <label for="productcompany">Product Company</label>
    <input type="text" name="productcompany" class="form-control" id="productcompany" placeholder="product company">
  </div>
  <div class="form-group">
    <label for="productdetails">Product Details</label>
    <textarea rows="5px" style="width:100%" name="productdetails"placeholder="write something..."></textarea>
  </div>
  <div class="form-group">
  <label for="message">Effective Message</label>
    <input type="text" name="message" class="form-control" id="message" placeholder="buy one get one free..">
  </div>
  <div class="form-group">
    <label for="information">Information</label>
    <input type="text" name="information" class="form-control" id="information" placeholder="information">
  </div>
 

  <div class="form-group">
    <label for="productprice">Product Price</label>
    <input type="number" name="productprice" class="form-control" id="productprice" aria-describedby="productpricehelp" placeholder="Rs">
    
  </div>
   <div class="form-group">
    <label for="discountprice">Discount Price</label>
    <input type="number" name="discountprice" class="form-control" id="discountprice" aria-describedby="discountpricehelp" placeholder="Rs">
    
  </div>
   <div class="form-group">
    <label for="mfd">MFD</label>
    <input type="date" name="mfd" class="form-control" id="mfd">
  </div>
  
   <div class="form-group">
    <label for="expiredate">Expire Date</label>
    <input type="date" name="expiredate" class="form-control" id="expiredate">
  </div>
  
  <div class="form-group">
    <label for="startdate">Start Date</label>
    <input type="date" name="startdate" class="form-control" id="startdate">
  </div>
  
   <div class="form-group">
    <label for="enddate">End Date</label>
    <input type="date" name="enddate" class="form-control" id="enddate">
  </div>
  <div class="form-group">
    <label for="starttime">Start Time</label>
    <input type="time" name="starttime" class="form-control" id="starttime">
  </div>
  
   <div class="form-group">
    <label for="endtime">End Time</label>
    <input type="time" name="endtime" class="form-control" id="endtime">
  </div>
  
  
  
  <div class="form-group">
    <label for="image1">Image 1</label>
    <input type="file" name="image1" class="form-control" id="image1">
    
  </div>
  <div class="form-group">
    <label for="image2">Image 2</label>
    <input type="file" name="image2" class="form-control" id="image2">
    
  </div>
  <div class="form-group">
    <label for="image3">Image 3</label>
    <input type="file" name="image3" class="form-control" id="image3">
   

  </div>
  <div class="form-group">
    <label for="image4">Image 4</label>
    <input type="file" name="image4" class="form-control" id="image4">
  </div>
 
  
 
  <div class="container text-center" id="loader" style="display:none;">
  <span class="fa fa-refresh fa-spin fa-3x"></span>
  <h4>Please wait...</h4>
  </div>
  
  <button type="submit" id="submit-btn" class="btn btn-outline-light btn-lg bg-colo">Submit</button><br><br>
  
</form>

</div>

</div>
</div>
</div>
</div>

</main>



<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">


$(document).ready(function()
		{
	
	$('#productform').on('submit',function(event)
	{
		event.preventDefault();
		let form=new FormData(this);
		
		$('#submit-btn').hide();
		$('#loader').show();
		//send data to register servlet 
		
		$.ajax
		({
			url:"AddSpecialOffer",
			type:"POST",
			data:form,
			success:function(data,textStatus,jqXHR){
				
				$('#submit-btn').show();
				$('#loader').hide();
				if(data.trim()==='done')
				{
					
					swal("Add Special Offer Successfully!", "", "success").then((value)=>{
					window.location="AddProduct.jsp"
				});			
				}
				else
				{
					swal(data,"","error");
				}
			},
			error:function(jqXHR,textStatus,errorThrown){
				$('#submit-btn').show();
				$('#loader').hide();
				swal("Something went wrong..try again!", "", "error");
				
			},
			processData:false,
			contentType:false
		});
	
		});
		});

</script>

<%}
else{
	response.sendRedirect("AdminLogin.jsp");
}%>

</body>
</html>