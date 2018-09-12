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
	<h1>SHOPPING CART!</h1>

	<!-- DISPLAY SHOPPING LIST HEAR -->
	<c:if test="${not empty sundayMeal }">
	
			${sundayMeal.ingredientLines }
			
		<c:forEach var="ingredient" items="${recipe.recipe.ingredientLines}">
		
			<p>${ingredient}</p>
			
		</c:forEach>
		
	</c:if>
</body>
</html>