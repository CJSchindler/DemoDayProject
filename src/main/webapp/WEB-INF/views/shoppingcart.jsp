<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping List</title>
</head>
<body>
<div class="container">
	<h1>SHOPPING CART!</h1>

	<table class="table">
			<thead>
				<tr>
					<th>Item</th><th>Y/N</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ingredient" items="${shoppingList}">
				<tr>
					<td>${ingredient.text}</td>
					<td><a href="/shoppingcart/${ingredient.id}/delete" class="btn btn-light btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
					</td>
				</tr>	
				</c:forEach>
			</tbody>
	</table>
</div>			
</body>
</html>