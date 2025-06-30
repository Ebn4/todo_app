import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/business/models/task.dart';
import 'package:todo_app/business/models/user.dart';
import 'package:todo_app/business/service/service01.dart';

class Implementation implements Service01 {

  var baseUrl = dotenv.env['API_BASE_URL'];

  @override
  Future<bool>? addTask(Task task) async{
    var api = Uri.parse("$baseUrl/tasks");
    var data = task.toJson();
    var response = await http.post(api,body: data);
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
  
  @override
  Future<bool>? deleteTask(int id) async{
    var api = Uri.parse("$baseUrl/tasks/${id}");
    var response = await http.delete(api);
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
  
  @override
  Future<Task>? getTask(int id) async{
    var api = Uri.parse("$baseUrl/tasks/${id}");
    var response = await http.get(api);

    if(response.statusCode == 200){
      Task data = jsonDecode(response.body);
      return data;
    }else{
      throw Exception("Failed to load tasks");
    }
  }
  
  @override
  Future<List<Task>>? getTasks() async {
    var api = Uri.parse("$baseUrl/tasks");
    var response = await http.get(api);

    if (response.statusCode == 200) {
      List<Task> data =
      jsonDecode(
        response.body,
      ).map<Task>((json) => Task.fromJson(json)).toList();
      return data;
    } else {
      throw Exception("Failed to load tasks");
    }
  }
  
  
}


Future<void> main() async {
  var service = Implementation();
  List<Task>? taches = await service.getTasks();
  print(taches);
}
