
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Song</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
    
        <h1>Edit ${song.title}</h1>
    
        <form:form action="/songs/${song.id}" method="post" modelAttribute="song">
            <input type="hidden" name="_method" value="put">
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
                <form:input type="number" path="rating" class="form-control" />
                <form:errors path="rating" class="text-danger" />
            </div>
            <input type="submit" value="Update Song" class="btn btn-primary" />
         </form:form>
    </div>           
</body>
</html>