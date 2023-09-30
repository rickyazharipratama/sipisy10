import 'package:flutter/foundation.dart';
import 'package:spisy10/models/Student.dart';

@immutable
abstract class StudentFormEvent {
  final Student student;

   const StudentFormEvent({required this.student});
}

class BackEvent extends StudentFormEvent {
  const BackEvent({required Student user}) : super(student: user);
}

class GetUser extends StudentFormEvent {
  const GetUser({required Student user}) : super(student: user);
}

class CreateUser extends StudentFormEvent {
  const CreateUser({required Student user}) : super(student: user);
}

class UpdateUser extends StudentFormEvent {
  const UpdateUser({required Student user}) : super(student: user);
}