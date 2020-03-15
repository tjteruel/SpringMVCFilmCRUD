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

	<form:form action="updateFilm.do" method="post" modelAttribute="film">
		<form:label path="title"> Film title </form:label> 
		<form:input type="text" name="Film title" path="filmId" placeholder="${film.title}"/> 
		<br>
		<form:label path="filmId"> Film description </form:label> 
		<form:input type="text" name="Film title" path="filmId" placeholder="${film.description}"/> 
		<br>
		<form:label path="filmId"> Release Year </form:label> 
		<form:input type="text" name="Film title" path="filmId" placeholder="${film.releaseYear}"/> 
		<br>
		<form:label path="filmId"> Language Id </form:label> 
		<form:input type="text" name="Film title" path="filmId" placeholder="${film.languageId}"/> 
		<br>
		<form:label path="filmId"> Rental Duration </form:label> 
		<form:input type="text" name="Film title" path="filmId" placeholder="${film.rentalDuration}"/> 
		<br>
		<form:label path="filmId"> Rental Rate </form:label> 
		<form:input type="text" name="Film title" path="filmId" placeholder="${film.rentalRate}"/> 
		<br>
		<form:label path="filmId"> Replacement Cost </form:label> 
		<form:input type="text" name="Film title" path="filmId" placeholder="${film.replacementCost}"/> 
		<br>
		<form:label path="filmId"> Rating </form:label> 
		<form:input type="text" name="Film title" path="filmId" placeholder="${film.rating}"/> 
		<br>
		<form:label path="filmId"> Special Features </form:label> 
		<form:input type="text" name="Film title" path="filmId" placeholder="${film.specialFeatures}"/> 
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