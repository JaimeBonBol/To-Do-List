<%@ include file="communitary/header.jsp"%>
<%@ include file="communitary/navbar.jsp"%>

<!-- FullCalendar CSS -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.css' rel='stylesheet' />

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


<script>
    // Esto espera a que toda la página (HTML) esté cargada antes de ejecutar el código.
    document.addEventListener('DOMContentLoaded', function() {

        var calendarEl = document.getElementById('calendar');

        // Crea una nueva instancia de FullCalendar dentro del contenedor.
        var calendar = new FullCalendar.Calendar(calendarEl, {

            // La vista inicial del calendario será la de mes (grid de días).

            initialView: 'dayGridMonth',

            // Ajusta la altura del calendario automáticamente según el contenido.
            height: 'auto',

            // Configura la barra superior del calendario:
            // - izquierda: botones de anterior, siguiente y "hoy"
            // - centro: muestra el título del mes/año
            // - derecha: botones para cambiar de vista (mes, semana, día)
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },

            events: [
                // Aquí se define el listado de eventos que se mostrarán en el calendario.

                <c:forEach var="task" items="${pendingTasks}">
                {
                    // Identificador único de la tarea
                    id: '${task.id}',

                    // Título que se muestra en el calendario para la tarea pendiente
                    title: '[Pending] ${task.title}',

                    // Fecha de inicio del evento (fullcalendar la interpreta automáticamente)
                    start: '${task.dueDate}',

                    // Color del evento (azul para pendientes)
                    color: '#0d6efd',

                    // Descripción de la tarea (propiedad personalizada)
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
            // Nota: FullCalendar guardará la propiedad 'description' dentro de `extendedProps`.

            eventClick: function(info) {
                // Función que se ejecuta cuando se hace clic sobre un evento en el calendario.
                // `info` contiene toda la información del evento.

                alert(
                    'Tarea: ' + info.event.extendedProps.description +
                    '\nFecha: ' + info.event.startStr
                );
                // Muestra un alert con:
                // - la descripción de la tarea (usando extendedProps)
                // - la fecha de inicio del evento
            }
        });

        calendar.render();
        // Dibuja/renderiza el calendario en el HTML
    });
</script>


<%@ include file="communitary/footer.jsp"%>
