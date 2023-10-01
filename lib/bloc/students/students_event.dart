
import 'package:flutter/widgets.dart';
import 'package:spisy10/models/Student.dart';

@immutable
abstract class StudentsEvent{}

class AddStudent extends StudentsEvent{
  final Student std;
  AddStudent({required this.std});
}

class DeleteStudent extends StudentsEvent{
  final int id; 
  DeleteStudent({required this.id});
}

class UpdateStudent extends StudentsEvent{
  final Student updatedStudent;
  final int id;
  UpdateStudent({
    required this.updatedStudent,
    required this.id
  });
}
class GetStudents extends StudentsEvent{

}

class GetDetailStudent extends StudentsEvent{
  final int id;
  GetDetailStudent({required this.id});
}
