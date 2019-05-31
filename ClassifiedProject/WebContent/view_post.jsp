<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
      <%
      String p_id=request.getParameter("p_id");
      Connection con=ConnectionProvider.getConnection();
  	PreparedStatement pst=con.prepareStatement("select * from product where p_id=?");
  	pst.setString(1,p_id);
  	ResultSet rs = pst.executeQuery();
      if(rs.next())
      {
    	  %>
    	 <a href="<%=rs.getString(5)%>"><img src="<%=rs.getString(5)%>" width="300" height="300"></a>
    	<h3>Product Name:<%=rs.getString(3)%></h3>
    	<h3>Contact Details:<%=rs.getString(9) %></h3>
    	 
    	 <%
      }
      
      
      
      
      %>
</body>
</html>