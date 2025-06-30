import 'package:riverpod/riverpod.dart';
import 'package:todo_app/business/models/authentification.dart';
import 'package:todo_app/business/service/service01.dart';
import 'package:todo_app/business/service/serviceLocal.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/pages/auth/login/loginState.dart';

class LoginController extends StateNotifier<LoginState> {
  var service = getIt.get<Service01>();
  var serviceLocal = getIt.get<Servicelocal>();
  LoginController() : super(LoginState());


  //la méthode login est utilisée pour authentifier l'utilisateur
  Future<void> login(Authentification data) async {
    state = state.copyWith(isLoading: true);
    try {
      var user = await service.registerUser(data);
      if (user != null) {
        state = state.copyWith(user: user, isLoading: false);
      } else {
        state = state.copyWith(errorMsg: "Invalid credentials", isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(errorMsg: e.toString(), isLoading: false);
    }
  }

  // la methode saveUser est utilisée pour sauvegarder l'utilisateur dans le stockage local
  Future<void> saveUser() async {
    try {
      await serviceLocal.saveUser(state.user);
    } catch (e) {
      state = state.copyWith(errorMsg: e.toString());
    }
  }


  
}

final loginProvider = StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(),
);
