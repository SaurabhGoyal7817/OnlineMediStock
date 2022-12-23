
<%@page import="javax.servlet.http.HttpSession,org.hibernate.*,com.saurabh.utility.*,com.saurabh.entities.*"  %>

<%

Integer clientId=(Integer)request.getSession().getAttribute("clientid");
ClientRegisterInfo cri=null;
if(clientId!=null)
{
	Session sessio=ConnectionProvider.getSession();
	cri=(ClientRegisterInfo)sessio.get(ClientRegisterInfo.class,clientId);
	sessio.close();
	
}
Integer adminId=(Integer)request.getSession().getAttribute("adminid");
AdminLoginInfo ali =null;
if(adminId!=null)
{
	Session sessio=ConnectionProvider.getSession();
	ali=(AdminLoginInfo)sessio.get(AdminLoginInfo.class,adminId);
	sessio.close();
}

int c=0;
int a=0;

%>


<nav class="navbar navbar-expand-lg navbar-light bg-colo">
  <div class="container-fluid">
    <a class="navbar-brand text-white" href="#"><span class="fa fa-plus-circle size-36"></span>  Online Medical</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
        <li class="nav-item">
          <a class="nav-link text-white active" aria-current="page" href="index.jsp"><span class="fa fa-home size-f"></span>  Home</a>
        </li>
        
        <!-- if user not login -->
        <%if(clientId==null&&adminId==null)
        { 
        
        %>
        <li class="nav-item">
          <a class="nav-link text-white" href="about.jsp"><span class="	fa fa-spinner size-f"></span>  About</a>
        </li>

         <li class="nav-item">
          <a class="nav-link text-white" href="login.jsp"><span class="	fa fa-user-circle size-f"></span>  Login</a>
        </li>
         <li class="nav-item">
          <a class="nav-link text-white" href="register.jsp"><span class="	fa fa-user-plus size-f"></span>  Register</a>
        </li>
        <%}
        else if(cri!=null&&cri.getType().equals("client")){%>
        <!-- end -->
        
        <!-- if user login -->
        
       
       
        <li class="nav-item">
          <a class="nav-link text-white" href="#"><span class="	fa fa-user-circle size-f"></span>  History</a>
        </li>
         <li class="nav-item">
          <a class="nav-link text-white" href="#"><span class="	fa fa-user-circle size-f"></span>  Cart</a>
        </li>
 <li class="nav-item">
          <a class="nav-link text-white" href="ClientLogout">  Log Out</a>
        </li>
         
        
        <%c=1; }else if(adminId>0){ a=1;%>
     
        <!-- end -->
        
        
         <!-- if admin login -->
         
          <li class="nav-item">
          <a class="nav-link text-white" href="AdminDashboard.jsp">  Dashboard</a>
        </li>
         <li class="nav-item">
          <a class="nav-link text-white" href="AdminLogout">  Log Out</a>
        </li>
      <%}
        %>
         
        
        <!-- end -->
       
      </ul>
      <%if(c==1){ %>
     <h3 class="text-white"><span class="	fa fa-user-circle size-f"></span>  <%=cri.getFirstName() %></h3>
     <%} %>
      <%if(ali!=null&a==1){ %>
     <h3 class="text-white"><span class="	fa fa-user-circle size-f"></span>  <%=ali.getName() %></h3>
     <%} %>
    </div>
  </div>
</nav>

<div class="container-fluid p-0 m-0 ">

	<div class="jumbotron bg-c  rounded-0 banner-background" >
		<div class="container">
		<br>
		
		</div>
	</div>
</div>












