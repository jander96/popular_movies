class AppException implements Exception{
  final String message;
  final int statusCode;

  AppException(this.message, this.statusCode);

  static AppException fromStatusCode(int statusCode){
    switch(statusCode){
      case 400: return BadRequest();
      case 401: return UnAuthenticated();
      case 404: return NotFound();
      default: return UnKnow();
    }
  }
}

class UnAuthenticated extends AppException{
  UnAuthenticated({String message = 'no authenticated'}): super(message, 401);
}

class BadRequest extends AppException{
  BadRequest({String message = 'bad request'}): super(message, 400);
}

class NotFound extends AppException{
  NotFound({String message = 'not found'}): super(message, 404);
}

class UnKnow extends AppException{
  UnKnow({String message = 'unknown error'}): super(message, 0 );
}

class NoConnection extends AppException {
  NoConnection({String message = 'no internet connection'}): super(message,-1);
}

