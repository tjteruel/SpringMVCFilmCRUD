<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Film not found</title>
</head>
<body>
	<h1>There was a problem deleting your film</h1>
	<h3>What would you like to do?</h3>
	<h3>Find another film</h3>
	<form action="display.do" method="GET">
		<label path="filmId"> Film ID </label> <input type="text"
			name="filmId" path="filmId" /> <input type="submit" value="display" />
	</form>
	<br>
	<br>
		<h3>Add a new film</h3>
	<form:form action="addForm.do" method="get" modelAttribute="film">
		<input type="submit" value="Add new Film" />
	</form:form>
	


</body>