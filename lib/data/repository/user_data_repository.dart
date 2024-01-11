import 'package:riverpod_architecture/data/model/user.dart';
import 'package:riverpod_architecture/domain/repository/index.dart';

class UserDataRepository extends UserRepository {
  @override
  Future<User> fetchUser() async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => User(id: "1", name: "Boss"),
    );
  }
}
