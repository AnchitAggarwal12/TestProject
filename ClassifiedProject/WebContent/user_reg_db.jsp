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
   String name = request.getParameter("username");
   String email = request.getParameter("useremail");
   String mobile = request.getParameter("mobile");
   String address = request.getParameter("address");
   String city = request.getParameter("city");
   String state = request.getParameter("state");
   String password = request.getParameter("password");
   String confirmpass = request.getParameter("confpass");
   
   Connection con =	ConnectionProvider.getConnection();
   String sql = "insert into user (user_name,user_email,user_mob,user_address,user_city,user_state,user_pass) values(?,?,?,?,?,?,?)";
   PreparedStatement pst = con.prepareStatement(sql);
   pst.setString(1,name);
   pst.setString(2,email);
   pst.setString(3,mobile);
   pst.setString(4,address);
   pst.setString(5,city);
   pst.setString(6,state);
   pst.setString(7,password);
   pst.executeUpdate();
   
   if(password.equals(confirmpass))
   {
   response.sendRedirect("newuser.jsp?msg=Registration Done&color=text-success");
   }
   else
   {
	   response.sendRedirect("newuser.jsp?msg=password and confirm password doesnot match&color=text-danger");
   }
   }
   catch(Exception e)
   {
	   response.sendRedirect("newuser.jsp?msg="+e.getMessage()+"&color=text-danger");
   }
   %>
</body>
</html>