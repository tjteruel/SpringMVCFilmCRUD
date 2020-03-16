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
	<h1>Update ${film.title}</h1>

	<form:form action="updateFilm.do" method="POST" >
		<label > Film title </label> 
		<input type="text" name="title"  value="${film.title}"/> 
		<br>
		<label > Film description </label> 
		<input type="text" name="description"  value="${film.description}"/> 
		<br>
		<label > Release Year </label> 
		<input type="text" name="releaseYear"  value="${film.releaseYear}"/> 
		<br>
		<label > Language Id </label> 
		<input type="text" name="languageId"  value="${film.languageId}"/> 
		<br>
		<label > Rental Duration </label> 
		<input type="text" name="rentalDuration"  value="${film.rentalDuration}"/> 
		<br>
		<label > Rental Rate </label> 
		<input type="text" name="rentalRate"  value="${film.rentalRate}"/> 
		<br>
		<label > Replacement Cost </label> 
		<input type="text" name="replacementCost"  value="${film.replacementCost}"/> 
		<br>
		<label > Rating </label> 
		<input type="text" name="rating" value="${film.rating}"/> 
		<br>
		<label > Special Features </label> 
		<input type="text" name="specialFeatures"  value="${film.specialFeatures}"/> 
		<input type="hidden" name="languageId"  value="${film.languageId}"/> 
		<input type="hidden" name="id"  value="${film.id}"/> 
		<br>
		<input type="submit" value="Update Film" />
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