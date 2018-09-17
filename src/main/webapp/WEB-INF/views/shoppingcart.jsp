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
	<c:if test="${ not empty message }">
		<div class="test" style="color: pink;">${ message }</div>
	</c:if>
	<h2 align="center">Shopping List for this week</h2><br>
	<ul>
	<li><h6>Delete any items you already have on hand.</h6>
	<li><h6>To combine items, check the boxes and click "merge" at the bottom of the list.</h6>
	<li><h6>You can add new items to the list by clicking "add" at the bottom of the list.</h6>
</ul>
	<form action="/merge/${start}/${end}">
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
	<form action="/new-item-to-list">
		<c:forEach var="ingredient" items="${shoppingList}">
		<input type="hidden" name="favorite" value="${ingredient.favorite.id}">
		<input type="hidden" name="start" value="${start}">
		<input type="hidden" name="end" value="${end}">
		</c:forEach>
		<input type="text" name="newIngredient" placeholder="e.g. paper towels" style="width: 400px"><br><br>
	<button type="submit" class="btn btn-info">Add new item to list</button>
</form>
</div>

<!-- <a href="/calendar" type="button" class="btn btn-success" style="margin:5px">Back to Calendar!</a>
 -->
 </body>
</html>
