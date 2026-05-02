<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${isEdit ? 'Edit' : 'Add'} Student - Student Course Manager</title>
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
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-error">
                &#10060; ${errorMessage}
            </div>
        </c:if>

        <div class="page-header">
            <h1>${isEdit ? '&#9998; Edit Student' : '&#10133; Add New Student'}</h1>
        </div>

        <div class="form-container">
            <div class="card">
                <div class="card-body">
                    <c:choose>
                        <c:when test="${isEdit}">
                            <form:form action="${pageContext.request.contextPath}/students/update/${student.id}"
                                       method="post" modelAttribute="student">
                                <div class="form-group">
                                    <label for="name">Full Name</label>
                                    <form:input path="name" id="name" cssClass="form-control"
                                                placeholder="Enter student name" />
                                    <form:errors path="name" cssClass="alert alert-error" />
                                </div>
                                <div class="form-group">
                                    <label for="email">Email Address</label>
                                    <form:input path="email" id="email" cssClass="form-control"
                                                placeholder="Enter email address" type="email" />
                                    <form:errors path="email" cssClass="alert alert-error" />
                                </div>
                                <div class="form-group">
                                    <label for="department">Department</label>
                                    <form:input path="department" id="department" cssClass="form-control"
                                                placeholder="Enter department" />
                                    <form:errors path="department" cssClass="alert alert-error" />
                                </div>
                                <div class="form-group">
                                    <label for="year">Year</label>
                                    <form:input path="year" id="year" cssClass="form-control"
                                                placeholder="Enter year (1-4)" type="number" />
                                    <form:errors path="year" cssClass="alert alert-error" />
                                </div>
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-success">&#10003; Update Student</button>
                                    <a href="${pageContext.request.contextPath}/students" class="btn btn-secondary">Cancel</a>
                                </div>
                            </form:form>
                        </c:when>
                        <c:otherwise>
                            <form:form action="${pageContext.request.contextPath}/students/add"
                                       method="post" modelAttribute="student">
                                <div class="form-group">
                                    <label for="name">Full Name</label>
                                    <form:input path="name" id="name" cssClass="form-control"
                                                placeholder="Enter student name" />
                                    <form:errors path="name" cssClass="alert alert-error" />
                                </div>
                                <div class="form-group">
                                    <label for="email">Email Address</label>
                                    <form:input path="email" id="email" cssClass="form-control"
                                                placeholder="Enter email address" type="email" />
                                    <form:errors path="email" cssClass="alert alert-error" />
                                </div>
                                <div class="form-group">
                                    <label for="department">Department</label>
                                    <form:input path="department" id="department" cssClass="form-control"
                                                placeholder="Enter department" />
                                    <form:errors path="department" cssClass="alert alert-error" />
                                </div>
                                <div class="form-group">
                                    <label for="year">Year</label>
                                    <form:input path="year" id="year" cssClass="form-control"
                                                placeholder="Enter year (1-4)" type="number" />
                                    <form:errors path="year" cssClass="alert alert-error" />
                                </div>
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-primary">+ Add Student</button>
                                    <a href="${pageContext.request.contextPath}/students" class="btn btn-secondary">Cancel</a>
                                </div>
                            </form:form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2026 Student Course Manager | Spring Boot + JPA + JSP</p>
    </div>
</body>
</html>
