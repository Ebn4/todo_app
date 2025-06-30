import 'package:todo_app/business/models/user.dart';

abstract class Servicelocal {
  Future<void> saveUser(User? user);
  Future<User?> getUser();
  Future<void> deleteUser();
}
