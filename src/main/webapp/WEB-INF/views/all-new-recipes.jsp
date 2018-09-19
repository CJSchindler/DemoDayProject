<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Your New Recipes</title>
</head>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css"
	rel="stylesheet">
<body>
	<%@ include file="navbar.jsp"%>

<main class="container">
	<table class="table">
            <thead>
                <tr>
                  <th>Name</th><th>Time</th> <th>Yield</th><th>Ingredients</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach var="meals" items="${myMeals}">

                <tr>

                    <td>${meals.label}</td> <td> ${meals.totalTime}</td> <td> ${meals.yield}</td> 
                    <td><c:set var="ingredients" value="${fn:split(meals.ingredientLines, '--') }"/>
						<c:forEach var="ingredient" items="${ingredients }">
						<p>${ingredient }</p>
						</c:forEach>
                   </td>
                    <td>
						<a href="/delete?id=${meals.id }" class="btn btn-seconary" onclick= "return confirm('are you sure?')">Delete</a></td>

                    <td>${meals.label}</td> <td> ${meals.totalTime}</td>
										<td><a href="/all-new-recipes/${meals.id}/delete" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>

                </tr>

                </c:forEach>
            </tbody>
        </table>



</main>
</body>
</html>
