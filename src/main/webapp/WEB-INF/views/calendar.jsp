<%@ page language="java" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Weekly Calendar</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css">

<link href="/style.css" rel="stylesheet">
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<br>
	Meal planning progress for this week...
	<div class="progress">
  	<div class="progress-bar progress-bar-striped bg-warning" role="progressbar" style="width:${progressTime }%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<c:if test="${ not empty message }">
		<div class="test" style="color: pink;">${ message }</div>
	</c:if>

	<table class="table table-hover">
	<thead>
	<tr>
	<th scope="col">
	<c:if test="${whichWeek eq 'future'}"> <a href="/calendar" class="btn btn-secondary" >Previous Week</a> </c:if>
	</th>
	<th scope="col"> </th>
	<th scope="col"> </th>
	<th scope="col"> </th>
	<th scope="col"> </th>
	<th scope="col"> </th>
	<th scope="col">
	<c:if test="${whichWeek eq 'current'}"> <a href="/next-week" class="btn btn-secondary">Next Week</a></c:if></th>
	</tr>
	</thead>
	<thead>
			<tr>
				<th scope="col">Sunday <br /> ${sunday}
				</th>
				<th scope="col">Monday<br /> ${monday}
				</th>
				<th scope="col">Tuesday<br /> ${tuesday}
				</th>
				<th scope="col">Wednesday<br /> ${wednesday}
				</th>
				<th scope="col">Thursday<br /> ${thursday}
				</th>
				<th scope="col">Friday<br /> ${friday}
				</th>
				<th scope="col">Saturday<br /> ${saturday}
				</th>

			</tr>
		</thead>

		<tbody>

			<tr class="table-primary">
				<td rowspan="3">
				<c:if test="${empty sundayMeal }">
				<form action="/display/${sunday }" method="post">
				<%@ include file="dropdown.jsp"%>
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label>
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form>
					<br />
					</c:if>

			<c:if test="${not empty sundayMeal }">
			<div class="container">
			<img src="${sundayMeal.image }" alt="${sundayMeal.label}" class="image" style="width:100%">
			<div class="middle">
			<div class="text"><a href="/deleteFavorite/${sunday}" >Delete Item</a></div>
			</div>
			</div>
			<p><a href="${sundayMeal.url }">${sundayMeal.label }</a></p>
			<p class="text-danger"><i>Prep time: <br><b>${sundayMeal.totalTime } minutes</b></i></p>
			</c:if>

					</td>


				<td rowspan="3">
				<c:if test="${empty mondayMeal }">
				<form action="/display/${monday }" method="post">
				<%@ include file="dropdown.jsp"%>
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label>
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-secondary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form>
					<br />
					</c:if>

			<c:if test="${not empty mondayMeal }">
			<div class="container">
			<img src="${mondayMeal.image }" alt="${mondayMeal.label}" class="image" style="width:100%;">
			<div class="middle">
			<div class="text"><a href="/deleteFavorite/${monday}" >Delete Item</a></div>
			</div>
			</div>
			<p><a href="${mondayMeal.url }">${mondayMeal.label }</a></p>
			<p class="text-danger"><i>Prep time: <br><b>${mondayMeal.totalTime } minutes</b></i></p>
			</c:if>
					</td>

				<td rowspan="3">
				<c:if test="${empty tuesdayMeal }">
				<form action="/display/${tuesday }" method="post">
				<%@ include file="dropdown.jsp"%>
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label>
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form>
						<br />
						</c:if>


			<c:if test="${not empty tuesdayMeal }">
			<div class="container">
			<img src="${tuesdayMeal.image }" alt="${tuesdayMeal.label}" class="image" style="width:100%; ">
			<div class="middle">
			<div class="text"><a href="/deleteFavorite/${tuesday}" >Delete Item</a></div>
			</div>
			</div>
			<p><a href="${tuesdayMeal.url }">${tuesdayMeal.label }</a></p>
			<p class="text-danger"><i>Prep time: <br><b>${tuesdayMeal.totalTime } minutes</b></i></p>
			</c:if>
					</td>

				<td rowspan="3">
				<c:if test="${empty wednesdayMeal }">
				<form action="/display/${wednesday }" method="post">
				<%@ include file="dropdown.jsp"%>
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label>
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-secondary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form>
						<br />
						</c:if>

			<c:if test="${not empty wednesdayMeal }">
			<div class="container">
			<img src="${wednesdayMeal.image }" alt="${wednesdayMeal.label}" class="image" style="width:100%; ">
			<div class="middle">
			<div class="text"><a href="/deleteFavorite/${wednesday}" >Delete Item</a></div>
			</div>
			</div>
			<p><a href="${wednesdayMeal.url }">${wednesdayMeal.label }</a></p>
			<p class="text-danger"><i>Prep time: <br><b>${wednesdayMeal.totalTime } minutes</b></i></p>
			</c:if>
					</td>

				<td rowspan="3">
				<c:if test="${empty thursdayMeal }">
				<form action="/display/${thursday }" method="post">
				<%@ include file="dropdown.jsp"%>
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label>
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form>
							<br />
							</c:if>

			<c:if test="${not empty thursdayMeal }">
			<div class="container">
			<img src="${thursdayMeal.image }" alt="${thursdayMeal.label}" class="image" style="width:100%; ">
			<div class="middle">
			<div class="text"><a href="/deleteFavorite/${thursday}" >Delete Item</a></div>
			</div>
			</div>
			<p><a href="${thursdayMeal.url }">${thursdayMeal.label }</a></p>
			<p class="text-danger"><i>Prep time: <br><b>${thursdayMeal.totalTime } minutes</b></i></p>
			</c:if>
					</td>

				<td rowspan="3">
				<c:if test="${empty fridayMeal }">
				<form action="/display/${friday }" method="post">
				<%@ include file="dropdown.jsp"%>
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label>
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-secondary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form>
							<br />
							</c:if>

			<c:if test="${not empty fridayMeal }">
			<div class="container">
			<img src="${fridayMeal.image }" alt="${fridayMeal.label}" class="image" style="width:100%; ">
			<div class="middle">
			<div class="text"><a href="/deleteFavorite/${friday}" >Delete Item</a></div>
			</div>
			</div>
			<p><a href="${fridayMeal.url }">${fridayMeal.label }</a></p>
			<p class="text-danger"><i>Prep time: <br><b>${fridayMeal.totalTime } minutes</b></i></p>
			</c:if>
					</td>

				<td rowspan="3">
				<c:if test="${empty saturdayMeal }">
				<form action="/display/${saturday }" method="post">
				<%@ include file="dropdown.jsp"%>
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label>
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form>
					<br />
					</c:if>

			<c:if test="${not empty saturdayMeal }">
			<div class="container">
			<img src="${saturdayMeal.image }" alt="${saturdayMeal.label}" class="image" style="width:100%; ">
			<div class="middle">
			<div class="text"><a href="/deleteFavorite/${saturday}" >Delete Item</a></div>
			</div>
			</div>
			<p><a href="${saturdayMeal.url }">${saturdayMeal.label }</a></p>
			<p class="text-danger"><i>Prep time: <br><b>${saturdayMeal.totalTime } minutes</b></i></p>
			</c:if>
					</td>

		</tbody>
	</table>

<a href="/shoppingcart" class="btn btn-secondary mb-3">What's on my shopping list?</a>
</body>
</html>
