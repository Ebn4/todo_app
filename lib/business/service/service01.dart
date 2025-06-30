import 'package:flutter/material.dart';
import 'package:todo_app/business/models/task.dart';
import 'package:todo_app/business/models/user.dart';

abstract class Service01 {
  Future<List<Task>>? getTasks();
  Future<Task>? getTask(int id);
  Future<bool>? addTask(Task task);
  Future<bool>? updateTask(Task task);
  Future<bool>? deleteTask(int id);
  Future<User>? Authentification();
  Future<void> deconnexion();
}
