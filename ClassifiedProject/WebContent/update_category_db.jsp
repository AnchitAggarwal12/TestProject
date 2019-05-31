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
		String cat_id=request.getParameter("cat_id");
			String cat_name=request.getParameter("cat_name");

			Connection con=ConnectionProvider.getConnection();
		PreparedStatement pst=con.prepareStatement("update category set cat_name=? where cat_id=?");
		pst.setString(1,cat_name);
		pst.setInt(2,Integer.parseInt(cat_id));

			pst.executeUpdate();
			response.sendRedirect("manage_categories.jsp?msg=Category Updated&color=text-success");
	}
	catch(Exception e)
	{
		response.sendRedirect("manage_categories.jsp?msg="+e.getMessage()+"&color=text-danger");
	}


%>
</body>
</html>