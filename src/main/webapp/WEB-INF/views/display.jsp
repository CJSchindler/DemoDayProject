<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="recipe" items="${ recipelist }">
		<div>
			<h5>${recipe.recipe.label}</h5>
			<h5><img src="${recipe.recipe.image}"></h5>
			<h5><a href="${recipe.recipe.url}">Go to Recipe </a></h5>
			<h5>Serving size: ${recipe.recipe.yield}</h5>
			Recipe: <c:forEach var="ingredient" items="${recipe.recipe.ingredientLines}"> 
			<h5>${ingredient} </h5>
			</c:forEach>
			<h5>Total Time: ${recipe.recipe.totalTime}</h5>
			
		</div>
	</c:forEach>

</body>
</html>