import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:todo_app/business/service/service01.dart';
import 'package:todo_app/implementation/implementation.dart';
import 'package:todo_app/pages/home/homepage.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
setup() {
  getIt.registerLazySingleton<Service01>(() => Implementation());
}

void main() async {
  setup(); // appel setup function to register services
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My todolist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Homepage(),
    );
  }
}
