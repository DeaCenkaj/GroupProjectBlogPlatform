<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Post</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/viewPost.css">
    <style>
        /* Use the background photo */

    </style>
</head>
<body>

<%--
<div class="view">
    <div class="mask rgba-gradient align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-center mb-4">View Post</h1>
                    <div class="post-content">
                        <div class="container">
                            <div class="film-details">
                                <h1 class="text-dark"><a href="/dashboard">Dashboard</a></h1>

                                <div class="post-details">
                                    <h2 class="text-dark">Post Details</h2>
                                    <table class="table">
                                        <tbody class="text-dark">
                                        <tr>
                                            <td>Title:</td>
                                            <td><c:out value="${post.title}"></c:out></td>
                                        </tr>
                                        <tr>
                                            <td>Body:</td>
                                            <td><c:out value="${post.body}"></c:out></td>
                                        </tr>
                                        <tr>
                                            <td>Type:</td>
                                            <td><c:out value="${post.type}"></c:out></td>
                                        </tr>

                                        </tbody>
                                    </table>
                                    <h5><a href="/post/${post.id}/comments">See Comments</a></h5>
                                    <c:if test="${post.lead.id eq user}">
                                        <div class="btn-group">
                                            <a class="btn-primary" href="/post/edit/${post.id}">Edit Post</a>
                                            <a class="btn-secondary" href="/post/delete/${post.id}">Delete Post</a>
                                        </div>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
--%>
<section style="background-color: #eee;">
    <div class="container my-5 py-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-8">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-start align-items-center">
                            <img class="rounded-circle shadow-1-strong me-3"
                                 src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="avatar" width="60"
                                 height="60" />
                            <div>
                                <h6 class="fw-bold text-primary mb-1"><c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></h6>
                                <p class="text-muted small mb-0">
                                    <c:out value="${post.type}"/> - <fmt:formatDate value="${post.createdAt}" pattern="HH:mm"/>
                                </p>
                            </div>
                        </div>

                        <p class="mt-3 mb-4 pb-2">
                            <c:out value="${post.body}"/>
                        </p>
                    </div>
                    <div class="card-footer py-3 border-0" style="background-color: #f8f9fa;">
                        <div class="d-flex flex-start w-100">
                            <img class="rounded-circle shadow-1-strong me-3"
                                 src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="avatar" width="40"
                                 height="40" />
                            <form:form action="/post/${post.id}/comments" method="post" modelAttribute="comment">
                                <div class="form-group">
                                    <label for="comment" class="float-left text-light">Add a comment for this movie:</label>
                                    <form:textarea rows="4" class="form-control" path="name" id="comment"></form:textarea>
                                    <form:errors path="name" cssClass="text-danger"/>
                                </div>
                                <button type="submit" class="btn btn-primary">Post Comment</button>
                            </form:form>
                        </div>

                        <div class="float-end mt-2 pt-1">

                            <c:forEach var="comment" items="${comments}">
                                <div class="card mt-2">
                                    <div class="card-body">
                                        <h4 >Added by <c:out value="${comment.creator.firstName}"></c:out> at <fmt:formatDate value="${comment.createdAt}" pattern="h:mm a MMMM dd"/></h4>
                                        <p ><c:out value="${comment.name}"></c:out></p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
