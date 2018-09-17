<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Recipe's</title>
</head>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css" rel="stylesheet">	
<body>
<%@ include file="navbar.jsp"%>
	<h1> YOUR RECIPES!</h1>
	<thead>
				<tr>
					    <th>Recipe</th> <th>Ingredients</th> <th>Total Time</th> <th>Yield</th>
					<tr> ${myMeal.label} ${myMeal.ingredientLines } ${myMeal.totalTime} ${myMeal.yield} </tr>
			
			</thead>
	
</body>
</html>