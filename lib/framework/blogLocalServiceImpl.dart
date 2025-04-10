import 'dart:convert';

import 'package:app/business/models/user.dart';
//import 'package:app/framework/blogLocalServiceImpl.dart';
import 'package:get_storage/get_storage.dart';

import '../business/services/blogLocalService.dart';

class BlogLocalServiceImpl implements BlogLocalService {
  GetStorage? box;
  BlogLocalServiceImpl({this.box});
  @override
  Future<bool> sauvergaderUser(User user) async {
    var data = user.toMap();
    await box?.write("user", jsonEncode(data));
    return true;
  }

  @override
  Future<User?> recupererUser() async {
    var user = await box?.read("user") as String?;
    if (user == null) return null;
    var data = jsonDecode(user) as Map;
    return User.fromMap(data);
  }
}
