import 'package:flutter/material.dart';
import 'package:todo_app/pages/alerMessage.dart';
import 'package:todo_app/pages/myBottomNavbar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My todolist',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 130),
            SizedBox(
              height: 80,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Ajouter une tâche',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  labelText: 'Ajouter une tâche',
                  labelStyle: const TextStyle(color: Colors.blue),
                  prefixIcon: const Icon(Icons.task, color: Colors.blue),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add, color: Colors.blue),
                    onPressed: () {
                      print("I learn python because is awesome");
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(children: []),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MessageAlert();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: Mybottomnavbar(),
    );
  }
}
