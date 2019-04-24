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
<title>Home</title>
<style type="text/css">
.flip-card {
  background-color: transparent;
  width: 300px;
  height: 300px;
 
  border-radius:50px;
  perspective: 1000px; /* Remove this if you don't want the 3D effect */
}

/* This container is needed to position the front and back side */
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
  border-radius:50px;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
  background-color: #bbb;
  color: black;
}

/* Style the back side */
.flip-card-back {
  background-color: dodgerblue;
  color: white;
  transform: rotateY(180deg);
}


</style>
</head>
<body class="container-fluid" background="imag.jpg"
	style="color: white;background-size : 100%">
<center>
		<p style="color: tomato; font-size: 50px;">WELCOME TO SUBG
				RESTAURANT</p>
	</center>
	<%
		String c_name = null;
		if (request.getSession().getAttribute("Current_User_Name") == null) {
			response.sendRedirect("index.jsp");
		} else {
			c_name = request.getSession().getAttribute("Current_User_Name").toString().toUpperCase();
		}
	%>                                     
 
<div class="container-fluid">
  <div class="row">
    <div class = "col-sm-3">
   <img src="img0.png" alt="Avatar" style="width:70px;height:60px; border-radius:5px;">
      </div>
        <div class="col-sm-3" style="font-size:20px;">
       
       </div>
       <div class="col-sm-3" style="font-size:20px;">
       
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
   
   <center>
   <div>
   <div class="row">
    <div class="col-sm-6" style="font-size:20px;">
     <div class="container mt-2"  style ="margin-right:5%; margin-left:5%;padding-top:250px;padding-bottom:250px;">
   <div class="flip-card">
  <div class="flip-card-inner">
  STAFF
    <div class="flip-card-front">
      <center><img src="img8.png" alt="Avatar" style="width:300px;height:300px; border-radius:50px;">
    </center></div>
    <div class="flip-card-back">
    <p></p>
    <p> TO View Staff</p>
    <p>Details</p> 
     <a href="displayStaff.jsp"><center  style="color: #d83915;font-size:20px">Staff Details</center></a>
      
    </div>
  </div>
</div>
</div>
</div>
  <div>
    <div class="col-sm-6" style="font-size:20px;">
     <div class="container mt-2"  style ="margin-right:5%; margin-left:5%;padding-top:250px;padding-bottom:250px;">
   <div class="flip-card">
  <div class="flip-card-inner">
  INVENTORY
    <div class="flip-card-front">
      <center><img src="img9.png" alt="Avatar" style="width:300px;height:300px; border-radius:50px;">
    </center></div>
    <div class="flip-card-back">
    <p> </p>
    <p> TO View Inventory</p>
    <p>Details</p> 
     <a href="display.jsp"><center  style="color: #d83915;font-size:20px">Inventory Details</center></a>
      
    </div>
  </div>
</div>
</div>
</div>
   </div>
   </div>
   </div>
   </center>
   
   
</body>
</html>
