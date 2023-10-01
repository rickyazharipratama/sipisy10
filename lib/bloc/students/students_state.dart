import 'package:spisy10/models/Student.dart';

abstract class StudentsState{

   List<Student>? students;
   Student? selectedStudent;
   String? message;
   StudentsState({this.students, this.selectedStudent,this.message});
}

class StudentIntializing extends StudentsState{
  
  StudentIntializing({required List<Student> students}) : super(students: students);

}

class StudentUpdated extends StudentsState{
  StudentUpdated({required List<Student> students}) : super(students: students);
}

class SelectedStudentUpdated extends StudentsState{
  SelectedStudentUpdated({required Student student}) : super(selectedStudent: student);
}

class OnError extends StudentsState{
  OnError({required String message}) : super(message: message);
}

