<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css">
<title>Add Your Recipe!</title>
</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css">

<body>

<form action="/myrecipe" method= "post">
	<%@ include file="navbar.jsp"%>
	<div class="progress">
		<div class="progress-bar progress-bar-striped bg-warning"
			role="progressbar" style="width:${progressTime }%"
			aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<h1>Please fill in these items!</h1>
	<p>
		Name of Recipe: <input name="label" required />
	</p>
	<p>
		Yields: <input name="yield" required />
	</p>
	<p>
		Time: <input name="totalTime" required />
	</p>
		
	<div id="room_fileds">
		<div class='label'>Ingredients: <input type="text" name="ingredientLines" required><br><br></div>
		<div class="content" id="ingredient">
		</div>
		<input type="button" id="more_fields" onclick="add_fields();"
		value="Add More Ingredients" /><br> <br>
		
	</div>
	<button type="submit" class="btn-btn-primary mb-2">Add My
		Recipe!</button>
		
<script>
 function add_fields() {
    document.getElementById('ingredient').innerHTML += 
    	'<span>Ingredient <input type="text" name="ingredientLines"></span>\r\n<br><br>';
} 


</script>


</body>
</html>
