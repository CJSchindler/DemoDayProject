<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css" rel="stylesheet">
    <link href="/style.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pricing</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<table class="table table-hover">
  <thead>
    <tr>
    <th scope="col">Sunday</th>
      <th scope="col">Monday</th>
      <th scope="col">Tuesday</th>
      <th scope="col">Wednesday</th>
      <th scope="col">Thursday</th>
      <th scope="col">Friday</th>
      <th scope="col">Saturday</th>
      
    </tr>
  </thead>
  <tbody>
    <tr class="table-primary">
      <th scope="row">Active</th>
      <td>Column content</td>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr class="table-primary">
      <th scope="row">Primary</th>
      <td>Column content</td>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    </tbody>
    </table>



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