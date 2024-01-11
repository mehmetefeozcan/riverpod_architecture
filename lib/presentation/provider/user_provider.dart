import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/data/model/index.dart';
import 'package:riverpod_architecture/data/repository/index.dart';
import 'package:riverpod_architecture/domain/usecase/index.dart';

final userProvider = FutureProvider<User>((ref) async {
  final getUserUseCase = GetUserUseCase(UserDataRepository());
  return getUserUseCase();
});
