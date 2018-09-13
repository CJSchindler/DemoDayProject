<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Log-in Form</title>
</head>
<link href="https://bootswatch.com/4/minty/bootstrap.min.css" rel="stylesheet">
<body id="LoginForm">
<main class="container">
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  		<a class="navbar-brand" href="#">Meal Prep</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>

  	<div class="collapse navbar-collapse" id="navbarColor01">
    	<ul class="navbar-nav mr-auto"></ul>
  	</div>
	</nav>
<br>
<!--  <button type="button" class="btn btn-outline-primary" href="/"><a href="/">Back</a></button> -->
<h1 class="form-heading">Member Login</h1>
<div class="login-form">
<div class="main-div">
    <div class="panel">
    
   <p>Please enter your email and password </p>
   
   <c:if test="${not empty message }">
   <div class="test"> ${message } </div>
   </c:if>
   </div>
   
    <form action="/login" id="Login" method="post">
    
   		

        <div class="form-group">

            <input type="email" class="form-control" name="email" id="email" placeholder="Email Address" value= "${email }" required>

        </div>

        <div class="form-group">

            <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>

        </div>
        
        <!-- Perhaps add this functionality later! Just create another jsp that will 
        update password for the user matching the email address?
        -->
        <div class="forgot">
        <a href="/reset">Forgot password?</a>
		</div>
        <button type="submit" class="btn btn-primary">Login</button>
        <!--  Gives option to register if not a member -->
        </form action="/register">
        <br>
        <form>
        <a href="/register" type="button" class="btn btn-secondary btn-sm" href="/register">Not a member? Register</a>
		</form>
</main>
</body>
</html>