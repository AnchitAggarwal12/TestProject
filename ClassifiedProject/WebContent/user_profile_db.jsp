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
	  int id = (int)session.getAttribute("user_id");
   String name = request.getParameter("username");
   String email = request.getParameter("useremail");
   String mobile = request.getParameter("mobile");
   String address = request.getParameter("address");
   String city = request.getParameter("city");
   String state = request.getParameter("state");
   
   Connection con =	ConnectionProvider.getConnection();
   String sql = "update user set user_name=?,user_email=?,user_mob=?,user_address=?,user_city=?,user_state=? where user_id=?";
   PreparedStatement pst = con.prepareStatement(sql);
   pst.setString(1,name);
   pst.setString(2,email);
   pst.setString(3,mobile);
   pst.setString(4,address);
   pst.setString(5,city);
   pst.setString(6,state);
   pst.setInt(7,id);
   pst.executeUpdate();
   
   session.setAttribute("user_name", name);
	 session.setAttribute("user_email",email);
	 session.setAttribute("user_mob", mobile);
	 session.setAttribute("user_address",address);
	 session.setAttribute("user_city", city);
	 session.setAttribute("user_state", state);

  
   response.sendRedirect("my_profile.jsp?msg=Successfully Updated&color=text-success");
   }
   
   catch(Exception e)
   {
	   response.sendRedirect("my_profile.jsp?msg="+e.getMessage()+"&color=text-danger");
   }
   %>
   
</body>
</html>