package com.todolist.ToDoList.service;

import com.todolist.ToDoList.model.Task;
import com.todolist.ToDoList.repository.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class TaskServiceImpl implements TaskService{

    @Autowired
    private TaskRepository taskRepository;

    /**
     * Get all tasks in database.
     * @return
     */
    @Override
    public List<Task> getTasks() {
        return taskRepository.findAll();
    }

    /**
     * Get task by id.
     * @param id
     * @return
     */
    @Override
    public Task getTaskById(Long id) {
        return taskRepository.findById(id).orElse(null);
    }

    /**
     * Save or update a task, depends on the value of id attribute, if it is null the method save.
     * @param task
     * @return
     */
    @Override
    public Task saveTask(Task task) {

        LocalDate today = LocalDate.now();
        LocalDate tomorrow = today.plusDays(1);

        if (task.getDueDate() == null){
            task.setDueDate(tomorrow);
        }
        return taskRepository.save(task);
    }

    /**
     * Delete task by id.
     * @param id
     */
    @Override
    public void deleteTask(Long id) {
        taskRepository.deleteById(id);
    }

    /**
     * Mark a task as completed.
     * @param id
     * @return
     */
    @Override
    public Task completeTask(Long id) {
        Task task = getTaskById(id);
        task.setCompleted(true);

        return taskRepository.save(task);
    }

    /**
     * Get completed tasks.
     * @return
     */
    @Override
    public List<Task> getCompletedTasks() {
        List<Task> tasks = taskRepository.findAll();
        List<Task> tasksCompleted = new ArrayList<>();

        for (Task task : tasks){
            if (task.getCompleted() == true){
                tasksCompleted.add(task);
            }
        }
        return tasksCompleted;
    }

    /**
     * Get pending tasks (not completed, due date today or later)
     * @return
     */
    @Override
    public List<Task> getPendingTasks() {
        List<Task> tasks = taskRepository.findAll();
        List<Task> tasksPending = new ArrayList<>();

        LocalDate today = LocalDate.now();

        for (Task task : tasks){
            if (task.getCompleted() == false && task.getDueDate().isAfter(today)){
                tasksPending.add(task);
            }
        }
        return tasksPending;
    }

    /**
     * Get overdue tasks (not completed, due date < today)
     * @return
     */
    @Override
    public List<Task> getOverdueTasks() {
        List<Task> tasks = taskRepository.findAll();
        List<Task> tasksOverdue = new ArrayList<>();

        LocalDate today = LocalDate.now();

        for (Task task : tasks){
            if (task.getCompleted() == false && task.getDueDate().isBefore(today)){
                tasksOverdue.add(task);
            }
        }
        return tasksOverdue;
    }
}
