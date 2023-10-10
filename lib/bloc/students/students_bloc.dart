
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/bloc/students/students_event.dart';
import 'package:spisy10/bloc/students/students_state.dart';
import 'package:spisy10/utils/student_repository.dart';

class StudentsBloc extends Bloc<StudentsEvent,StudentsState>{
  final StudentRepository repository = StudentRepository();


  StudentsBloc() : 
    super(StudentIntializing(students: [])){
      on<AddStudent>(_addStudent);
      on<UpdateStudent>(_updateStudent);
      on<DeleteStudent>(_deleteStudent);
      on<GetStudents>(_getStudent);
      on<GetDetailStudent>(_getDetailStudent);
      on<InitializeStudent> (_initializeStudent);
    }




  void _addStudent(AddStudent event, Emitter<StudentsState> emit) async{
    try{
      state.students!.add(event.std);
      await repository.createStudent(event.std);
      emit(StudentUpdated(students: state.students!));
    }catch(e){
      OnError(message: e.toString());
    }
  }

  void _updateStudent(UpdateStudent event, Emitter<StudentsState> emit) async{
    try{
      // because we choose to make new students Bloc provider in form so no need to find in list state

      //final int oldIndex = state.students!.indexWhere((element) => element.id == event.id);
      //Student oldStudent = state.students!.where((element) => element.id == event.id).first;
      //state.students![oldIndex] = event.updatedStudent;
      await repository.updateStudent(event.updatedStudent, event.id!);
      emit(StudentUpdated(students: state.students!));
    }catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      OnError(message: e.toString());
    }
  }

  void _deleteStudent(DeleteStudent event, Emitter<StudentsState> emit) async{
    try{
      state.students!.removeWhere((element) => element.id == event.id);
      await repository.deleteStudent(event.id);
      emit(StudentDeleted(students: state.students!));
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      OnError(message: e.toString());
    }
    
  }

  void _getStudent(GetStudents event, Emitter<StudentsState> emit)  async{
    state.students = await repository.getStudents();
    emit(StudentLoaded(students: state.students!));
  }

  void _getDetailStudent(GetDetailStudent event, Emitter<StudentsState> emit) {
     state.selectedStudent = state.students!.singleWhere((element) => element.id == event.id);
     //emit(SelectedStudentUpdated(student: state.selectedStudent!));
  }

  FutureOr<void> _initializeStudent(InitializeStudent event, Emitter<StudentsState> emit) {
    emit(StudentIntializing(
      students: []
    ));
  }
}