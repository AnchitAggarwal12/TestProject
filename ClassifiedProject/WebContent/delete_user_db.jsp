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
	String user_id=request.getParameter("user_id");

			Connection con=ConnectionProvider.getConnection();
		PreparedStatement pst=con.prepareStatement("delete from user  where user_id=?");
		pst.setInt(1,Integer.parseInt(user_id));
		pst.executeUpdate();
	 response.sendRedirect("manage_user.jsp?msg=User Deleted&color=text-success");
	}
	catch(Exception e)
	{
		response.sendRedirect("manage_user.jsp?msg="+e.getMessage()+"&color=text-danger");
	}


%>
</body>
</html>