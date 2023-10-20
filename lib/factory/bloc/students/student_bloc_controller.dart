import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/factory/bloc/students/students_event.dart';
import 'package:spisy10/factory/bloc/students/students_state.dart';

abstract class StudentBlocController{
  Future<void> addStudent(AddStudent event, Emitter<StudentsState> emit);
  Future<void> updateStudent(UpdateStudent event, Emitter<StudentsState> emit);
  Future<void> deleteStudent(DeleteStudent event, Emitter<StudentsState> emit);
  Future<void> getStudent(GetStudents event, Emitter<StudentsState> emit);
  void getDetailStudent(GetDetailStudent event, Emitter<StudentsState> emit);
  void initializeStudent(InitializeStudent event, Emitter<StudentsState> emit);
}
