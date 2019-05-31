<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="db.ConnectionProvider,java.sql.*"%>
    <%@ include file="header_welcome.html" %>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="js/bootstrap.min.js"/>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
    padding: 20px;
  
}

}
th, td {
  padding: 20px;
  text-align: left;    
}
</style>
</head>
<body>

<a class="text-dark" style="position:absolute;left:1%;top:20%;font-size:20px;" href="welcome_user.jsp">Back</a>
<br><br>
<h2 align="center">Profile View</h2>

<table style="width:60%" align="center" >
<% 
String msg=request.getParameter("msg");
if(msg!=null)
{
String color=request.getParameter("color");	
%>
<label style="position: absolute;left:10%;top:20%;" class="<%=color%>"><%=msg%></label>
<%	
}
%>
 
<%
     int x = (int)session.getAttribute("user_id");
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement pst=con.prepareStatement("select * from user where user_id=?");
	pst.setInt(1,x);
	ResultSet rs=pst.executeQuery();
	if(rs.next())
	{
	%>
	  <tr>
   	 <th>User Name  :</th>
   	 <td><%=rs.getString(2) %></td>
  		</tr>
  		
  		<tr>
   	 <th>User Email  :</th>
   	 <td><%=rs.getString(3) %></td>
  		</tr>
  		
	    <tr>
   	 <th>User Mobile  :</th>
   	 <td><%=rs.getString(4) %></td>
  		</tr>
	    
	    <tr>
   	 <th>User Address  :</th>
   	 <td><%=rs.getString(5) %></td>
  		</tr>
  		
  		<tr>
   	 <th>User City  :</th>
   	 <td><%=rs.getString(6) %></td>
  		</tr>
	    
	    <tr>
   	 <th>User State  :</th>
   	 <td><%=rs.getString(7) %></td>
  		</tr>
	  
	<% 
	
	}	
	rs.close();
%>
</table>
<br><br>
<div style="text-align:center">    
  <a href="update_profile.jsp">Update Profile</a>
</div>
</body>
</html>
