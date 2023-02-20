import 'package:dartz/dartz.dart';

import '../../../app/app.logger.dart';
import 'execeptions.dart';

class NetworkService {
  final _logger = getLogger("NetworkService");
  
  Future<Either<void, dynamic>> fmt(Function function) async {
    try {
      return Right(await function.call());
    } catch (e) {
      final errorMessage = ExceptionHandlers().getExceptionString(e);
      _logger.v(errorMessage);
      return const Left(null);
    }
  }
}
