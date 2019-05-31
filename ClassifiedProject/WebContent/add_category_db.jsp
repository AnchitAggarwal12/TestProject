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
   try
   {
   String x = request.getParameter("category");
   Connection con =	ConnectionProvider.getConnection();
   String sql = "insert into category (cat_name) values(?)";
   PreparedStatement pst = con.prepareStatement(sql);
   pst.setString(1,x);
   pst.executeUpdate();
   response.sendRedirect("add_category.jsp?msg=Category Added&color=text-success");
   }
   catch(Exception e)
   {
	   response.sendRedirect("add_category.jsp?msg="+e.getMessage()+"&color=text-danger");
   }
   %>
</body>
</html>