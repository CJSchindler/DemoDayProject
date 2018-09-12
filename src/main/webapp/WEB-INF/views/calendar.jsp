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
			<div class="container">
			<img src="${mondayMeal.image }" alt="${mondayMeal.label}" class="image" style="width:100%;">
			<div class="middle">
			<div class="text"><a href="/" >Edit Item</a></div>
			</div>
			</div>
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
					
				<br />
					
			<c:if test="${not empty tuesdayMeal }">
			<div class="container">
			<img src="${tuesdayMeal.image }" alt="${tuesdayMeal.label}" class="image" style="width:100%; ">
			<div class="middle">
			<div class="text"><a href="/" >Edit Item</a></div>
			</div>
			</div>
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
			<div class="container">
			<img src="${wednesdayMeal.image }" alt="${wednesdayMeal.label}" class="image" style="width:100%; ">
			<div class="middle">
			<div class="text"><a href="/" >Edit Item</a></div>
			</div>
			</div>
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
			<div class="container">
			<img src="${thursdayMeal.image }" alt="${thursdayMeal.label}" class="image" style="width:100%; ">
			<div class="middle">
			<div class="text"><a href="/" >Edit Item</a></div>
			</div>
			</div>
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
			<div class="container">
			<img src="${fridayMeal.image }" alt="${fridayMeal.label}" class="image" style="width:100%; ">
			<div class="middle">
			<div class="text"><a href="/" >Edit Item</a></div>
			</div>
			</div>
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
			<div class="container">
			<img src="${saturdayMeal.image }" alt="${saturdayMeal.label}" class="image" style="width:100%; ">
			<div class="middle">
			<div class="text"><a href="/" >Edit Item</a></div>
			</div>
			</div>
			${saturdayMeal.label }
			</c:if>
					</td>
			
		</tbody>
	</table>

<a href="/shoppingcart">What's in my cart?</a>

</body>
</html>