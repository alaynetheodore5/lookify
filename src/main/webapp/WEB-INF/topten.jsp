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
	<div class="container">
		<div class="jumbotron text-center bg-dark">
			<h1>Lookify</h1>		
		</div>
		
		<div class="row">
            <div class="col-sm-8">

                <table class="table table-striped">
                    <tbody>
                        <tr>
                            <th>Song Title</th>
                            <th>Artist</th>
                            <th>Rating</th>
                            <th>Actions</th>
                        </tr>
                        <c:forEach items="${topTen}" var="t">
                            <tr>
                                <td><a href="/songs/${s.id}/show">${t.title}</a></td>
                                <td>${t.artist}</td>
                                <td>${t.rating}</td>
                                <td>
                                    <a class="btn btn-info btn-sm" href="/songs/${t.id}">Edit</a>
                                    <a class="btn btn-danger btn-sm" href="/songs/${t.id}/remove">Remove</a>
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