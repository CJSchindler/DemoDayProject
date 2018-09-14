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
	
		<h1> Meal for ${day } from ${searchType } recipes</h1>
		<p>You said you have ${time } minutes to make your meal.</p>
		
		<c:choose>
		<c:when test="${searchType eq 'new' }">
		<p>What main ingredient would you like to have on this day?</p>
		<p>Enter a keyword to begin your search: </p>
		
		<form class="search" action="/display/${searchType }/${time}/${date}">
		  <input type="text" placeholder="Chicken, vegetarian..." name="keyword">
		  <input type="hidden" name="searchType" value="${searchType }">
		  <button type="submit">Submit</button>
		</form>
		
		<c:if test="${not empty keyword}">
		<table class="table">
			<thead>
				<tr>
					<th>    </th><th>Image</th><th>Recipe</th><th>Ingredients</th><th>Total Time</th><th>Yield</th>
				</tr>
			</thead>

				<tbody>
		
		<c:forEach var="recipe" items="${ recipelist }">
					<tr>
						<td>
						<form action="/add-to-menu/${date }" method="post">
						<input type="hidden" name="label" value="${recipe.recipe.label}">
						<input type="hidden" name="image" value="${recipe.recipe.image}">
						<input type="hidden" name="url" value="${recipe.recipe.url}">
						<input type="hidden" name="ingredientLines" value="${recipe.recipe.ingredientLines}">
						
						
                    		<button  type="submit" class="btn btn-outline-success">Add</button>
                		</form>
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
		
			</tbody>
		</table>
		<br><br><br>
		</c:if>
		
		</c:when>
		
		<c:otherwise>
		
		
		<form action="/add-to-menu/${date }" method="post">
		<table class="table">
			<thead>
				<tr>
					<th>    </th><th>Image</th><th>Recipe</th><th>Ingredients</th><th>Total Time</th><th>Yield</th>
				</tr>
			</thead>

				<tbody>
				
				
					<c:forEach var="recipe" items="${ favorites }">
					<tr>
						<td>
							<form action="/add-to-menu/favorites/${date }" method="post">
							<input type="hidden" name="label" value="${recipe.label}">
							<input type="hidden" name="image" value="${recipe.image}">
							<input type="hidden" name="url" value="${recipe.url}">
							<input type="hidden" name="searchType" value="${searchType }">
							<input type="hidden" name="ingredientLines" value="${recipe.ingredientLines}">
						
                    		<button  type="submit" class="btn btn-outline-success">Add</button>
                		</form>
						</td>
						
						<td><img src="${recipe.image}" width=60%></td>
						<td><a href="${recipe.url}">${recipe.label}</a></td>
						<td>${recipe.url}</td>
					</tr>
					</c:forEach>
				</tbody>
		</table>
		<button type="submit">Add to menu</button>
		<br><br><br>
		</form>
		
		</c:otherwise>
		</c:choose>
	</main>
</body>
</html>