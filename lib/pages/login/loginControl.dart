import 'package:app/business/models/Authentification.dart';
import 'package:app/business/services/blogLocalService.dart';
import 'package:app/business/services/blogNetworkService.dart';
import 'package:app/main.dart';
import 'package:app/pages/login/loginState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginControl extends StateNotifier<LoginState> {
  var network = getIt.get<BlogNetworkService>();
  var local = getIt.get<BlogLocalService>();

  LoginControl() : super(LoginState()) {
    //
  }

  Future<bool> submitForm(Authentification data) async {
    state = state.copyWith(isLoading: true);

    var user = await network.authentifier(data);
    if (user != null) {
      var res = await local.sauvergaderUser(user);
      state = state.copyWith(isLoading: false, user: user);
      return res;
    }

    state = state.copyWith(isLoading: false);

    return false;
  }
}

final loginControlPorvider = StateNotifierProvider<LoginControl, LoginState>((
  ref,
) {
  ref.keepAlive();
  return LoginControl();
});
