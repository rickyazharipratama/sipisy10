import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/factory/bloc/students/student_bloc_controller.dart';
import 'package:spisy10/factory/bloc/students/students_event.dart';
import 'package:spisy10/factory/bloc/students/students_state.dart';

class StudentBlocControllerImpl implements StudentBlocController{

  final StudentsState state;
  StudentBlocControllerImpl({required this.state});

  @override
  Future<void> addStudent(AddStudent event, Emitter<StudentsState> emit) async{
    try{
      event.insertIntoList(state.students!);
      await event.insertIntoRepo();
      emit(StudentUpdated(students: state.students!));
    }catch(e){
      OnError(message: e.toString());
    }
  }

  @override
  Future<void> updateStudent(UpdateStudent event, Emitter<StudentsState> emit) async{
    try{
      // because we choose to make new students Bloc provider in form so no need to find in list state

      //final int oldIndex = state.students!.indexWhere((element) => element.id == event.id);
      //Student oldStudent = state.students!.where((element) => element.id == event.id).first;
      //state.students![oldIndex] = event.updatedStudent;
      await event.updatingStudent();
      emit(StudentUpdated(students: state.students!));
    }catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      OnError(message: e.toString());
    }
  }

  @override
  Future<void> deleteStudent(DeleteStudent event, Emitter<StudentsState> emit) async{
    try{
      event.removeFromList(state.students!);
      await event.deletingStudent();
      emit(StudentDeleted(students: state.students!));
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      OnError(message: e.toString());
    }
    
  }

  @override
  Future<void> getStudent(GetStudents event, Emitter<StudentsState> emit)  async{
    state.students = await event.savedStudent;
    emit(StudentLoaded(students: state.students!));
  }

  @override
  void getDetailStudent(GetDetailStudent event, Emitter<StudentsState> emit) {
    state.selectedStudent = event.retrieveSelectedStudentFromList(state.students!);
     //emit(SelectedStudentUpdated(student: state.selectedStudent!));
  }

  @override
  void initializeStudent(InitializeStudent event, Emitter<StudentsState> emit){
    emit(StudentIntializing(
      students: []
    ));
  }
}