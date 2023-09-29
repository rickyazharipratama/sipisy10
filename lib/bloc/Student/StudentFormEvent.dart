
import 'package:meta/meta.dart';
import 'package:spisy10/models/Student.dart';

@immutable
abstract class StudentFromEvent {
  final Student? student;

   const StudentFromEvent({this.student});
}

class BackEvent extends StudentFromEvent {
  const BackEvent({required Student user}) : super(student: user);
}

class GetUser extends StudentFromEvent {
  const GetUser({required Student user}) : super(student: user);
}

class CreateUser extends StudentFromEvent {
  CreateUser({required Student user}) : super(student: user);
}

class UpdateUser extends StudentFromEvent {
  UpdateUser({required Student user}) : super(student: user);
}