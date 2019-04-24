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
<title>Change Password</title>

</head>
<body background="restrobg.png" style ="color:white;background-size:100%">
<center><p style="color:tomato;font-size:50px;">WELCOME TO SUBG RESTAURANT</p></center>
<form autocomplete="off" action="PasswordController" method="post" style="margin-top:2%;margin-right:40%; margin-left:10%;">
  <div class="form-group">
    <label for="exampleInputEmail1">Enter User ID</label>
    <input type="Email" class="form-control" placeholder="Example@gmail.com" name="userid" required>
  </div><div class="form-group">
    <label for="exampleInputEmail1">Enter Current Password</label>
    <input type="password" class="form-control" placeholder="Current Password" name="cpwd" required>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Enter New Password</label>
    <input type="password" class="form-control" name="npwd" placeholder="New Password" required>
  </div>

  <button type="submit" class="btn btn-primary">Submit</button>
</form>
<script src="homefun.js"></script>
</body>
</html>