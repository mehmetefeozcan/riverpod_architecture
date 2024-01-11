import 'package:riverpod_architecture/data/model/index.dart';

abstract class UserRepository {
  Future<User> fetchUser();
}
