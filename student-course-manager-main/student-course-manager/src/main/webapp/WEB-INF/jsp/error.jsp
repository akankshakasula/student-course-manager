<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Student Course Manager</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/" class="navbar-brand">
            &#127979; <span>StudentCourseManager</span>
        </a>
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/students">Students</a></li>
            <li><a href="${pageContext.request.contextPath}/courses">Courses</a></li>
            <li><a href="${pageContext.request.contextPath}/courses/joined">Joined View</a></li>
        </ul>
    </nav>

    <div class="container fade-in">
        <div class="hero" style="padding: 3rem;">
            <h1 style="color: var(--danger); font-size: 2rem;">&#9888; An Error Occurred</h1>
            <p>Something went wrong while processing your request.</p>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-error" style="max-width: 600px; margin: 1rem auto;">
                    ${errorMessage}
                </div>
            </c:if>
            <a href="${pageContext.request.contextPath}/" class="btn btn-primary">&#8592; Back to Home</a>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2026 Student Course Manager | Spring Boot + JPA + JSP</p>
    </div>
</body>
</html>
