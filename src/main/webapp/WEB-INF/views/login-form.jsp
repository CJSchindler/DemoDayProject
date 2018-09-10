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
<br>
<button type="button" class="btn btn-outline-primary" href="/"><a href="/">Back</a></button>
<br>
<h1 class="form-heading">Member Login</h1>
<div class="login-form">
<div class="main-div">
    <div class="panel">
    
   <p>Please enter your email and password </p>
   <c:if test="${not empty fail }">
   <div class="test"> ${fail } </div>
   </c:if>
   </div>
   
    <form action="/login" id="Login" method="post">
    
   		

        <div class="form-group">

            <input type="email" class="form-control" name="email" id="email" placeholder="Email Address" value= "${email }" >

        </div>

        <div class="form-group">

            <input type="password" class="form-control" name="password" id="password" placeholder="Password">

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