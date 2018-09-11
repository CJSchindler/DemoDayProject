

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
				<!-- Sunday -->
				<td><form action="/hotels" method="post">
						<div class="input-group">
							<select name="city" class="custom-select" id="inputGroupSelect04">
								<option selected>Choose...</option>
								<option value="5">5 minutes</option>
								<option value="10">10 minutes</option>
								<option value="15">15 minutes</option>
								<option value="20">20 minutes</option>
								<option value="25">25 minutes</option>
								<option value="30">30 minutes</option>
								<option value="35">35 minutes</option>
								<option value="40">40 minutes</option>
								<option value="leftovers">I'm having Left-overs</option>
								<option value="out">I'm eating out</option>
							</select>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit"></button>
							</div>
						</div>
					</form></td>
				<!-- Monday -->
				<td><form action="/hotels" method="post">
						<div class="input-group">
							<select name="city" class="custom-select" id="inputGroupSelect04">
								<option selected>Choose...</option>
								<option value="5">5 minutes</option>
								<option value="10">10 minutes</option>
								<option value="15">15 minutes</option>
								<option value="20">20 minutes</option>
								<option value="25">25 minutes</option>
								<option value="30">30 minutes</option>
								<option value="35">35 minutes</option>
								<option value="40">40 minutes</option>
								<option value="leftovers">I'm having Left-overs</option>
								<option value="out">I'm eating out</option>
							</select>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit"></button>
							</div>
						</div>
					</form></td>
				<!-- Tuesday -->
				<td><form action="/hotels" method="post">
						<div class="input-group">
							<select name="city" class="custom-select" id="inputGroupSelect04">
								<option selected>Choose...</option>
								<option value="5">5 minutes</option>
								<option value="10">10 minutes</option>
								<option value="15">15 minutes</option>
								<option value="20">20 minutes</option>
								<option value="25">25 minutes</option>
								<option value="30">30 minutes</option>
								<option value="35">35 minutes</option>
								<option value="40">40 minutes</option>
								<option value="leftovers">I'm having Left-overs</option>
								<option value="out">I'm eating out</option>
							</select>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit"></button>
							</div>
						</div>
					</form></td>
				<!-- Wednesday -->
				<td><form action="/hotels" method="post">
						<div class="input-group">
							<select name="city" class="custom-select" id="inputGroupSelect04">
								<option selected>Choose...</option>
								<option value="5">5 minutes</option>
								<option value="10">10 minutes</option>
								<option value="15">15 minutes</option>
								<option value="20">20 minutes</option>
								<option value="25">25 minutes</option>
								<option value="30">30 minutes</option>
								<option value="35">35 minutes</option>
								<option value="40">40 minutes</option>
								<option value="leftovers">I'm having Left-overs</option>
								<option value="out">I'm eating out</option>
							</select>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit"></button>
							</div>
						</div>
					</form></td>
				<!-- Thursday -->
				<td><form action="/hotels" method="post">
						<div class="input-group">
							<select name="city" class="custom-select" id="inputGroupSelect04">
								<option selected>Choose...</option>
								<option value="5">5 minutes</option>
								<option value="10">10 minutes</option>
								<option value="15">15 minutes</option>
								<option value="20">20 minutes</option>
								<option value="25">25 minutes</option>
								<option value="30">30 minutes</option>
								<option value="35">35 minutes</option>
								<option value="40">40 minutes</option>
								<option value="leftovers">I'm having Left-overs</option>
								<option value="out">I'm eating out</option>
							</select>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit"></button>
							</div>
						</div>
					</form></td>
				<!-- Friday -->
				<td><form action="/hotels" method="post">
						<div class="input-group">
							<select name="city" class="custom-select" id="inputGroupSelect04">
								<option selected>Choose...</option>
								<option value="5">5 minutes</option>
								<option value="10">10 minutes</option>
								<option value="15">15 minutes</option>
								<option value="20">20 minutes</option>
								<option value="25">25 minutes</option>
								<option value="30">30 minutes</option>
								<option value="35">35 minutes</option>
								<option value="40">40 minutes</option>
								<option value="leftovers">I'm having Left-overs</option>
								<option value="out">I'm eating out</option>
							</select>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit"></button>
							</div>
						</div>
					</form></td>
				<!-- Saturday -->
				<td><form action="/hotels" method="post">
						<div class="input-group">
							<select name="city" class="custom-select" id="inputGroupSelect04">
								<option selected>Choose...</option>
								<option value="5">5 minutes</option>
								<option value="10">10 minutes</option>
								<option value="15">15 minutes</option>
								<option value="20">20 minutes</option>
								<option value="25">25 minutes</option>
								<option value="30">30 minutes</option>
								<option value="35">35 minutes</option>
								<option value="40">40 minutes</option>
								<option value="leftovers">I'm having Left-overs</option>
								<option value="out">I'm eating out</option>
							</select>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit"></button>
							</div>
						</div>
					</form></td>
			</tr>

			<tr class="table-primary">
				<td rowspan="3"><form action="/display" method="post">
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label> 
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form></td>

				<td rowspan="3"><form action="/display" method="post">
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label> 
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form></td>

				<td rowspan="3"><form action="/display" method="post">
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label> 
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form></td>

				<td rowspan="3"><form action="/display" method="post">
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label> 
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form></td>

				<td rowspan="3"><form action="/display" method="post">
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label> 
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form></td>

				<td rowspan="3"><form action="/display" method="post">
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label> 
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form></td>

				<td rowspan="3"><form action="/display" method="post">
						<label><input type="radio" name="searchType"
							value="favorites"> Search Favorites</label> 
							<label><input
							type="radio" name="searchType" value="new">Search new
						recipes</label>
						<button type="submit" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form></td>
			</tr>
		</tbody>
	</table>



</body>
</html>