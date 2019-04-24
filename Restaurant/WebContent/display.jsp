<%@page import="Dao.ProductDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inventory Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>	
<script>
function showResult(str) {
	
  if (str.length == 0) { 
    document.getElementById("result").innerHTML = "";
    return;
  } else {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("result").innerHTML = this.responseText;
      }
    };
    xmlhttp.open("GET", "SearchProductController?q=" + str, true);
    xmlhttp.send();
  }
}	 
function deleteFunction(str) {
	
  if (confirm("Are you Sure to Delete this Inventory "+str)) {
	  document.location = "DeleteProductController?delete="+str;
  } else {
    document.locatioin = "display.jsp";
  }
  
}
</script>
<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: Arial;
  font-size: 17px;
}

#myVideo {
  position: fixed;
  right: 0;
  bottom: 0;
  min-width: 100%; 
  min-height: 100%;
}

.content {
  position: fixed;
 
  background: rgba(0, 0, 0, 0.5);
  color: #f1f1f1;
  width: 100%;
  padding: 20px;
}

#myBtn {
  width: 200px;
  font-size: 18px;
  padding: 10px;
  border: none;
  background: #000;
  color: #fff;
  cursor: pointer;
}

#myBtn:hover {
  background: #ddd;
  color: black;
}
table{
align: right;
  font-family: arial, sans-serif;
  width: 1200px;
  height:30px;
  color:white;
  padding:20px;
  border-collapse:seperate;
 
  font-size:15px;
  border-radius:30px;
}
</style>

</head>


<body class="container-solid" style="background:lightgoldenrodyellow;color: white;">

<video autoplay muted loop id="myVideo">
  <source src="back.mp4" type="video/mp4">
  Your browser does not support HTML5 video.
</video>

<center>
		<p style="color: tomato; font-size: 50px;">WELCOME TO SUBG
				RESTAURANT</p>
	</center>
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
    <div class = "col-sm-3">
    <a href="home.jsp">Home</a>
      </div>
        <div class="col-sm-3" style="font-size:20px;">
         <div class="container mt-3">
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
   ADD Inventory
  </button>
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" style="background-color:#f47142">
          <h4 class="modal-title"style="color:#f44289;">Add inventory</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" style = " background-image:url('img6.jpg');">
         
         <form autocomplete="off" action="addproductController" method="post" style="margin-top:2%;margin-right:40%; margin-left:15%; color:white; font-size:20px;">
<div class = "form-group">
 <label for="exampleInputEmail1">Enter the inventory id:</label>
<input type="text" class = "form-control" placeholder = "Enter Product Id" name="inventoryid" />
</div>
<br/>
 <div class = "form-group">
<label>Enter inventory Name:</label>
<input type="text" class="form-control" placeholder = "Enter the Product Name" name="inventoryname" />
</div><br/>
<div class = "form-group">
<label> Enter creation date:</label>
<input type="Date" class="form-control" placeholder = "Enter Product Creation Date"name="creationdate" />
</div><br/>
<div class = "form-group">
<label> Enter Start date:</label>
<input type="Date" class="form-control" placeholder = "Enter Start Date" name="startdate" />
</div><br/>
<div class = "form-group">
<label> Enter End date:</label>
<input type="Date" class="form-control" placeholder = "Enter End Date" name="enddate" />
</div><br/>
<div class = "form-group">
<label> Enter Total Stock:</label>
<input type="text" class="form-control" placeholder = "Enter Total Stock" name="totalstock" />
</div><br/>
    <button type="submit" class="btn btn-info">Submit</button><br/>
 </form>
         
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
       </div>
       <div class="col-sm-3" style="font-size:20px;">
      <form>
      <div class="form-group">
        <input type="text" class="form-control" onkeyup = "showResult(this.value)" placeholder="Search" name="search">
      </div>
    </form>
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


<center><h3 style ="color:MediumSeaGreen">List of all Available ITEMS :</h3></center>

<%
	List<Product> productList = new ArrayList<>();
productList = new ProductDAOImpl().getAllProducts();
%>

<div id="result" class ="content">
<b><center><table class="content">
	<tr class ="table"><th>Inventory id</th><th>Inventory Name</th><th> Creation Date</th><th> Start Date</th><th> End Date</th><th>Total Stock</th><th> Edit</th><th>Delete</th></tr>

	<%
		for( Product temp: productList) {
	%>
	<tr> <td> <%=temp.getInventory_Id() %> </td>   <td> <%=temp.getInventory_Name() %> </td> <td> <%= temp.getCreation_date() %> </td>   <td> <%=temp.getStart_date()%> </td>  <td> <%=temp.getEnd_date()%> </td>  <td>
	<%=temp.getTotal_Stock() %></td> <td>
	<a href="EditProductController?id=<%=temp.getInventory_Id()%>"class="btn btn-info" ><span class="glyphicon glyphicon-edit"></span> EDIT</a></td><td>
	<button class="btn btn-danger" onclick = "deleteFunction(<%=temp.getInventory_Id() %>)"> <span class="glyphicon glyphicon-trash"></span> DELETE</button></td> </tr>
	<%} %>
</table></center></b>
<script src="homefun.js"></script>
</div>
<%if(request.getSession().getAttribute("add")==null){ %>
 <%}else{String str=request.getSession().getAttribute("add").toString(); %>
 <b style = "color:MediumSeaGreen">&nbsp;&nbsp; Inventory added Successfully </b>
 <% request.getSession().setAttribute("add",null);} %>
</body>
</html>