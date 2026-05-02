<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students - Student Course Manager</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/" class="navbar-brand">
            &#127979; <span>StudentCourseManager</span>
        </a>
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/students" class="active">Students</a></li>
            <li><a href="${pageContext.request.contextPath}/courses">Courses</a></li>
            <li><a href="${pageContext.request.contextPath}/courses/joined">Joined View</a></li>
        </ul>
    </nav>

    <div class="container fade-in">
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                &#9989; ${successMessage}
            </div>
        </c:if>

        <div class="page-header">
            <h1>&#127891; All Students</h1>
            <a href="${pageContext.request.contextPath}/students/add" class="btn btn-primary">+ Add Student</a>
        </div>

        <c:choose>
            <c:when test="${not empty students}">
                <div class="card">
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Department</th>
                                    <th>Year</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="student" items="${students}">
                                    <tr>
                                        <td><span class="badge badge-primary">${student.id}</span></td>
                                        <td style="color: var(--text-primary); font-weight: 500;">${student.name}</td>
                                        <td>${student.email}</td>
                                        <td><span class="badge badge-secondary">${student.department}</span></td>
                                        <td>${student.year}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/students/edit/${student.id}" class="btn btn-warning btn-sm">&#9998; Edit</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="card">
                    <div class="empty-state">
                        <p>No students found.</p>
                        <a href="${pageContext.request.contextPath}/students/add" class="btn btn-primary">Add your first student</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="footer">
        <p>&copy; 2026 Student Course Manager | Spring Boot + JPA + JSP</p>
    </div>
</body>
</html>
