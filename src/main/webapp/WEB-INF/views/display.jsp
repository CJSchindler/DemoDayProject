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
			
			
		</div>
	</c:forEach>

</body>
</html>