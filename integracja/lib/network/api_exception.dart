import 'package:get/get.dart';
import 'package:integracja/controllers/authentication/authentication_controller.dart';

class ApiException implements Exception {
  final String _message;
  final int _codeStatus;
  ApiException([this._codeStatus, this._message]);

  @override
  String toString() {
    return "$_codeStatus: $_message";
  }
}

class BadRequestException extends ApiException {
  BadRequestException() : super(400, "Bad request");
}

class UnauthorizedException extends ApiException {
  UnauthorizedException() : super(401, "Unauthorized") {
    Get.find<AuthenticationController>().signOut();
  }
}

class GameException extends ApiException {
  GameException(int errorCode, String message) : super(errorCode, message);
}
