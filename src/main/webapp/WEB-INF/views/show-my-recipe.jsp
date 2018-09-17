<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Recipe's</title>
</head>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css"
	rel="stylesheet">
<body>
	<%@ include file="navbar.jsp"%>
	<h1>YOUR RECIPES!</h1>
	<table class="table-hover">
		<thead>
			<tr>
				<th>Recipe</th>
				<th>Total Time</th>
				<th>Yield</th>
				<th>Ingredients</th>
			</tr>
		</thead>
		<tr>
			<td>${myMeal.label}</td>
			<td>${myMeal.totalTime}</td>
			<td>${myMeal.yield}</td>

			<td><c:forEach var="ingredient" items="${ingredientList}"> 
				<p>${ingredient }</p>
				</c:forEach></td>

		</tr>
	</table>
</body>
</html>