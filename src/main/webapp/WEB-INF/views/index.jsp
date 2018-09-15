<%@ page language="java"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log in</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css">

<body>
<main class="container">
	<%@ include file="emptynavbar.jsp"%>
<div class="jumbotron">
  <h1 class="display-4">Take control of your time!</h1>
  <p class="lead">We know you are busy. </p><p class="lead">Let us help you plan your meals so you can eat healthy and and save money.</p>
  <hr class="my-4">
  <p>Already a member? Log in here:</p>
  <p class="lead">
    <a class="btn btn-primary btn-lg" href="/login" role="button">Log in</a>
  </p>
  <p>New user? Register here:</p>
  <p class="lead">
    <a class="btn btn-secondary btn-lg" href="/register" role="button">Register</a>
  </p>
</div>


</body>
</main>
</html>