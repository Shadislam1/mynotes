
//login exception
class UserNotFoundAuthException implements Exception{}

class WrongPasswordAuthException implements Exception {}

// register exception

class WeakPasswordAuthException implements Exception{}

class EmailAlreadyInAuthException implements Exception{}

class InvalidEmailAuthException implements Exception{}

//generic exception 

class GenericInAuthException implements Exception{}

class UserNotLoggedInAuthException implements Exception{}