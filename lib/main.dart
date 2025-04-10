import 'package:app/business/services/blogLocalService.dart';
import 'package:app/business/services/blogNetworkService.dart';
import 'package:app/framework/blogLocalServiceImpl.dart';
import 'package:app/pages/articleList/listArticle.dart';
import 'package:app/pages/comment/commentPage.dart';
import 'package:app/pages/login/login.dart';
import 'package:app/pages/login/loginControl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'framework/blogNetworkServiceImpl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<BlogNetworkService>(() {
    return BlogNetworkServiceImpl();
  });
  getIt.registerLazySingleton<BlogLocalService>(() {
    var box = GetStorage();
    return BlogLocalServiceImpl(box: box);
  });
}

void main() async {
  await dotenv.load(); // Charge les variables du .env
  await GetStorage.init();
  setup();
  runApp(ProviderScope(child: Appication()));
}

class Appication extends ConsumerStatefulWidget {
  const Appication({super.key});

  @override
  ConsumerState<Appication> createState() => _AppicationState();
}

class _AppicationState extends ConsumerState<Appication> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var ctrl = ref.read(loginControlPorvider.notifier);
      ctrl.recupererUserLocal();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(loginControlPorvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Login(),
      home: state.user != null ? ListarticlePage() : Login(),
    );
  }
}
