<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css">
<title>Add Your Recipe!</title>
</head>


<body>
<%@ include file="navbar.jsp"%>
<div class ="container">


	<form action="/myrecipe" method= "post">
	<h1>Please fill in these items!</h1>

  <div class="form-group">
    <label class="col-form-label">Name of Recipe</label>
    <input type="text" style="width: 400px" name="label" class="form-control" required>
  </div>

  <div class="form-group">
    <label class="col-form-label">Yield (number of servings): </label>
    <input type="number" style="width: 400px" name="yield" class="form-control" required>
  </div>

  <div class="form-group">
    <label class="col-form-label">Time (in minutes): </label>
    <input type="number" style="width: 200px" name="totalTime" class="form-control" required>
  </div>

	<%-- <div class="row"><label>
		Name of Recipe: <input type="text" name="label" required />
	</label></div> --%>
	<%-- <div class="row"><label>
		Yield (number of servings):
    <input type="number" name="yield" required />
	</label></div> --%>

  <%-- <div class="row"><label>
		Time (in minutes): <input type="number" name="totalTime" required />
	</label></div> --%>

	<div class="row">
		<input type="hidden" name="count" value="1" />
        <div class="control-group" id="fields">
            <label class="control-label" for="field1">Ingredients (include quantity, measure, and type)</label>
            <div class="controls" id="profs">
                <div class="input-append">
                    <div id="field"><input autocomplete="off" class="input" id="field1" name="ingredientLines" type="text" placeholder="Add ingredient" data-items="8"/>
                    <button id="b1" class="btn add-more" type="button">+</button></div>
                </div>
            <br>
            <small>Press + to add another ingredient:)</small>
            </div>
        </div>
	</div>
  <button type="submit" class="btn btn-primary">Add My Recipe</button>

		</form>


		</div>


		<script>
		$(document).ready(function(){
		    var next = 1;
		    $(".add-more").click(function(e){
		        e.preventDefault();
		        var addto = "#field" + next;
		        var addRemove = "#field" + (next);
		        next = next + 1;
		        var newIn = '<input autocomplete="off" class="input form-control" id="field' + next + '" name="ingredientLines" type="text">';
		        var newInput = $(newIn);
		        var removeBtn = '<button id="remove' + (next - 1) + '" class="btn btn-danger remove-me" >-</button></div><div id="field">';
		        var removeButton = $(removeBtn);
		        $(addto).after(newInput);
		        $(addRemove).after(removeButton);
		        $("#field" + next).attr('data-source',$(addto).attr('data-source'));
		        $("#count").val(next);

		            $('.remove-me').click(function(e){
		                e.preventDefault();
		                var fieldNum = this.id.charAt(this.id.length-1);
		                var fieldID = "#field" + fieldNum;
		                $(this).remove();
		                $(fieldID).remove();
		            });
		    });



		});
		</script>

		<!--

			  <div id="room_fileds">
		<div class='label'>Ingredients: <input type="text" name="ingredientLines" required><br><br></div>
		<div class="content" id="ingredient">
		</div>
		<input type="button" id="more_fields" onclick="add_fields();"
		value="Add More Ingredients" /><br> <br>

	</div>

<script>
 function add_fields() {
    document.getElementById('ingredient').innerHTML +=
    	'<span>Ingredient <input type="text" name="ingredientLines"></span>\r\n<br><br>';
}


</script>

-->


</body>
</html>
