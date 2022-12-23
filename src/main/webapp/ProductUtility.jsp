<%@page import="com.saurabh.entities.*,com.saurabh.validity.*,java.util.*" %>
<%
List<AddProductInfo> listpro=ValidityChecker.getValidityChecker().getListAddProductInfo();

%>

<div class="table-responsive mt-5">
<table class="table table-borderless" style="text-align:center;">
 <tbody>

  <%int k=0,i=0;
for(i=0;i<listpro.size()&&3<listpro.size()-i;i=i+4)
    {%>
     <tr>
    
    <%
    for(int j=i;j<i+4;j++)
    	
    {
    %>
   
<td><a href="ProductDetails.jsp?productid=<%=listpro.get(i).getProductId()%>"><img alt="..." src="img/<%=listpro.get(j).getImage1() %>" width="150px" height="150px" style="border-radius:50%;border:2px solid black;"></a>
<p><%=listpro.get(j).getProductName()%></p></td>

  <%} %>
 </tr>
  
   <%
    
    }k=i;%>
    
  
    <tr>
    <%for(int o=listpro.size()-(Math.abs((k-listpro.size())));o<listpro.size();o++)
     {%>  
    
      <td><a href="ProductDetails.jsp?productid=<%=listpro.get(o).getProductId()%>"><img alt="..." src="img/<%=listpro.get(o).getImage1() %>" width="150px" height="150px" style="border-radius:50%;border:2px solid black;"></a>
      <p><%=listpro.get(o).getProductName()%></p></td>
     
    <%}%>
    </tr>
  
  </tbody>
</table>
</div>





    
       
   
   