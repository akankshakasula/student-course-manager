<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Course Manager</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/" class="navbar-brand">
            &#127979; <span>StudentCourseManager</span>
        </a>
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/" class="active">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/students">Students</a></li>
            <li><a href="${pageContext.request.contextPath}/courses">Courses</a></li>
            <li><a href="${pageContext.request.contextPath}/courses/joined">Joined View</a></li>
        </ul>
    </nav>

    <div class="container fade-in">
        <div class="hero">
            <h1>Student Course Manager</h1>
            <p>A Spring Boot application to manage Students and Courses with Create, Read, and Update operations using JPA and JSP.</p>

            <div class="hero-cards">
                <a href="${pageContext.request.contextPath}/students" class="hero-card">
                    <div class="icon">&#127891;</div>
                    <h3>Manage Students</h3>
                    <p>View, add, and update student records in the database.</p>
                </a>

                <a href="${pageContext.request.contextPath}/courses" class="hero-card">
                    <div class="icon">&#128214;</div>
                    <h3>Manage Courses</h3>
                    <p>View, add, and update course records assigned to students.</p>
                </a>

                <a href="${pageContext.request.contextPath}/courses/joined" class="hero-card">
                    <div class="icon">&#128279;</div>
                    <h3>Joined View</h3>
                    <p>See courses with student details using an Inner Join query.</p>
                </a>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2026 Student Course Manager | Spring Boot + JPA + JSP</p>
    </div>
</body>
</html>
