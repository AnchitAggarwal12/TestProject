<%@ include file = "header.html" %>
<%@page import="java.sql.*,db.*" %>
<%
	String msg = request.getParameter("msg");
        if(msg!=null)
        {
        	String color=request.getParameter("color");
        	%>
        	<label style="position: absolute;left:70%;" class="<%=color%>"><%=msg%></label>
        	<%
        }
%>

<br><br>

 
<div style="position:absolute;left:.2%; top: 300px">
<img src="images/buysale.jpg">
</div> 

<div style="position: absolute;left:30%;">
<form action="search.jsp">
		<label class="text-primary">Select Category:</label>
		<select name="cat_name">
			<option>----select-----</option>
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
		<input type="submit" class="button btn-primary">
	</form>
</div>


<div class="float-right ">
<form action = login_check.jsp method="post">
  <div class="form-group row">
    <label for="inputEmail3" class="col-sm-5 col-form-label text-primary">Email</label>
    <div class="col-sm-8">
      <input type="email" class="form-control" id="inputEmail3" placeholder="user email" name = "email" required>
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-5 col-form-label text-primary">Password</label>
    <div class="col-sm-8">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name = "password" required>
    </div>
  </div>
  <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-5 pt-0">User type :</legend>
      <div class="col-sm-10">
        <div class="form-check">
          <input class="form-check-input" type="radio" name="user" id="gridRadios1" value="user" checked >
          <label class="form-check-label" for="gridRadios1">
            User
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="user" id="gridRadios2" value="admin">
          <label class="form-check-label" for="gridRadios2">
            Admin
          </label>
        </div>
      
      </div>
    </div>
  </fieldset>
 
  <div class="form-group row">
    <div class="col-sm-10">
      <button type="submit" class="btn btn-primary">Log in</button>
      <button type="reset" class="btn btn-primary">Reset</button>
    </div>
  </div>
  <div class="form-group row">
  <a href="newuser.jsp" class = "btn-sm col-xs-1.2">New User</a>
  <a href="forgetpass.jsp" class = "btn-sm col-xs-1">Forget Password?</a>
  
  </div>
  
</form>
</div>

<div style="position:absolute;top:70%;">
<h5 style="line-height:25px;">

This project is meant for selling or buying old or new products
<br>by individuals .The services provided by this portal is free
 of cost. <br>
This project is meant for selling or buying old or new products
<br>by individuals .The services provided by this portal is free
 of cost. <br>
 </h5> 
 
</div>

</div>
</body>
</html>