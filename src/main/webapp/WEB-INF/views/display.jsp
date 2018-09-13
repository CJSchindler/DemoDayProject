<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${day }</title>
</head>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css" rel="stylesheet">
<body>
	<main class="container">
	
		<h1> Meal for ${day } from ${searchType } </h1>
		<p>You said you have ${time } minutes to make your meal.</p>
		<p>What main ingredient would you like to have on this day?</p>
		<p>Enter a keyword to begin your search: </p>
		
		<form class="search" action="/display/${searchType }/${time}/${date}">
		  <input type="text" placeholder="Chicken, vegetarian..." name="keyword">
		  <button type="submit">Submit</button>
		</form>
		
		<c:if test="${not empty keyword}">
		<form action="/add-to-menu/${date }" method="post">
		<table class="table">
			<thead>
				<tr>
					<th>    </th><th>Image</th><th>Recipe</th><th>Ingredients</th><th>Total Time</th><th>Yield</th>
				</tr>
			</thead>

				<tbody>
				<c:choose>
				<c:when test="${searchType eq 'favorites'}">
				
					<c:forEach var="recipe" items="${ favorites }">
					<tr>
						<td><input type="radio" name="label" value="${recipe.label}">
		 					<input type="hidden" name="image" value="${recipe.image}"></td>
		 				
						<td><img src="${recipe.image}" width=60%></td>
						<td><a href="${recipe.url}">${recipe.label}</a></td>
						<td>${recipe.url}</td>
					</tr>
					</c:forEach>
				</c:when>
				
				<c:when test="${searchType eq 'new' }">
					<c:forEach var="recipe" items="${ recipelist }">
					<tr>
						<td><input type="radio" name="label" value="${recipe.recipe.label}">
						<input type="hidden" name="image" value="${recipe.recipe.image}">
						<input type="hidden" name="url" value="${recipe.recipe.url}">
						<input type="hidden" name="ingredientLines" value="${recipe.recipe.ingredientLines}">
						</td>
						<td><img src="${recipe.recipe.image}" width=60%></td>
						<td><a href="${recipe.recipe.url}">${recipe.recipe.label}</a></td>
						<td>
							<c:forEach var="ingredient" items="${recipe.recipe.ingredientLines}">
							<p>${ingredient}</p>
							</c:forEach>
						</td>
						<td>${recipe.recipe.totalTime} minutes</td>
						<td>${recipe.recipe.yield}</td>
					</tr>
					</c:forEach>
					
					</c:when>
					</c:choose>
				</tbody>
		</table>
		<button type="submit">Add to menu</button>
		</form>
		</c:if>
	</main>
</body>
</html>