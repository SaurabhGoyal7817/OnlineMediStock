<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">

</head>
<body>
<!-- navbar -->

<%@include file="NavbarUtility.jsp" %>
<br>
<main class="d-flex align-items-center" style="height:100%;">
<div class="container">

<div class="row">
<div class="col-md-4 offset-md-4">

<div class="card">

<div class="card-header bg-colo text-white text-center">

<span class="fa fa-user-circle-o fa-3x "></span>
<p>Register</p>
</div>
<div class="card-body">
<form id="registerform" action="RegisterClient" method="POST">
<div class="form-group">
    <label for="firstname">First Name</label>
    <input type="text" name="firstname" class="form-control" id="firstname" placeholder="first name">
  </div>
  <div class="form-group">
    <label for="lastname">Last Name</label>
    <input type="text" name="lastname" class="form-control" id="lastname" placeholder="last name">
  </div>
 

  <div class="form-group">
    <label for="email">Email</label>
    <input type="email" name="email" class="form-control"  placeholder="abc@opq.xyz">
    <small id="adminidHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
   <div class="form-group">
    <label for="phone">Phone</label>
    <input type="text" name="phone" class="form-control" id="phone" placeholder="123">
  </div>
  
  
   <div class="form-group">
    <label for="location">Location</label>
    <input type="text" name="location" class="form-control" id="location" placeholder="">
  </div>
  <div class="form-group">
    <label for="gender">Male</label>
    <input type="radio" name="gender"  value="male">
	<label for="gender">Female</label>
	<input type="radio" name="gender"  value="female">  
  </div>
  
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" name="password" class="form-control" id="password" placeholder="*****">
  </div>
  
 
  <div class="form-group">
    <label for="repassword">Re-Password</label>
    <input type="password" name="repassword" class="form-control" id="repassword" placeholder="*****">
  </div>
  
 
  <div class="container text-center" id="loader" style="display:none;">
  <span class="fa fa-refresh fa-spin fa-3x"></span>
  <h4>Please wait...</h4>
  </div>
  
  <button type="submit" id="submit-btn" class="btn btn-outline-light btn-lg bg-colo">Submit</button><br><br>
  <a href="login.jsp" >For Old User Click here!!</a>
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
	
	$('#registerform').on('submit',function(event)
	{
		event.preventDefault();
		let form=new FormData(this);
		
		$('#submit-btn').hide();
		$('#loader').show();
		//send data to register servlet 
		
		$.ajax
		({
			url:"RegisterClient",
			type:"POST",
			data:form,
			success:function(data,textStatus,jqXHR){
				
				$('#submit-btn').show();
				$('#loader').hide();
				if(data.trim()==='done')
				{
					
					swal("Registration Successfully!", "", "success").then((value)=>{
					window.location="login.jsp"
				});			
				}
					
				else
					{
					swal(data, "", "error");
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



</body>
</html>