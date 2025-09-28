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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>To Do List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>

<div class="container">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="${urlInicio}">To Do List</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="${urlInicio}">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${urlAdd}">New Task</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div class="container mt-5">

    <!-- Pending Tasks -->
    <h4>Pending Tasks</h4>
    <table class="table table-primary table-light text-center table-hover mt-4" style="table-layout: fixed; width: 100%;">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Title</th>
            <th scope="col">Description</th>
            <th scope="col">Due Date</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <!-- For each pending task in the list, a <tr> is created with its respective <td>, task vaiable is created
         and it recieves pendigTasks that comes fromthe controller-->
        <c:forEach var="task" items="${pendingTasks}">
            <tr class="text-center">
                <td>${task.id}</td>
                <td>${task.title}</td>
                <td>${task.description}</td>
                <td>${task.dueDate}</td>
                <td>
                    <c:set var="urlCompleteTask">
                        <c:url value="${urlComplete}">
                            <c:param name="id" value="${task.id}"/>
                        </c:url>
                    </c:set>
                    <a href="${urlCompleteTask}" class="btn btn-success btn-sm">Complete</a>

                    <c:set var="urlEditTask">
                        <c:url value="${urlEdit}">
                            <c:param name="id" value="${task.id}"/>
                        </c:url>
                    </c:set>
                    <a href="${urlEditTask}" class="btn btn-warning btn-sm">Edit</a>

                    <c:set var="urlDeleteTask">
                        <c:url value="${urlDelete}">
                            <c:param name="id" value="${task.id}"/>
                        </c:url>
                    </c:set>
                    <a href="${urlDeleteTask}" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Overdue Tasks -->
    <h4 class="mt-5">Overdue Tasks</h4>
    <table class="table table-danger table-striped text-center table-hover mt-4" style="table-layout: fixed; width: 100%;">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Title</th>
            <th scope="col">Description</th>
            <th scope="col">Due Date</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <!-- For each overdue task in the list, a <tr> is created with its respective <td>, task vaiable is created
         and it recieves overdueTasks that comes fromthe controller-->
        <c:forEach var="overdueTask" items="${overdueTasks}">
            <tr class="text-center">
                <td>${overdueTask.id}</td>
                <td>${overdueTask.title}</td>
                <td>${overdueTask.description}</td>
                <td>${overdueTask.dueDate}</td>
                <td>
                    <c:set var="urlCompleteOverdueTask">
                        <c:url value="${urlComplete}">
                            <c:param name="id" value="${overdueTask.id}"/>
                        </c:url>
                    </c:set>
                    <a href="${urlCompleteOverdueTask}" class="btn btn-success btn-sm">Complete</a>

                    <c:set var="urlEditOverdueTask">
                        <c:url value="${urlEdit}">
                            <c:param name="id" value="${overdueTask.id}"/>
                        </c:url>
                    </c:set>
                    <a href="${urlEditOverdueTask}" class="btn btn-warning btn-sm">Edit</a>

                    <c:set var="urlDeleteOverdueTask">
                        <c:url value="${urlDelete}">
                            <c:param name="id" value="${overdueTask.id}"/>
                        </c:url>
                    </c:set>
                    <a href="${urlDeleteOverdueTask}" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Completed Tasks -->
    <h4 class="mt-5">Completed Tasks</h4>
    <table class="table table-success table-striped text-center table-hover mt-4" style="table-layout: fixed; width: 100%;">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Title</th>
            <th scope="col">Description</th>
            <th scope="col">Due Date</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <!-- For each completed task in the list, a <tr> is created with its respective <td>, task vaiable is created
         and it recieves completedTasks that comes from the controller-->
        <c:forEach var="completedTask" items="${completedTasks}">
            <tr class="text-center">
                <td>${completedTask.id}</td>
                <td>${completedTask.title}</td>
                <td>${completedTask.description}</td>
                <td>${completedTask.dueDate}</td>
                <td>
                    <!-- guarda la URL completa con el parámetro en la variable urlDeleteCompletedTask. -->
                    <c:set var="urlDeleteCompletedTask">
                        <c:url value="${urlDelete}">
                            <!-- agrega un parámetro id=... con el id de la tarea actual. -->
                            <c:param name="id" value="${completedTask.id}"/>
                        </c:url>
                    </c:set>
                    <a href="${urlDeleteCompletedTask}" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>