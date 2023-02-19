import 'package:dartz/dartz.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import 'execeptions.dart';

class NetworkService {
  final _snackbar = locator<SnackbarService>();
  final _navigation = locator<NavigationService>();
  final _logger = getLogger("NetworkService");

  Future<Either<void, dynamic>> fmt(Function function) async {
    try {
      return Right(await function.call());
    }  catch (e) {
      final errorMessage =  ExceptionHandlers().getExceptionString(e);
      _logger.v(errorMessage);
      _snackbar.showSnackbar(message: errorMessage);
      _navigation.back();
      return const Left(null);
    }
  }
}