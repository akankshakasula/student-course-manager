<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${isEdit ? 'Edit' : 'Add'} Course - Student Course Manager</title>
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
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-error">
                &#10060; ${errorMessage}
            </div>
        </c:if>

        <div class="page-header">
            <h1>${isEdit ? '&#9998; Edit Course' : '&#10133; Add New Course'}</h1>
        </div>

        <div class="form-container">
            <div class="card">
                <div class="card-body">
                    <c:set var="formAction" value="${isEdit ?
                        pageContext.request.contextPath.concat('/courses/update/').concat(course.id) :
                        pageContext.request.contextPath.concat('/courses/add')}" />

                    <form:form action="${formAction}" method="post" modelAttribute="course">
                        <div class="form-group">
                            <label for="courseName">Course Name</label>
                            <form:input path="courseName" id="courseName" cssClass="form-control"
                                        placeholder="Enter course name" />
                            <form:errors path="courseName" cssClass="alert alert-error" />
                        </div>
                        <div class="form-group">
                            <label for="courseCode">Course Code</label>
                            <form:input path="courseCode" id="courseCode" cssClass="form-control"
                                        placeholder="Enter Course Code (e.g., CS101)" />
                            <form:errors path="courseCode" cssClass="alert alert-error" />
                        </div>
                        <div class="form-group">
                            <label for="department">Department</label>
                            <form:input path="department" id="department" cssClass="form-control"
                                        placeholder="Enter department" />
                            <form:errors path="department" cssClass="alert alert-error" />
                        </div>
                        <div class="form-group">
                            <label for="credits">Credits</label>
                            <form:input path="credits" id="credits" cssClass="form-control"
                                        placeholder="Enter credits" type="number" />
                            <form:errors path="credits" cssClass="alert alert-error" />
                        </div>
                        <div class="form-group">
                            <label for="studentId">Assign to Student</label>
                            <select name="studentId" id="studentId" class="form-control">
                                <option value="">-- Select a Student --</option>
                                <c:forEach var="s" items="${students}">
                                    <option value="${s.id}"
                                        ${course.student != null && course.student.id == s.id ? 'selected' : ''}>
                                        ${s.name} (${s.department})
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-actions">
                            <c:choose>
                                <c:when test="${isEdit}">
                                    <button type="submit" class="btn btn-success">&#10003; Update Course</button>
                                </c:when>
                                <c:otherwise>
                                    <button type="submit" class="btn btn-primary">+ Add Course</button>
                                </c:otherwise>
                            </c:choose>
                            <a href="${pageContext.request.contextPath}/courses" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2026 Student Course Manager | Spring Boot + JPA + JSP</p>
    </div>
</body>
</html>
