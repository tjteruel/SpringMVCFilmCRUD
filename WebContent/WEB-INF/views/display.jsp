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
	<h3>Rating: ${film.rating} | Released: ${film.releaseYear}</h3>

	<p>${film.description}</p>

	<c:choose>
		<c:when test="${film.actors != null }">
			<h3>Cast</h3>
			<ul>
				<c:forEach items="${film.actors}" var="actor">
					<li>${ actor.firstName}${ actor.lastName}</li>
				</c:forEach>
			</ul>
		</c:when>
	</c:choose>

	<form:form action="updateForm.do" method="GET" modelAttribute="film">
		<input type="hidden" value="${film.id}" name="film" />
		<input type="submit" value="Update Film" name="film" />
	</form:form>
	<h3>Click on button below to delete</h3>
	<form:form action="filmDelete.do" method="POST" modelAttribute="film">
		<input type="hidden" value="${film.id}" name="Delete" />
		<input type="submit" value="Delete Film" name="Delete" />
	</form:form>
	<h3>Find another film</h3>
	<form action="display.do" method="GET">
		<label > Film ID </label> 
		<input type="text"name="filmId" /> 
		<input type="submit" value="display" />
	</form>
	<br>
	<h3>Find a film by keyword</h3>
	<form action="keywordSearch.do" method="GET">
		<label> Keyword </label> <input type="text" name="keyword" /> <input
			type="submit" value="display" />
	</form>
	<br>
	<h3>Add a new film</h3>
	<form:form action="addForm.do" method="GET">
		<input type="submit" value="Add new Film" />
	</form:form>


</body>
</html>