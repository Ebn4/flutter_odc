import 'package:app/business/services/blogLocalService.dart';
import 'package:app/business/services/blogNetworkService.dart';
import 'package:app/framework/blogLocalServiceImpl.dart';
import 'package:app/pages/articleList/listArticle.dart';
import 'package:app/pages/comment/commentPage.dart';
import 'package:app/pages/login/login.dart';
import 'package:app/pages/userProfil/userProfilPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'framework/blogNetworkServiceImpl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


var getIt = GetIt.instance;

void setup(){
  getIt.registerLazySingleton<BlogNetworkService>((){
    return BlogNetworkServiceImpl();
  });
  getIt.registerLazySingleton<BlogLocalService>((){
    return BlogLocalServiceImpl(box: GetStorage());
  });


}
void main() async{
  await GetStorage.init();
  await dotenv.load(); // Charge les variables du .env
  setup();
  runApp(ProviderScope(child: Appication()));
}
class Appication extends StatelessWidget {
  const Appication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Login(),
     home: UserProfilePage(),
    );
  }
}
