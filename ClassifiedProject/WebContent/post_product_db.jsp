<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.ConnectionProvider"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ include file="header_welcome.html" %>

<%
try
{
		String path= request.getRealPath("/images");
	MultipartRequest mpr = new MultipartRequest(request,path,50*1024*1024);
	Connection con = ConnectionProvider.getConnection();
	ResultSet rs = con.createStatement().executeQuery("select max(p_id) from product");
	int p_id = 0;
	if(rs.next())
	{
		p_id = rs.getInt(1);
		p_id++;
	}
rs.close();

String img_name= mpr.getOriginalFileName("image");
String imgpath = path+"/"+img_name;
String newimgpath = path+"/"+p_id+".jpg";
File f1 = new File(imgpath);
File f2= new File(newimgpath);
f1.renameTo(f2);
f1.delete();


StringBuffer url  = request.getRequestURL();
String imgUrl = url.substring(0,url.lastIndexOf("/"))+"/images/"+p_id+".jpg";   

    String cat_name =  mpr.getParameter("category");
    String p_name =  mpr.getParameter("productname");
    String p_price  =  mpr.getParameter("price");
    String p_desc =  mpr.getParameter("pdesc");
    int  user_id = (int)session.getAttribute("user_id");
    String mobile =  (String)session.getAttribute("user_mob");
    String allow = "false";

    
    Connection con2 = ConnectionProvider.getConnection();
    PreparedStatement pst = con.prepareStatement("insert into product (cat_name,p_name,p_price,p_imgurl,user_id,allow,p_desc,contact) values (?,?,?,?,?,?,?,?)");
    pst.setString(1,cat_name);
    pst.setString(2, p_name);
    pst.setString(3, p_price);
    pst.setString(4,imgUrl);
    pst.setInt(5, user_id);
    pst.setString(6,allow);
	pst.setString(7, p_desc);
	pst.setString(8,mobile);
	
	pst.executeUpdate();
    
  response.sendRedirect("post_product.jsp?msg=Post Created&color=text-success");
}
catch(Exception e)
{
    
  response.sendRedirect("post_product.jsp?msg="+e.getMessage()+"&color=text-danger");	
}
    
    
%>

</body>
</html>