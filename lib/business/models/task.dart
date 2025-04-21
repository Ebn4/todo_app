// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
    int id;
    String title;
    String description;

    Task({
        required this.id,
        required this.title,
        required this.description,
    });

    Task copyWith({
        int? id,
        String? title,
        String? description,
    }) => 
        Task(
            id: id ?? this.id,
            title: title ?? this.title,
            description: description ?? this.description,
        );

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
    };
}
