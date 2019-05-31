<%@page import="java.sql.*,db.*" %>
<%@ include file="header.html" %>
<p>

<% 
String msg=request.getParameter("msg");
if(msg!=null)
{
String color=request.getParameter("color");	
%>
<label style="position: absolute;left:70%;top:20%;" class="<%=color%>"><%=msg%></label>
<%	
}
%>
</p>
  



<div style="position: absolute;left:30%;">
	<form action="search.jsp">
		<label class="text-primary">Select Category:</label>
		<select name="cat_name">
			<option>----select-----</option>
			
			<%
			Connection con=ConnectionProvider.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from category");
			
			while(rs.next())
			{
				%>
			<option><%=rs.getString(2)%></option>
			
				<% 
			}
			rs.close();
			%>
			
		</select>
		<input type="submit" class="button btn-primary">
	</form>
</div>
<div class="rounded" style="position:absolute;left:5%;top:25%;width:90%;border-style:groove;text-align: center;overflow:scroll;">
<table class="table table-striped" >
	  <thead>
	    <tr>
	      <th scope="col">Image</th>
	      <th scope="col">Cat_Name</th>
	      <th scope="col">Product_Name</th>
	      <th scope="col">Product_Price</th>
		  <th scope="col">Description</th>
		    <th scope="col">Action</th>
	    </tr>
	  </thead>
	  <tbody>
<%
	String cat_name=request.getParameter("cat_name");
	Connection con1=ConnectionProvider.getConnection();
	Statement st1=con1.createStatement();
	ResultSet rs1=st1.executeQuery("select * from product where allow='true' and cat_name='"+cat_name+"'");
	while(rs1.next())
	{
	%>
	  <tr>
	      <td><a href="<%=rs1.getString(5)%>"><img src="<%=rs1.getString(5)%>" width="100" height="100"></a></td>
	      <td><%=rs1.getString(2)%></td>
	      <td><%=rs1.getString(3)%></td>
	      <td><%=rs1.getString(4)%></td>
	      <td><%=rs1.getString(8)%></td>
	       <td><a href="view_post.jsp?p_id=<%=rs1.getInt(1)%>">View</a>
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