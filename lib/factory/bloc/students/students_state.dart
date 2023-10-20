import 'package:spisy10/warehouse/models/student.dart';

abstract class StudentsState{

   List<Student>? students;
   Student? selectedStudent;
   String? message;
   StudentsState({this.students, this.selectedStudent,this.message});
}

class StudentIntializing extends StudentsState{
  
  StudentIntializing({List<Student>? students}) : super(students: students);

}

class StudentUpdated extends StudentsState{
  StudentUpdated({required List<Student> students}) : super(students: students);
}

class SelectedStudentUpdated extends StudentsState{
  SelectedStudentUpdated({required Student student}) : super(selectedStudent: student);
}

class StudentDeleted extends StudentsState{
  StudentDeleted({required List<Student> students}) : super(students: students);
}

class StudentLoaded extends StudentsState{
  StudentLoaded({required List<Student> students}) : super(students: students);
}

class OnError extends StudentsState{
  OnError({required String message}) : super(message: message);
}

