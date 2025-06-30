import 'package:todo_app/business/models/user.dart';

class LoginState {
  final bool? isLoading;
  final String? errorMsg;
  final User? user;

  LoginState({this.isLoading, this.errorMsg, this.user});

  LoginState copyWith({bool? isLoading, String? errorMsg, User? user}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMsg: errorMsg ?? this.errorMsg,
      user: user ?? this.user,
    );
  }
}
