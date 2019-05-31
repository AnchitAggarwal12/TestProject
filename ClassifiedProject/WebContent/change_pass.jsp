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
 
   String email = request.getParameter("email");
   String mobile = request.getParameter("mobile");
   String password = request.getParameter("password");
   String confirmpass = request.getParameter("confpass");
   Connection con =	ConnectionProvider.getConnection();
   String sql = "update user set user_pass=? where user_email=? and user_mob=?";
   PreparedStatement pst = con.prepareStatement(sql);
 	pst.setString(1,password);
   pst.setString(2,email);
   pst.setString(3,mobile);
   int res = pst.executeUpdate();
   if(password.equals(confirmpass))
   {
   if(res>0)
   {
   response.sendRedirect("forgetpass.jsp?msg=Password changed&color=text-success");
   }
   else
   {
	   response.sendRedirect("forgetpass.jsp?msg=Password not changed&color=text-danger");
   }
   }
   else
   {
	   response.sendRedirect("forgetpass.jsp?msg=Password mismatch&color=text-danger");
   }
   }
   catch(Exception e)
   {
	   response.sendRedirect("forgetpass.jsp?msg="+e.getMessage()+"&color=text-danger");
   }
   %>
</body>
</html>