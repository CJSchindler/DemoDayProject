<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${day }</title>
</head>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css" rel="stylesheet">
<body>
<%@ include file="navbar.jsp"%>
	<main class="container">
    <br>
	<a href="/calendar" class="btn btn-secondary">Back to Calendar</a>
	<br />

		<h1> Searching ${ searchType }</h1>
		<p>You said you have ${ time } minutes to make your meal.</p><br>

		<c:choose>
		<c:when test="${searchType eq 'new' }">
  <form class="search" action="/display/${searchType }/${time}/${date}">
    <p>Would you like to set a maximum number of ingredients?</p>

    <div class="input-group" style="width: 130px">
      <select name="maxIngr" class="custom-select" id="inputGroupSelect04">
        <option value="" disabled selected>No thanks</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>

      </select>
      <div class="input-group-append">
      </div>
    </div>
<br>
	<p>What main ingredient would you like to have on this day?</p>

		  <input type="text" placeholder="Chicken, vegetarian..." name="keyword">
		  <input type="hidden" name="searchType" value="${searchType }">
		  <button type="submit" class="btn btn-secondary">Submit</button>
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
						<input type="hidden" name="totalTime" value="${recipe.recipe.totalTime}">
						<c:forEach var="ingredient" items="${recipe.recipe.ingredientLines}">
							<input type="hidden" name="ingredient" value="${ingredient}">
						</c:forEach>
						<input type="hidden" name="yield" value="${recipe.recipe.yield}">

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
    <button id="load-more" type="button" class="btn btn-outline-secondary">Load More</button>
		<br><br><br>
		</c:if>

		</c:when>


		<c:when test="${ searchType eq 'favorites' }">


		<form action="/add-to-menu/${ date }" method="post">
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
							<input type="hidden" name="totalTime" value="${recipe.totalTime}">
							<input type="hidden" name="searchType" value="${searchType }">
							<c:forEach var="ingredient" items="${recipe.ingredientLines}">
							<input type="hidden" name="ingredient" value="${ingredient}">
						</c:forEach>
						<input type="hidden" name="yield" value="${recipe.yield}">

                    		<button  type="submit" class="btn btn-outline-success">Add</button>
                		</form>
						</td>

						<td><img src="${recipe.image}" width=60%></td>
						<td><a href="${recipe.url}">${recipe.label}</a></td>
						<td>
						<c:set var="ingredients" value="${fn:split(recipe.ingredientLines, '--') }"/>
						<c:forEach var="ingredient" items="${ingredients }">
						<p>${ingredient }</p>
						</c:forEach>
						</td>
						<td>${recipe.totalTime} minutes</td>
						<td>${recipe.yield} servings</td>
					</tr>
					</c:forEach>
				</tbody>
		</table>
		<br><br><br>
		</form>


		</c:when>

		<c:when test="${searchType eq 'myMeals' }">
		<form action="/add-to-menu/myMeals/${date }" method="post">
		<table class="table">
			<thead>
				<tr>
					<th>    </th><th>Image</th><th>Recipe</th><th>Total Time</th><th>Yield</th>
				</tr>
			</thead>

				<tbody>


					<c:forEach var="recipe" items="${ myMeals }">
					<tr>
						<td>
							<form action="/add-to-menu/myMeals/${date }" method="post">
							<input type="hidden" name="label" value="${recipe.label}">
							<input type="hidden" name="image" value="${recipe.image}">
							<input type="hidden" name="yield" value="${recipe.yield}">
							<input type="hidden" name="totalTime" value="${recipe.totalTime}">
							<input type="hidden" name="searchType" value="${searchType }">
							<input type="hidden" name="ingredientLines" value="${recipe.ingredientLines}">
                    		<button  type="submit" class="btn btn-outline-success">Add</button>
                		</form>
						</td>

						<td><img src="${recipe.image}" width=60%></td>
						<td>${recipe.label}</td>
						<td>
						<c:set var="ingredients" value="${fn:split(recipe.ingredientLines, '--') }"/>
						<c:forEach var="ingredient" items="${ingredients }">
						<p>${ingredient }</p>
						</c:forEach>
						</td>
						<td>${recipe.totalTime } minutes </td>
						<td>Yield: ${recipe.yield } servings </td>
					</tr>
					</c:forEach>
				</tbody>
		</table>
		<br><br><br>
		</form>
		</c:when>

		</c:choose>
	</main>
</body>
</html>
