<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Merge Items</title>
</head>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css" rel="stylesheet">
<body>
<%@ include file="navbar.jsp"%>
<div class="container">
<br>
	<h2>Merge list items</h2>

	<table class="table">
			<thead>
				<tr>
					<th>You have chosen these items to merge: </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ingredient" items="${mergeList}">
				<tr>
					<td>${ingredient.text}</td>
				</tr>
				</c:forEach>
			</tbody>
	</table>
	<br>
	<p><h5>We will delete these items and replace them with a new item.</h5></p>
	What do you want to call your new item?
	<form action="/complete-merge/${start}/${end}">
	<c:forEach var="ingredient" items="${mergeList}">
		<input type="hidden" name="mergeList" value="${ingredient.id}">
	</c:forEach>
	<input type="text" name="newIngredient" style="width: 400px">
		<input type="hidden" name="start" value="${start}">
		<input type="hidden" name="end" value="${end}"><br><br>
	<button type="submit" class="btn btn-warning">Replace above items with my new item</button>
	</form>
</div>

 </body>
</html>
