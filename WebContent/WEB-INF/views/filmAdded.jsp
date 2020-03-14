<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
</head>
<body>
	<h1>${film.title}</h1>
	<h3>Rating: ${film.rating}| Released: ${film.releaseYear}</h3>
	
	<p>${film.description}</p>
	<p>${film.id}</p>
</body>
</html>