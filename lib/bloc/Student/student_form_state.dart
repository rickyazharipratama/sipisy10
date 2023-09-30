import 'package:flutter/foundation.dart';
import 'package:spisy10/models/Student.dart';

@immutable
abstract class StudentFormState {
  final Student? std;
  final String? message;

  const StudentFormState({this.std, this.message});
}
  
class InitialUserFormState extends StudentFormState {}

class Loading extends StudentFormState {}

class Error extends StudentFormState {
  const Error({required String errorMessage}) : super(message: errorMessage);
}

class Loaded extends StudentFormState {
  const Loaded({required Student user}) : super(std: user);
}

class Success extends StudentFormState {
  const Success({required String successMessage}) : super(message: successMessage);
}
