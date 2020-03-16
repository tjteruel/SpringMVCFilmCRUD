<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Film Update</title>
</head>
<body>
	<h1>Update ${film}</h1>

	<form:form action="updateFilm.do" method="post" modelAttribute="film">
		<form:label path="title"> Film title </form:label> 
		<form:input type="text" path="title" placeholder="${title}"/> 
		<br>
		<form:label path="description"> Film description </form:label> 
		<form:input type="text" name="Film title" path="description" placeholder="${film.description}"/> 
		<br>
		<form:label path="releaseYear"> Release Year </form:label> 
		<form:input type="text" name="Film title" path="releaseYear" placeholder="${film.releaseYear}"/> 
		<br>
		<form:label path="languageId"> Language Id </form:label> 
		<form:input type="text" name="Film title" path="languageId" placeholder="${film.languageId}"/> 
		<br>
		<form:label path="rentalDuration"> Rental Duration </form:label> 
		<form:input type="text" name="Film title" path="rentalDuration" placeholder="${film.rentalDuration}"/> 
		<br>
		<form:label path="rentalRate"> Rental Rate </form:label> 
		<form:input type="text" name="Film title" path="rentalRate" placeholder="${film.rentalRate}"/> 
		<br>
		<form:label path="replacementCost"> Replacement Cost </form:label> 
		<form:input type="text" name="Film title" path="replacementCost" placeholder="${film.replacementCost}"/> 
		<br>
		<form:label path="rating"> Rating </form:label> 
		<form:input type="text" name="Film title" path="rating" placeholder="${film.rating}"/> 
		<br>
		<form:label path="specialFeatures"> Special Features </form:label> 
		<form:input type="text" name="Film title" path="specialFeatures" placeholder="${film.specialFeatures}"/> 
		<br>
		<input type="submit" value="Update Film" name="Update" />
	</form:form>

	<h3>Find another film</h3>
	<br>
	<br>
		<h3>Add a new film</h3>
	<form:form action="addForm.do" method="get" modelAttribute="film">
		<input type="submit" value="Add new Film" />
	</form:form>
	
	
</body>
</html>