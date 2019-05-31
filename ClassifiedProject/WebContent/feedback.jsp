<%@ include file = "header.html" %>
<br><br>
<h4 align = "center">This is Contact page</h4>

<form action="add_feedback_db.jsp">
 <div style="position:absolute;left:50%; top: 300px">
<img src="images/download.jpg">
</div>
<table style="width:550px;border:0;" cellpadding="8" cellspacing="0">
<tr> <td>
<label for="Name">Name*:</label>
</td> <td>
<input name="Name" type="text" maxlength="60" style="width:250px;" />
</td> </tr> <tr> <td>
<label for="PhoneNumber">Phone number:</label>
</td> <td>
<input name="PhoneNumber" type="text" maxlength="43" style="width:250px;" />
</td> </tr> <tr> <td>
<label for="FromEmailAddress">Email address*:</label>
</td> <td>
<input name="FromEmailAddress" type="email" maxlength="90" style="width:250px;" />
</td> </tr> <tr> <td>
<label for="Comments">Comments*:</label>
</td> <td>
<textarea name="Comments" rows="7" cols="40" style="width:350px;"></textarea>
<br><br>
<input name="skip_Submit" type="submit" value="Submit" />

</td> </tr>
</table>
</form>

</div>

<% 
String msg=request.getParameter("msg");
if(msg!=null)
{
String color=request.getParameter("color");	
%>
<label style="position: absolute;left:40%;top:80%;" class="<%=color%>"><%=msg%></label>
<%	
}
%>
</body>
</html>