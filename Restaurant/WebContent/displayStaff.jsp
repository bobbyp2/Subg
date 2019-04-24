<%@page import="Dao.StaffDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Staff"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
<title>Staff Details</title>

	<center>
		<b style="color: tomato; font-size: 50px;">WELCOME TO SUBG
				RESTAURANT</b>
	</center>
	<style type="text/css">
table{
align: right;
  font-family: arial, sans-serif;
  width: 1200px;
  height:30px;
  color:white;
  padding:20px;
  border-collapse:seperate;
  background-color:seagreen;
  font-size:15px;
  border-radius:10px;
}
</style>
<script>
function delet(sr) {
	 
	  if (confirm("Are you Sure to Delete this Staff "+sr)) {
	  document.location = "DeleteStaffController?s1="+sr;
	  } else {
	    document.locatioin = "displayStaff.jsp";
	  }
	 
	}

</script>
	
</head>
<body class="container-solid" background="gr bg.jpg"
	style="color: white;">

	<%
		String c_name = null;
		if (request.getSession().getAttribute("Current_User_Name")== null) {
			response.sendRedirect("index.jsp");
		} else {
			c_name = request.getSession().getAttribute("Current_User_Name").toString().toUpperCase();
		}
	%>

	<div class="container-fluid">
  <div class="row">
    <div class = "col-sm-4">
    <center style="color:#3473d8"><a href="home.jsp">Home</a></center>
      </div>
 
       <div class="col-sm-4">
        <div class="container">
 <center>
  <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Add Staff</button>
</center>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color:#f4b942">
         <center> <p style ="color:#f442eb;font-size:25px">Enter Staff Details</p></center>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body"style = " background-image:url('img6.jpg');">
        
<form autocomplete="off" action="AddStaffController" method="post" style="margin-top:2%;margin-right:15%; margin-left:7%; color:#870dc4;padding-top:120px;padding-bottom:120px">
  <b><div class="form-group">
  
    <label for="exampleInputEmail1">Enter First Name</label>
    <input type="text" class="form-control" placeholder="First Name" name="fname" required/>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Enter Last Name</label>
    <input type="text" class="form-control" name="lname" placeholder="Last Name" required/>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Enter Age</label>
    <input type="text" class="form-control" name="age" placeholder="Age" required/>
  </div>
  <label for="exampleInputPassword1">Gender</label></br>
		<input type="radio" name="gender" value="male"/> Male<br>
		<input type="radio" name="gender" value="female"/> Female<br>
		<p></p>
  <div class="form-group">
    <label for="exampleInputPassword1">Address with contact number</label>
    <input type="text" class="form-control" name="address" placeholder="Address" required/>
  </div>
 </b>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
        
        </div>
        <div class="modal-footer">
        
        </div>
      </div>
      
    </div>
  </div>
  
</div>
       </div>
       <div class="col-sm-3" style="font-size:20px;">
         <div class="dropdown">
           <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"style="float:right"><%=c_name%>
           <span class="caret"></span></button>
            <ul class="dropdown-menu">
             <li class = "dropdown-item"><a href="#"onclick="changePassword();">Change Password</a></li>
             <li class = "dropdown-item"><a href="LogoutController">Logout</a></li>
            </ul>
         </div>
      </div>
   </div>
</div>
   <script src="homefun.js"></script>
   <p> </p>
   <center><h2 style="color:SlateBlue">
   List of all the Staff Details
   </h2></center>
   <p> </p>
<% 
List<Staff> staffList = new ArrayList<>();
staffList = new StaffDaoImpl().getAllStaff();
%><b>
<center>
<table>
<tr><td>First Name</td><td>Last Name</td><td> Age</td><td>Gender</td><td> Address </td><td> Staff Id</td></tr></b>
	<% for( Staff temp: staffList) { %>
	<tr> <td> <%=temp.getFirst_name() %> </td><td> <%=temp.getLast_name() %> </td> <td> <%= temp.getAge() %></td><td><%=temp.getGender() %> </td>  
	<td> <%=temp.getAddress() %> </td>  <td><%=temp.getStaff_id()%> </td><td>
	<button class="btn btn-danger"  onclick="delet('<%=temp.getStaff_id()%>')"> <span class="glyphicon glyphicon-trash"></span> DELETE</button></td>
	<td><a href="EditStaffController?id=<%=temp.getStaff_id() %>"class="btn btn-info" ><span class="glyphicon glyphicon-edit"></span> EDIT</a></td></tr>
	<%} %>
</table></center>
<script src="homefun.js"></script>
</body>
</html>