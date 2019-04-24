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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Login</title>
<style type="text/css">
.footer{
  position: absolute;
  background-color: red;
  height:50px;
  color: white;
  width: 100%;
   padding: 10px;
}
</style>
<script>
	function passwordvalidate(form) {
		pwd = form.pwd.value;
		retypepwd = form.retypepwd.value;

		// If password not entered 
		if (pwd == '')
			alert("Please enter Password");

		// If confirm password not entered 
		else if (retypepwd == '')
			alert("Please enter confirm password");
		else if(pwd.length()<8)
			{
			alert("Please enter Minimum Of 8 characters");
			return false;
			}
		// If Not same return False.     
		else if (pwd != retypepwd) {
			alert("\nPassword did not match: Please try again...")
			return false;
		}

		// If same return True. 
		else {
			return true;
		}
	}
</script>
</head>
<body class="spiltup" background="restrobg.png"style="background-size : 100%" >
<center><b style="color:tomato;font-size:50px;">WELCOME TO SUBG RESTAURANT</b></center>
  <div class="container-fluid">
  <div class="row">
  <div class = "col-sm-6">
  <div class="container mt-2"  style ="margin-right:5%; margin-left:5%;padding-top:270px;padding-bottom:270px;">
   <div>
		 <center><img src="avatar2.png" alt="Avatar man" class="img-circle" style = "height:150px; width: 150px;border-radius: 50%"></center>
		</div>
		<p></p>
  <center>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal"style="font-size:20px;border-radius:20px;"">
    Login
  </button>
  <div>
  <%if(request.getSession().getAttribute("regname")==null){ %>
 <%}else{String str=request.getSession().getAttribute("regname").toString(); %>
 <b style = "color:green;opacity:0.9">&nbsp;&nbsp;Successfully Registered Please continue login </b>
 <% request.getSession().setAttribute("regname",null);} %>
 
		<%if(request.getSession().getAttribute("access")==null){ %>
 <%}else{String str=request.getSession().getAttribute("access").toString(); %>
 <b style = "color:#FF0000">&nbsp;&nbsp; Please Enter the Valid Credentials </b>
 <% request.getSession().setAttribute("access",null);} %>
  </div>



  </center>

  <!-- The Modal -->
  
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header"style = "background-color:LightGrey;opacity:0.6">
        <b style = "font-size:30px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Login Here </b>
         <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" style = " background-image:url('img4.jpg');">
          <form autocomplete="off" action="LoginController" method="post" style="margin-top:2%;margin-right:5%; margin-left:5%;padding-top:170px;padding-bottom:170px">
  <div>
		 <center><img src="avatar2.png" alt="Avatar man" class="img-circle" style = "height:150px; width: 150px;border-radius: 50%"/></center>
		</div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">Username</label>
    <input type="text" class="form-control" placeholder="Enter Username" name="uname"style = "border-radius:20px;" required/>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" name="pwd" placeholder="Password"style = "border-radius:20px;" required/>
  </div>
 
  <button type="submit" class="btn btn-primary">Submit</button>
<p></p>
        </div>
      
 </form>
 <script src="homefun.js"></script>
 <br/>
 
  </div>
  
      </div>
    </div>
  </div>
  	
</div>
  
	
  <div class="col-sm-6">
     
    
     <div class="container mt-2"style ="margin-right:5%; margin-left:5%;padding-top:270px;padding-bottom:270px">
  <center>  <div>
		 <center><img src="img_avatar.png" alt="Avatar man" class="img-circle" style = "height:150px; width: 150px;border-radius: 50%"></center>
		</div>
		<p></p>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1"style = "font-size:20px;border-radius:20px;">
   Register
  </button>
  <div>
   <%if(request.getSession().getAttribute("myname")==null){ %>
 <%}else{String str=request.getSession().getAttribute("myname").toString(); %>
 <b style = "color:#FF0000">&nbsp;&nbsp; Please Change the Username  <%=str %> Which is already exist  </b>
 <% request.getSession().setAttribute("myname",null);} %>
 
		<%if(request.getSession().getAttribute("myid")==null){ %>
 <%}else{String str=request.getSession().getAttribute("myid").toString(); %>
 <b style = "color:#FF0000">&nbsp;&nbsp; Please Change the UserId  <%=str %>  Which is already exist </b>
 <% request.getSession().setAttribute("myid",null);} %>
  
  </div>
  
  </center>

  <!-- The Modal -->
  <div class="modal fade" id="myModal1">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
        <b style = "font-size:30px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Registration Page </b>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
       <b> <div class="modal-body"style = " background-image:url('img7.jpg'); color:white">
         
           <form onSubmit="return passwordvalidate(this)" autocomplete="off"
		action="RegistrationController" method="post"
		style="margin-top: 2%; margin-right: 15%; margin-left: 15%;">
		<div>
		 <img src="img_avatar.png" alt="Avatar man" class="img-circle" style = "height:100px; width: 100px;border-radius: 50%">
		</div>
		
		<div class="form-group">
			<label for="exampleInputEmail1">Enter User ID</label> <input
				type="email" class="form-control" placeholder="example@gmail.com"
				name="uid"style = "border-radius:20px;" required/>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Enter User Name</label> <input
				type="text" class="form-control" name="uname"
				placeholder="User Name"style = "border-radius:20px;" required/>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Enter Password</label> <input
				type="password" class="form-control" name="pwd"
				placeholder="Password"style = "border-radius:20px;" required/>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Retype Password</label> <input
				type="password" class="form-control" name="retypepwd"
				placeholder="RetypePassword"style = "border-radius:20px;" required/>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Enter age</label> <input
				type="number" class="form-control" name="age" placeholder="age"style = "border-radius:20px;"
				required/>
		</div>
		<input type="radio" name="gender" value="male" required/> Male<br>
		<input type="radio" name="gender" value="female"required/> Female<br>
		<p></p>
		<div class="form-group">
			<label for="exampleInputPassword1">Enter Contact Number</label> <input
				type="text" class="form-control" name="contactnumber"style = "border-radius:20px;"
				placeholder="Contact Number" required/>
		</div>
		<button type="submit" class="btn btn-primary"style = "border-radius:20px;">Submit</button>
		
        </div></b>
      </div>
      
    </div>
   
  </div> 
  </div>
  </div>
  </div>
  
		
	
	
	</form>
	
	<script src="homefun.js"></script>
	
	<br/>
      
      
    </div>
	
	
	
 <div class ="footer">
 <center style = "font-size:20px;"><b>Contact Us</b><br/>
 <p></p>
<span class="glyphicon glyphicon-map-marker"  style="padding-top:20px;padding-bottom:20px"></span> 54,M.G. Avenue, PTC, Chennai,603110<p></p>
 <span class="glyphicon glyphicon-envelope"></span> Gesbksupport@yahoo.com<p></p>
<span class="glyphicon glyphicon-phone-alt"></span> 110-44547
</center>
 </div>

</body>




</html>
