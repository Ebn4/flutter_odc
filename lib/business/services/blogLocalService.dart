import 'package:app/business/models/user.dart';

abstract class BlogLocalService{
  Future<bool> sauvergaderUser(User user);
}