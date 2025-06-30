import 'package:get_storage/get_storage.dart';
import 'package:todo_app/business/models/user.dart';
import 'package:todo_app/business/service/serviceLocal.dart';

class ImplementationLocal implements Servicelocal {

  GetStorage box;

  ImplementationLocal({required this.box});

  @override
  Future<void> deleteUser() async{
    if(box.hasData('user')) {
      await box.remove('user');
    }
  }

  @override
  Future<User?> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> saveUser(User? user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}