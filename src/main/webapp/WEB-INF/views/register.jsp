<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css" rel="stylesheet"> 
<title>Register</title>
</head>
<body>
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
		<div>
			<h1 class="page-header mt-4 mb-4">Register</h1>
		</div>
	<form action="/register" method= "post">
	
		<!-- <div class="form-group"> -->
 			 <p><input type="text" class="form-control" placeholder="First Name" name="first_name"></p>
 			 <p><input type="text" class="form-control" placeholder="Last Name" name="last_name"></p>
 			 <p><input type="email" class="form-control" placeholder="Email" name="email"></p>
		<!-- </div>	 -->		 
		<div> 	    
			<!-- <p> First name: <input name="first_name" minlength="2" required/> </p>
			<p> Last name: <input name="last_name" required/> </p>
			<p> Email: <input type= "email" name="email" required/> </p> -->
		
		 	<c:if test="${ not empty passwordTest }">
				<div class="test" style="color: red;">
				${ passwordTest }
				</div>
			</c:if>
			
			<p> Password: <input type= "password" name="password" required/> </p>
			<p> Re-enter your password: <input type= "password" name="password2" required/> </p>
		</div>
		<button type="submit" class="btn btn-secondary">Register</button>
		<a href="/register" type="button" class="btn btn-info">Clear</a>
		
	</form>	
						
</main>
</body>
</html>