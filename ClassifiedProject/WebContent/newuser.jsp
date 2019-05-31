<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file = "header.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="js/bootstrap.min.js"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration form</title>
</head>

<body>
	<div class = "container pt-5">
	<form action = "user_reg_db.jsp"onsubmit="return check_pass()">
	
	<div class="form-row">
    <div class="form-group col-md-8">
      <label for="UserName">UserName</label>
      <input type="text" class="form-control" id="Username" placeholder="username" name="username" required>
    </div>
    </div>
  <div class="form-row">
    <div class="form-group col-md-8">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control" id="inputEmail4" placeholder="Email" name="useremail" required>
    </div>
    </div>
    
    <div class="form-row">
    <div class="form-group col-md-8">
      <label for="Mobileno">Mobile Number</label>
      <input type="number" class="form-control" id="Mobileno" placeholder="122425636" name="mobile" required>
    </div>
    </div>
    
  <div class="form-row">
  <div class="form-group col-md-8">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="address" required>
  </div>
  </div>

<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" id="inputCity"  name ="city" required>
    </div>
    
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
      <select id="inputState" class="form-control" name="state">
      <option selected>Choose........</option>
        <option>Uttar Pradesh</option>
         <option>Uttrakhand</option>
          <option>Himachal Pradesh</option>
           <option>Haryana</option>
            <option>Arunachal Pradesh</option>
              <option>Bihar</option>
      </select>
    </div>

  </div>
  
   <div class="form-row">
    <div class="form-group col-md-8">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="inputPassword41" name ="password" placeholder="Password" required>
    </div>
    </div>
  
   <div class="form-row">
    <div class="form-group col-md-8">
      <label for="inputPassword4">Confirm Password</label>
      <input type="password" class="form-control" id="inputPassword4" placeholder="Password" name="confpass" required>
    </div>
    </div>
    
  <input type="checkbox" onclick="myFunction()">Show Password<br><br>
  <button type="submit" class="btn btn-primary">Sign in</button>
  
</form>
	</div>
	<script>
function myFunction() {
  var x = document.getElementById("inputPassword4");
  var y = document.getElementById("inputPassword41");
  if (x.type === "password" && y.type==="password" ) {
    x.type = "text";
    y.type = "text";
  } else {
    x.type = "password";
    y.type = "password"
  }
}
</script>

				<% 
String msg=request.getParameter("msg");
if(msg!=null)
{
String color=request.getParameter("color");	
%>
<label style="position: absolute;left:40%;top:70%;" class="<%=color%>"><%=msg%></label>
<%	
}
%>
	
</body>
</html>