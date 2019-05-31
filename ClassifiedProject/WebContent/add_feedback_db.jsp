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
   String name = request.getParameter("Name");
   String phone = request.getParameter("PhoneNumber");
   String email = request.getParameter("FromEmailAddress");
   String comment = request.getParameter("Comments");
   Connection con =	ConnectionProvider.getConnection();
   String sql = "insert into userfeedback  values(?,?,?,?)";
   PreparedStatement pst = con.prepareStatement(sql);
   pst.setString(1,name);
   pst.setString(2,phone);
   pst.setString(3,email);
   pst.setString(4,comment);
   pst.executeUpdate();
   response.sendRedirect("feedback.jsp?msg=FeedBack Submitted Successfully&color=text-success");
   }
   catch(Exception e)
   {
	   response.sendRedirect("feedback.jsp?msg="+e.getMessage()+"&color=text-danger");
   }
   %>
</body>
</html>