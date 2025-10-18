<%@ include file="communitary/header.jsp"%>
<%@ include file="communitary/navbar.jsp"%>

<!-- FullCalendar CSS -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.css' rel='stylesheet' />

<!-- HTML del calendario -->
<div class="container mt-5">
    <div class="card shadow p-4">
        <h3 class="text-center text-primary mb-4">
            <i class="bi bi-calendar-event me-2"></i> Task Calendar
        </h3>
        <!-- Contenedor donde se pintará el calendario -->
        <div id="calendar"></div>
    </div>
</div>

<!-- FullCalendar JS UMD -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>


<!-- Tu script personalizado -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            height: 'auto',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            events: [
                <c:forEach var="task" items="${pendingTasks}">
                    {
                        id: '${task.id}',
                        title: '[Pending] ${task.title}',
                        start: '${task.dueDate}',
                        color: '#0d6efd',
                        description: '${task.description}'

                    },
                </c:forEach>
                <c:forEach var="task" items="${overdueTasks}">
                    {
                        id: '${task.id}',
                        title: '[Overdue] ${task.title}',
                        start: '${task.dueDate}',
                        color: '#dc3545',
                        description: '${task.description}'
                    },
                </c:forEach>
                <c:forEach var="task" items="${completedTasks}">
                    {
                        id: '${task.id}',
                        title: '[Done] ${task.title}',
                        start: '${task.dueDate}',
                        color: '#198754',
                        description: '${task.description}'
                    },
                </c:forEach>
            ],
            eventClick: function(info) {
                alert('Tarea: ' + info.event.extendedProps.description +  '\nFecha: ' + info.event.startStr);
            }
        });
        calendar.render();
    });
</script>

<!-- el include va al final -->
<%@ include file="communitary/footer.jsp"%>
