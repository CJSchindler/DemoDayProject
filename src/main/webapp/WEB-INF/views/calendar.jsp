<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css">

<link href="/style.css" rel="stylesheet">
</head>
<body>
	<%@ include file="navbar.jsp"%>
	

	<c:if test="${not empty message }">
		<div class="test" style="color: pink;">${message }</div>
	</c:if>

	<table class="table table-hover">
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
					
			<c:if test="${not empty sundayMeal }">
			<div class="container">
			<img src="${sundayMeal.image }" alt="${sundayMeal.label}" class="image" style="width:100%; ">
			<div class="middle">
			<div class="text"><a href="/" >Edit Item</a></div>
			</div>
			</div>
			${sundayMeal.label }
			</c:if>
			
					</td>
				

				<td rowspan="3">
				<form action="/display/${monday }" method="post">
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
					
			<c:if test="${not empty mondayMeal }">
			<img src="${mondayMeal.image }">
			${mondayMeal.label }
			
			</c:if>
					</td>

				<td rowspan="3">
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
					
			<c:if test="${not empty tuesdayMeal }">
			<img src="${tuesdayMeal.image }">
			${tuesdayMeal.label }
			
			</c:if>
					</td>

				<td rowspan="3">
				<form action="/display/${wednesday }" method="post">
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
					
			<c:if test="${not empty wednesdayMeal }">
			<img src="${wednesdayMeal.image }">
			${wednesdayMeal.label }
			
			</c:if>
					</td>

				<td rowspan="3"><form action="/display/${thursday }" method="post">
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
					
			<c:if test="${not empty thursdayMeal }">
			<img src="${thursdayMeal.image }">
			${thursdayMeal.label }
			
			</c:if>
					</td>

				<td rowspan="3"><form action="/display/${friday }" method="post">
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
					
			<c:if test="${not empty fridayMeal }">
			<img src="${fridayMeal.image }">
			${fridayMeal.label }
			
			</c:if>
					</td>

				<td rowspan="3"><form action="/display/${saturday }" method="post">
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
					
			<c:if test="${not empty saturdayMeal }">
			<img src="${saturdayMeal.image }">
			${saturdayMeal.label }
			
			</c:if>
					</td>
			
		</tbody>
	</table>

<a href="/shoppingcart">What's in my cart?</a>

</body>
</html>