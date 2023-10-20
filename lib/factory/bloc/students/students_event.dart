
import 'package:flutter/widgets.dart';
import 'package:spisy10/warehouse/models/student.dart';

@immutable
abstract class StudentsEvent{}

abstract class AddStudent extends StudentsEvent{
  void insertIntoList(List<Student> students);
  Future<int> insertIntoRepo(); 
}

abstract class DeleteStudent extends StudentsEvent{
  
  void removeFromList(List<Student> students);
  Future<int> deletingStudent();

}

abstract class UpdateStudent extends StudentsEvent{
 
  Future<int> updatingStudent();
}
abstract class GetStudents extends StudentsEvent{
  Future<List<Student>?> get savedStudent;
}

abstract class GetDetailStudent extends StudentsEvent{
  Student? retrieveSelectedStudentFromList(List<Student> students);
}

class InitializeStudent extends StudentsEvent{
  InitializeStudent();
}