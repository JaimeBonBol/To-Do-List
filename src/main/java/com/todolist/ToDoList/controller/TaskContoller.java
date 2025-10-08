package com.todolist.ToDoList.controller;

import com.todolist.ToDoList.model.Task;
import com.todolist.ToDoList.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

        // Share the infomaton with the view, insert the lists in the model under the keys "pendingTasks", "overdueTasks"
        // and "completedTasks". Then the view can use the lists.
        model.put("pendingTasks", pendingTasks);
        model.put("overdueTasks", overdueTasks);
        model.put("completedTasks",completedTasks);

        return "index"; // Show index.jsp
    }

    @GetMapping("/add")
    public String showNewTaskView(){
        return "add"; // Show add.jsp
    }

    /**
     * With Spring param @ModelAttribute("taskForm") Task task MVC will attempt to automatically fill the Task
     * object with data coming from the form.
     * @param task
     * @return
     */
    @PostMapping("/add")
    public String saveTask(@ModelAttribute("taskForm") Task task){
        // Task object have the information from the form.
        taskService.saveTask(task);

        return "redirect:/";    // Redirect to path "/"

    }


    @GetMapping("/edit")
    public String showEditTaskView(@RequestParam Long id, ModelMap modelo){
        // Search the task by the id of the route that gives every edit button.
        Task task = taskService.getTaskById(id);

        // Share the model with the view. Insert the task in the model under the key task so the view can use them.
        modelo.put("task", task);

        // Show edit.jsp
        return "edit";

    }

    /**
     * Method to edit a task, receives the attribute from the taskForm model to work with.
     * @param task
     * @return
     */
    @PostMapping("/edit")
    public String editTask(@ModelAttribute("taskForm") Task task){
        // Task object have the information from the form. Now saveTask edit because id is not null.
        taskService.saveTask(task);

        return "redirect:/";    // Redirect to path "/"

    }


    /**
     * Method to mark a task as completed by the id of the @RequestParam
     */
    @GetMapping("/complete")
    public String completeTask(@RequestParam Long id){
        taskService.completeTask(id);

        return "redirect:/";    // Redirect to path "/"
    }

    /**
     * Method to delete a task by the id of @RequestParam
     */
    @GetMapping("/delete")
    public String deleteTask(@RequestParam Long id){
        taskService.deleteTask(id);

        return "redirect:/";    // Redirect to path "/"
    }

}
