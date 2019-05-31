<%@ include file = "header_welcome2.html" %>
<%@page import="java.sql.*,db.*" %>
<label class="text-success" style="position:absolute;left:1%;top:15%;font-size:20px;">Welcome:<%=session.getAttribute("user_name") %></label>


<div class="rounded" style="position:absolute;top:25%;width:100%;border-style:groove;text-align: center;">
<table class="table table-striped" >
	  <thead>
	    <tr>
	      <th scope="col">Image</th>
	      <th scope="col">Cat_Name</th>
	      <th scope="col">Product_Name</th>
	      <th scope="col">Product_Price</th>
		  <th scope="col">Description</th>
	    </tr>
	  </thead>
	  <tbody>
<%
	Connection con1=ConnectionProvider.getConnection();
	Statement st1=con1.createStatement();
	ResultSet rs1=st1.executeQuery("select * from product where allow='true'");
	while(rs1.next())
	{
	%>
	  <tr>
	      <td><a href="<%=rs1.getString(5)%>"><img src="<%=rs1.getString(5)%>" width="100" height="100"></a></td>
	      <td><%=rs1.getString(2)%></td>
	      <td><%=rs1.getString(3)%></td>
	      <td><%=rs1.getString(4)%></td>
	      <td><%=rs1.getString(8)%></td>
	   
	    </tr>
	  
	<% 
	
	}	
	rs1.close();
%>
	  </tbody>
	</table>

</div>






</body>
</html>