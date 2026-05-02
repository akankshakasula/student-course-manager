<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses - Student Course Manager</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/" class="navbar-brand">
            &#127979; <span>StudentCourseManager</span>
        </a>
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/students">Students</a></li>
            <li><a href="${pageContext.request.contextPath}/courses" class="active">Courses</a></li>
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
            <h1>&#128214; All Courses</h1>
            <a href="${pageContext.request.contextPath}/courses/add" class="btn btn-primary">+ Add Course</a>
        </div>

        <c:choose>
            <c:when test="${not empty courses}">
                <div class="card">
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Course Name</th>
                                    <th>Course Code</th>
                                    <th>Department</th>
                                    <th>Credits</th>
                                    <th>Student</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="course" items="${courses}">
                                    <tr>
                                        <td><span class="badge badge-primary">${course.id}</span></td>
                                        <td style="color: var(--text-primary); font-weight: 500;">${course.courseName}</td>
                                        <td><code style="background: var(--bg-input); padding: 0.2rem 0.5rem; border-radius: 4px; font-size: 0.8rem;">${course.courseCode}</code></td>
                                        <td><span class="badge badge-secondary">${course.department}</span></td>
                                        <td>${course.credits}</td>
                                        <td>${course.student.name}</td>
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
                        <p>No courses found.</p>
                        <a href="${pageContext.request.contextPath}/courses/add" class="btn btn-primary">Add your first course</a>
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
