<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/style.css" />
<title>Lookify</title>
</head>
<body>
	<div class="container bg-dark text-light">
		<div class="jumbotron text-center bg-dark">
			<h1>Lookify</h1>	
			<a href="/topten">Top Ten</a>	
		</div>
		
		<div class="row">
            <div class="col-sm-4">
                <form:form action="/songs" method="post" modelAttribute="song">
                    <div class="form-group">
                        <label>Title:</label>
                        <form:input path="title" class="form-control" />
                        <form:errors path="title" class="text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Artist:</label>
                        <form:input path="artist" class="form-control" />
                        <form:errors path="artist" class="text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Rating:</label>
                        <form:input type="number" step="0.5" path="rating" class="form-control" />
                        <form:errors path="rating" class="text-danger" />
                    </div>
                    <input type="submit" value="Add Song" class="btn btn-success" />
                </form:form>           
            </div>
            <div class="col-sm-8">  
                <form class="form-inline mb-3">
                    <input type="search" placeholder="Search" name="q" class="form-control" />
                    <input type="submit" value="Search" class="btn btn-outline-info" />
                </form>
                <table class="table table-striped">
                    <tbody>
                        <tr>
                            <th>Song Title</th>
                            <th>Artist</th>
                            <th>Rating</th>
                            <th>Actions</th>
                        </tr>
                        <c:forEach items="${all}" var="s">
                            <tr>
                                <td><a href="/songs/${s.id}/show">${s.title}</a></td>
                                <td>${s.artist}</td>
                                <td>${s.rating}</td>
                                <td>
                                    <a class="btn btn-info btn-sm" href="/songs/${s.id}">Edit</a>
                                    <a class="btn btn-danger btn-sm" href="/songs/${s.id}/remove">Remove</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>  
            </div>
        </div>
	</div>
</body>
</html>