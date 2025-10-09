<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Application URLs -->
<c:set var="urlInicio">
    <c:url value="${application.contextPath}/"/>
</c:set>

<c:set var="urlAdd">
    <c:url value="${application.contextPath}/add"/>
</c:set>

<c:set var="urlEdit">
    <c:url value="${application.contextPath}/edit"/>
</c:set>

<c:set var="urlDelete">
    <c:url value="${application.contextPath}/delete"/>
</c:set>

<c:set var="urlComplete">
    <c:url value="${application.contextPath}/complete"/>
</c:set>

<c:set var="urlCalendar">
    <c:url value="${application.contextPath}/calendar"/>
</c:set>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>To Do List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>