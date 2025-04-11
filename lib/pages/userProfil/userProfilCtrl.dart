

import 'package:app/pages/userProfil/userProfilState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../business/models/user.dart';
import '../../business/services/blogLocalService.dart';
import '../../business/services/blogNetworkService.dart';
import '../../main.dart';

class UserProfilCtrl extends StateNotifier<UserProfileState>{
  UserProfilCtrl(): super(UserProfileState()){
  }

  var userNetworkService = getIt.get<BlogNetworkService>();
  var userLocalService = getIt.get<BlogLocalService>();


  Future<void> recupererUser([User? user])async{
    var user_ = user ?? User();
    state = state.copyWith(user : user_);
  }

  Future<void> actualiserUser()async{
    state = state.copyWith(isLoading: true);
    var token = state.user?.token ??"";
    var newUser = await userNetworkService.recupererUser(token);

    state = state.copyWith(isLoading: false, user : newUser);
  }

  Future<void> deconnecterUser()async{
    state = state.copyWith(isLoading: true);
    await userLocalService.deconnecterUser();
    state = state.copyWith(isLoading: false, user: null);
  }


}

final userProfileCtrlProvider = StateNotifierProvider<UserProfilCtrl, UserProfileState>((ref){
  return UserProfilCtrl();
});