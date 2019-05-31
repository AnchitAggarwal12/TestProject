<%@page import="db.ConnectionProvider,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
  String email = request.getParameter("email");
 String password = request.getParameter("password");
 String type = request.getParameter("user");
 
 if(type.equals("admin"))
 {
	 if(email.equals("admin@admin.com")&& password.equals("admin"))
	 {
		
		 response.sendRedirect("welcome_admin.jsp");
		 session.setAttribute("admin_email", email);
		 session.setAttribute("admin_Pass", password);
	 }
	 else
	 {
		 response.sendRedirect("index.jsp?msg=Invalid UserName/Password/type&color=text-danger");
		 
	 }
 }
 else if(type.equals("user"))
 {
	 Connection con = ConnectionProvider.getConnection();
	 String sql = "select * from user where user_email=? and user_pass=?";
	 PreparedStatement pst = con.prepareStatement(sql);
	 pst.setString(1, email);
	 pst.setString(2,password);
	 ResultSet rs = pst.executeQuery();
	 if(rs.next())
	 {
		 session.setAttribute("user_id", rs.getInt(1));
		 session.setAttribute("user_name", rs.getString(2));
		 session.setAttribute("user_email", rs.getString(3));
		 session.setAttribute("user_mob", rs.getString(4));
		 session.setAttribute("user_address", rs.getString(5));
		 session.setAttribute("user_city", rs.getString(6));
		 session.setAttribute("user_state", rs.getString(7));
		 session.setAttribute("user_pass", rs.getString(8));
		 
		 response.sendRedirect("welcome_user.jsp");
	 }
	 else
	 {
		 response.sendRedirect("index.jsp?msg=Invalid UserName/Password/typee&color=text-danger");
	 }
	 
	 
 }
 %>
 
</body>
</html>