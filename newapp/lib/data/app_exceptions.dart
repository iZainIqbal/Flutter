class AppExceptions implements Exception {
  final _prefix;
  final _message;

  AppExceptions([this._prefix, this._message]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, "Invalid Request: ");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message]) : super(message, "Unauthorized: ");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
 
//  In the above code, we have created a class  AppExceptions  that extends  Exception . We have also created four different exceptions that extend  AppExceptions . 
//  FetchDataException  is thrown when there is an error during communication. BadRequestException  is thrown when the request is invalid. UnauthorizedException  is thrown when the request is unauthorized. InvalidInputException  is thrown when the input is invalid. 
//  Now, let's see how to use these exceptions in our code. 
//  Using Custom Exceptions 
//  In the  login_provider.dart  file, we have a  login  method that makes an API call to the server. We will use the  FetchDataException  and  BadRequestException  exceptions in this method. 
//  import 'package:flutter/material.dart';