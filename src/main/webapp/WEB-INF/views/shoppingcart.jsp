<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping List</title>
</head>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css" rel="stylesheet">
<body>
<%@ include file="navbar.jsp"%>
<div class="container">
<br>
	<h2>Shopping List for this week</h2>
	<p><h4>Delete any items you already have on hand.</h4></p>
	<p><h5>For items you want to combine, check the boxes and click "merge" at the bottom of the list.</h5></p>

	<form action="/merge">
	<table class="table">
			<thead>
				<tr>
					<th>Item</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="ingredient" items="${shoppingList}">
				<tr>
					<td>
					<input type="checkbox" name="merge" value="${ingredient.id}"></td>
					<td>${ingredient.text}</td>
					<td><a href="/shoppingcart/${ingredient.id}/delete" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
	</table>
	<button type="submit" class="btn btn-warning">Merge</button>
	<br><br>
	</form>
</div>

<!-- <a href="/calendar" type="button" class="btn btn-success" style="margin:5px">Back to Calendar!</a>
 -->
 </body>
</html>
