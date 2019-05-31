<%@page import="db.ConnectionProvider,java.sql.*"%>
<%@ include file="header_welcome.html" %>


<label class="text-success" style="position:absolute;left:1%;top:15%;font-size:20px;">Welcome:<%=session.getAttribute("user_name") %></label>
<a class="text-dark" style="position:absolute;left:1%;top:20%;font-size:20px;" href="welcome_user.jsp">Back</a>
<div style="position:absolute;left:18%;top:25%;width:60%">	
	
         <%

				if(session.getAttribute("user_name")==null)
			{
					response.sendRedirect("index.jsp");

			}
			%>
	<% 
%>
	    <div class = "container pt-11">
	<form action ="post_product_db.jsp" method="post" enctype="multipart/form-data">
	
	
	
	<div class="form-row">
 
    
    <div class="form-group col-md-4">
      <label for="catgeory">Category Name</label>
      <select id="category" class="form-control" name="category">
      <%
					Connection con = ConnectionProvider.getConnection();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select * from category");
				     while(rs.next())
				     {
				    	 %>
				    	 <option><%=rs.getString(2) %></option>
				    	 <%
				     }
			       rs.close();
			%>
      </select>
    </div>

  </div>
	

	
	
	<div class="form-row">
    <div class="form-group col-md-8">
      <label for="ProductName">Product Name</label>
      <input type="text" class="form-control" id="Productname" placeholder="xyz"  name ="productname" required>
    </div>
    </div>
    
  <div class="form-row">
    <div class="form-group col-md-8">
      <label for="price">Price</label>
      <input type="number" class="form-control" id="price" placeholder="20" name="price"  required>
    </div>
    </div>
    
 
  
   <div class="form-row">
    <div class="form-group col-md-8">
      <label for="image">Select Image</label>
      <input type="file" class="form-control" id="image" accept="image/*" name="image"  required>
    </div>
    </div>
    
    
    <div class="form-row">
    <div class="form-group col-md-8">
      <label for="p">Description</label>
      <textarea class="form-control" id="p" placeholder="hefwiefsm bdsjh" name="pdesc"  required></textarea>
    </div>
    </div>
  
  <button type="submit" class="btn btn-primary">Update Product</button>
  
</form>
	</div>
	
    </tbody>
	</table>
	</div>
	
	<% 
		String msg=request.getParameter("msg");
			if(msg!=null)
			{
				String color=request.getParameter("color");	
				%>
			<label style="position: absolute;left:40%;top:20%;" class="<%=color%>"><%=msg%></label>
			<%	
				}
		%>

</body>
</html>