package com.todolist.ToDoList.controller;

import com.todolist.ToDoList.model.Task;
import com.todolist.ToDoList.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class TaskContoller {

    @Autowired
    private TaskService taskService;

    @GetMapping("/")
    public String start(ModelMap model){
        List<Task> pendingTasks = taskService.getPendingTasks();
        List<Task> overdueTasks = taskService.getOverdueTasks();
        List<Task> completedTasks = taskService.getCompletedTasks();

        // Share the infomaton with the view, insert the listsin the model under the keys "pendingTasks", "overdueTasks"
        // and "completedTasks". Then the view can use the lists.
        model.put("pendingTasks", pendingTasks);
        model.put("overdueTasks", overdueTasks);
        model.put("completedTasks",completedTasks);

        return "index"; // Show index.jsp
    }



}
