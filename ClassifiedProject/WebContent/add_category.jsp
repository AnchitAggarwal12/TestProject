<%@ include file="header_welcome.html" %>
<div class="container">
<label>Welcome:Admin</label>

<div style="position: absolute;">

<nav class="nav flex-column">
  <a class="nav-link" href="add_category.jsp">Add Category</a>
  <a class="text-dark" style="position:absolute;left:1%;top:70%;font-size:20px;" href="welcome_admin.jsp">Back</a>
</nav>
</div>
<div style="position:absolute;left:40%">
<h1>Add Category</h1>
</div>


<div style="position: absolute;left:30%;top:30%;">
<form action = "add_category_db.jsp">
<label class="text-primary">Enter Category: </label>
<input type="text" name="category" required="required" placeholder="category">
<input type="submit" class="btn-primary" value="Submit">
</form>
</div>

		<% 
		String msg=request.getParameter("msg");
			if(msg!=null)
			{
				String color=request.getParameter("color");	
				%>
			<label style="position: absolute;left:40%;top:40%;" class="<%=color%>"><%=msg%></label>
			<%	
				}
		%>

</div>
</body>
</html>