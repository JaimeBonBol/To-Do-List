<%@ include file="communitary/header.jsp"%>
<%@ include file="communitary/navbar.jsp"%>

<div class="container">
    <div class="text-center my-4">
        <h3 class="fw-bold text-primary">Edit Task</h3>
    </div>

    <!-- When the form is submitted, the taskForm object we defined in controller method is filled in -->
    <!-- Spring uses the name attribute -->
    <form action="${urlEdit}" modelAttribute="taskForm" method="post">
        <input type="hidden" name="id" value="${task.id}"/>
        <div class="mb-3">
            <label for="title" class="form-label" >Title</label>
            <input type="text" class="form-control" id="title" name="title" required="true" value="${task.title}" placeholder="Enter the Title of the task" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" required="true" rows="3">${task.description}</textarea>
        </div>
        <div class="mb-3 form-check">
            <input class="form-check-input" type="checkbox" value="${task.completed}" id="completed" name="completed">
            <label class="form-check-label" for="completed">
                Completed
            </label>
        </div>
        <div class="mb-3">
            <label for="dueDate" class="form-label">Due Date</label>
            <input type="date" class="form-control" name="dueDate" id="dueDate" value="${task.dueDate}">
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-warning btn-sm me-3">Edit</button>
            <a href="${urlInicio}" class="btn btn-danger btn-sm">Back</a>
        </div>
    </form>
</div>

<%@ include file="communitary/footer.jsp"%>