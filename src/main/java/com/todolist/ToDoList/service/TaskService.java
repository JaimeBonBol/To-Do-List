package com.todolist.ToDoList.service;

import com.todolist.ToDoList.model.Task;

import java.util.List;

public interface TaskService {

    public List<Task> getTasks();

    public Task getTaskById(Long id);

    public Task saveTask(Task task);

    public void deleteTask(Long id);

    public Task completeTask(Long id);

    public List<Task> getCompletedTasks();

    public List<Task> getPendingTasks();

    public List<Task> getOverdueTasks();

}
