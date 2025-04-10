import 'package:app/business/models/user.dart';

class LoginState {
  bool? isLoading;
  String? errorMsg;
  User? user;

  LoginState({this.isLoading, this.errorMsg, this.user});

  LoginState copyWith({bool? isLoading, String? errorMsg, User? user}) => LoginState(
    isLoading: isLoading ?? this.isLoading,
    errorMsg: errorMsg ?? this.errorMsg,
    user: user?? this.user
  );
}
