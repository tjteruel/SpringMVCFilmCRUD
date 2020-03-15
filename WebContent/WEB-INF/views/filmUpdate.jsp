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

	<form action="updateFilm.do" method="post" modelAttribute="film">
		<label path="title"> Film title </label> 
		<input type="text" name="Film title" path="filmId" placeholder="${film.title}"/> 
		<br>
		<label path="filmId"> Film description </label> 
		<input type="text" name="Film title" path="filmId" placeholder="${film.description}"/> 
		<br>
		<label path="filmId"> Release Year </label> 
		<input type="text" name="Film title" path="filmId" placeholder="${film.releaseYear}"/> 
		<br>
		<label path="filmId"> Language Id </label> 
		<input type="text" name="Film title" path="filmId" placeholder="${film.languageId}"/> 
		<br>
		<label path="filmId"> Rental Duration </label> 
		<input type="text" name="Film title" path="filmId" placeholder="${film.rentalDuration}"/> 
		<br>
		<label path="filmId"> Rental Rate </label> 
		<input type="text" name="Film title" path="filmId" placeholder="${film.rentalRate}"/> 
		<br>
		<label path="filmId"> Replacement Cost </label> 
		<input type="text" name="Film title" path="filmId" placeholder="${film.replacementCost}"/> 
		<br>
		<label path="filmId"> Rating </label> 
		<input type="text" name="Film title" path="filmId" placeholder="${film.rating}"/> 
		<br>
		<label path="filmId"> Special Features </label> 
		<input type="text" name="Film title" path="filmId" placeholder="${film.specialFeatures}"/> 
		<br>
		<input type="submit" value="Update Film" name="Delete" placeholder="${film.title}"/>
	</form>

	<h3>Find another film</h3>
	<br>
	<br>
		<h3>Add a new film</h3>
	<form:form action="addForm.do" method="get" modelAttribute="film">
		<input type="submit" value="Add new Film" />
	</form:form>
	
	
</body>
</html>