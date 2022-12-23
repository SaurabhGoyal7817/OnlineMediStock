<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- Navbar -->

<%@include file="NavbarUtility.jsp" %>


<main class="d-flex justify-content-center">
<div class="card" style="width:18rem;">
  <img src="images/3.webp" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Dr. Akash Agarwal</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>

</main>
<br>
<hr>


<div class="container">
<div class="card">
<div class="card-body">
<form id="logform" action="ClientInfo" method="POST">
  <div class="form-group">
    <label for="adminid" style="font-weight:bold;font-size:20px;">Email</label>
    <input type="email" name="adminid" class="form-control" id="adminid" aria-describedby="adminidHelp" placeholder="abc@opq.xyz">
    <small id="adminidHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="phone" style="font-weight:bold;font-size:20px;">Phone No</label>
    <input type="text" name="phone" class="form-control" id="phone" placeholder="123..">
  </div>
  <div class="form-group">
    <label for="textarea" style="font-weight:bold;font-size:20px;">Message</label><br>
    <textarea rows="5px" style="width:100%" name="textarea"placeholder="write something..."></textarea>
      </div>
 
   <div class="container text-center" id="loader" style="display:none;">
  <span class="fa fa-refresh fa-spin fa-3x"></span>
  <h4>Please wait...</h4>
  </div>
  <button type="submit" id="submit-btn" class="btn btn-outline-light btn-lg bg-colo" style="font-weight:bold;">Send</button><br><br>
  
</form>

</div>

</div>
</div>





<!-- Footer -->

<%@include file="FooterUtility.jsp" %>



<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">


$(document).ready(function()
		{
	
	$('#logform').on('submit',function(event)
	{
		event.preventDefault();
		let form=new FormData(this);
		
		$('#submit-btn').hide();
		$('#loader').show();
		
		//send data to register servlet 
		
		$.ajax
		({
			url:"ClientInfo",
			type:"POST",
			data:form,
			success:function(data,textStatus,jqXHR){
				
				$('#submit-btn').show();
				$('#loader').hide();
				if(data.trim()==='Yes')
				{
					
					swal("Your Message Sent Successfully!", "", "success").then((value)=>{
					window.location="about.jsp"
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