import 'package:admin/models/User_Model.dart';

abstract class IUserRepository {
  Stream<List<UserModel>> getUser();
}
