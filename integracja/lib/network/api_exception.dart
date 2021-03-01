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
  UnauthorizedException() : super(401, "Unauthorized");
}
