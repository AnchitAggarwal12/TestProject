<%@page import="db.ConnectionProvider,java.sql.*"%>
<%@ include file="header_welcome.html" %>


<label class="text-success" style="position:absolute;left:1%;top:15%;font-size:20px;">Welcome:<%=session.getAttribute("user_name") %></label>

<div class="rounded" style="position:absolute;left:18%;top:25%;width:60%;border-style:groove;text-align: center;overflow:scroll;">	
	
         <%

				if(session.getAttribute("user_name")==null)
			{
					response.sendRedirect("index.jsp");

			}
			%>
	<% 
%>
	    <div class = "container pt-11">
	<form action ="user_profile_db.jsp" method="post">
	
	<div class="form-row">
    <div class="form-group col-md-8">
      <label for="UserName">UserName</label>
      <input type="text" class="form-control" id="Username" placeholder="username" name="username" value="<%=session.getAttribute("user_name") %>" required>
    </div>
    </div>
  <div class="form-row">
    <div class="form-group col-md-8">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control" id="inputEmail4" placeholder="Email" name="useremail" value="<%=session.getAttribute("user_email")%>"required>
    </div>
    </div>
    
    <div class="form-row">
    <div class="form-group col-md-8">
      <label for="Mobileno">Mobile Number</label>
      <input type="number" class="form-control" id="Mobileno" placeholder="122425636" name="mobile" value="<%=session.getAttribute("user_mob") %>" required>
    </div>
    </div>
    
  <div class="form-row">
  <div class="form-group col-md-8">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="address" value="<%=session.getAttribute("user_address") %>" required>
  </div>
  </div>

<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" id="inputCity"  name ="city" value="<%=session.getAttribute("user_city") %>" required>
    </div>
    
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
      <select id="inputState" class="form-control" name="state">
      <option selected><%=session.getAttribute("user_state") %></option>
        <option>Uttar Pradesh</option>
         <option>Uttrakhand</option>
          <option>Himachal Pradesh</option>
           <option>Haryana</option>
            <option>Arunachal Pradesh</option>
              <option>Bihar</option>
      </select>
    </div>

  </div>
  
  <button type="submit" class="btn btn-primary">Update Profile</button>
  
</form>
	</div>
	
    </tbody>
	</table>
	</div>

</body>
</html>