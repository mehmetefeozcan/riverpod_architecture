import 'package:riverpod_architecture/domain/repository/index.dart';
import 'package:riverpod_architecture/data/model/index.dart';

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  Future<User> call() async {
    return repository.fetchUser();
  }
}
