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

	<form:form action="updateFilm.do" method="POST" modelAttribute="film">
		<form:label path="title"> Film title </form:label> 
		<form:input type="text" name="title" path="title" placeholder="${film.title}"/> 
		<br>
		<form:label path="description"> Film description </form:label> 
		<form:input type="text" name="description" path="description" placeholder="${film.description}"/> 
		<br>
		<form:label path="releaseYear"> Release Year </form:label> 
		<form:input type="text" name="releaseYear" path="releaseYear" placeholder="${film.releaseYear}"/> 
		<br>
		<form:label path="languageId"> Language Id </form:label> 
		<form:input type="text" name="languageId" path="languageId" placeholder="${film.languageId}"/> 
		<br>
		<form:label path="rentalDuration"> Rental Duration </form:label> 
		<form:input type="text" name="rentalDuration" path="rentalDuration" placeholder="${film.rentalDuration}"/> 
		<br>
		<form:label path="rentalRate"> Rental Rate </form:label> 
		<form:input type="text" name="rentalRate" path="rentalRate" placeholder="${film.rentalRate}"/> 
		<br>
		<form:label path="replacementCost"> Replacement Cost </form:label> 
		<form:input type="text" name="replacementCost" path="replacementCost" placeholder="${film.replacementCost}"/> 
		<br>
		<form:label path="rating"> Rating </form:label> 
		<form:input type="text" name="rating" path="rating" placeholder="${film.rating}"/> 
		<br>
		<form:label path="specialFeatures"> Special Features </form:label> 
		<form:input type="text" name="specialFeatures" path="specialFeatures" placeholder="${film.specialFeatures}"/> 
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