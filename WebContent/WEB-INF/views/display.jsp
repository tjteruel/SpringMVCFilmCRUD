<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
</head>
<body>
	<h1>${film.title}</h1>
	<h3>Rating: ${film.rating}  |  Released: ${film.releaseYear}</h3>
	
	<p>${film.description}</p>
	<h3>Cast</h3>
	<ul>
	<c:forEach items="${film.actors}" var="actor">
	<li>${ actor.firstName} ${ actor.lastName}</li>
	</c:forEach>
	</ul>
	<h3>Click on button below to delete</h3>
	<form action="filmDelete.do" method="post" modelAttribute="film">
		<input type="submit" value="${film.id}" name="Delete" />
	</form>
	
	
</body>
</html>