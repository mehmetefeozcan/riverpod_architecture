import 'package:riverpod_architecture/presentation/widgets/index.dart';
import 'package:riverpod_architecture/core/constants/index.dart';
import 'package:riverpod_architecture/core/enums/index.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';

abstract class DioClientHelper {
  showErrorMessage(String message, DioException error) {
    AppConstants.rootScaffoldMessengerKey.currentState!.showSnackBar(
      customSnackBar(
        error: true,
        text: message,
      ),
    );
    if (error.message != null && error.type == 401) {
      AppConstants.rootScaffoldMessengerKey.currentContext!
          .go(NavigationEnums.splash.toPath);
    }
  }
}
