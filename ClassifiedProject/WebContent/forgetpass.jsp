<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file = "header.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="js/bootstrap.min.js"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forget Password Page</title>
</head>
<body>
  <div class = "container pt-5">
  <h1>Change Password Page</h1>
  	<form action="change_pass.jsp" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email"required >
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
   <div class="form-group">
    <label for="Mobileno">Mobile Number</label>
    <input type="number" class="form-control" id="Mobileno" placeholder="Enter the registered number" name="mobile" required>
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password" required>
  </div>
 
  <div class="form-group">
    <label for="exampleInputPassword1">Confirm Password</label>
    <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Confirm Password" name="confpass"  required>
  </div>
   
     <input type="checkbox" onclick="myFunction()">Show Password<br><br>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
  </div>
  
  	<script>
function myFunction() {
  var x = document.getElementById("exampleInputPassword1");
  var y = document.getElementById("exampleInputPassword2");
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