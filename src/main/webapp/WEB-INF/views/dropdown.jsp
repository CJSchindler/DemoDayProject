<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Dropdown to add for time selection, will add to each day...but may change layout of days -->
<form action="/hotels" method="post">
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

</form>

</body>
</html>