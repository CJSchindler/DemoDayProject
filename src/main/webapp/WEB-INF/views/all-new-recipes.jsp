<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Your New Recipes</title>
</head>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css"
	rel="stylesheet">
<body>
	<%@ include file="navbar.jsp"%>

	<main class="container">
	<table class="table">
		<thead>
			<tr>
				<th>Name</th>
				<th>Time</th>
				<th>Yield</th>
				<th>Ingredients</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="meals" items="${myMeals}">

				<tr>

					<td>${meals.label}</td>
					<td>${meals.totalTime} minutes</td>
					<td>${meals.yield} servings</td>
					<td>${meals.ingredientLines}</td>



					<td><a href="/all-new-recipes/${meals.id}/delete"
						class="btn btn-danger btn-sm"
						onclick="return confirm('Are you sure?')">Delete</a>
				</tr>

			</c:forEach>
		</tbody>
	</table>



	</main>
</body>
</html>
