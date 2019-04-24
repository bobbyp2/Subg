<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit inventory page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
</head>
<body class="container-solid" background="img4.jpg"style="background-size : 100%;color: white;">
<center>
		<b><p style="color:#3066e5; font-size: 50px;">WELCOME TO SUBG
				RESTAURANT</p></b>
	</center>
	<%
		String c_name = null;
		if (request.getSession().getAttribute("Current_User_Name") == null) {
			response.sendRedirect("index.jsp");
		} else {
			c_name = request.getSession().getAttribute("Current_User_Name").toString().toUpperCase();
		}
	%>
	<center>
	<div class="container-fluid">
	 <div class="row">
    <div class = "col-sm-4">
    <a href="home.jsp">Home</a>
      </div>
       <div class="col-sm-4" style="font-size:20px;">
      <a href="display.jsp">Inventory Details</a>
       </div>
       <div class="col-sm-4" style="font-size:20px;">
         <div class="dropdown">
           <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><%=c_name%>
           <span class="caret"></span></button>
            <ul class="dropdown-menu">
             <li class = "dropdown-item"><a href="#"onclick="changePassword();">Change Password</a></li>
             <li class = "dropdown-item"><a href="LogoutController">Logout</a></li>
            </ul>
         </div>
      </div>
   </div>
</div>
</center>

	<%
		Product product = new Product();
		product = (Product) request.getAttribute("key1");
	%>

	<b><center><h5>Welcome to Edit DETAILS</h5></center>
	<div class="container-fluid">
		<form autocomplete="off" action="EditProductController" method="post" style="margin-top: 2%; margin-right: 40%; margin-left: 30%;color:MediumSeaGreen;font-size:20px;">
			<div class="form-group">
				<label for="exampleInputEmail1">Enter the inventory id:</label> <input
					type="text" class="form-control" placeholder="Enter Product Id"
					readonly="readonly" name="inventoryid"
					value="<%=product.getInventory_Id()%>" />
			</div>
			<br />
			<div class="form-group">
				<label>Enter inventory Name:</label> <input type="text"
					class="form-control" placeholder="Enter the Product Name"
					name="inventoryname" value="<%=product.getInventory_Name()%>" />
			</div>
			<br />
			<div class="form-group">
				<label> Enter creation date:</label> <input type="Date"
					class="form-control" 
					placeholder="Enter Product Creation Date" name="creationdate" value=<%=product.getCreation_date() %> />
			</div>
			<br />

			<div class="form-group">
				<label> Enter Start date:</label> <input type="Date"
					class="form-control" placeholder="Enter Start Date"
					name="startdate" value=<%=product.getStart_date() %>"/>
			</div>
			<br />
			<div class="form-group">
				<label> Enter End date:</label> <input type="Date"
					class="form-control" placeholder="Enter End Date" name="enddate" value=<%=product.getEnd_date() %> />
			</div>
			<br />
			<div class="form-group">
				<label> Enter Total Stock:</label> <input type="text"
					class="form-control" placeholder="Enter Total Stock"
					name="totalstock" value=<%=product.getTotal_Stock() %>/>
			</div>
			<br />
			<button type="submit" class="btn btn-success">Submit</button>
			<br />
		</form>
		<script src="homefun.js"></script>
	</div></b>
</body>
</html>