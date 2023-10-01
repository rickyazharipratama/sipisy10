
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/bloc/students/students_event.dart';
import 'package:spisy10/bloc/students/students_state.dart';
import 'package:spisy10/models/Student.dart';
import 'package:spisy10/utils/StudentRepository.dart';

class StudentsBloc extends Bloc<StudentsEvent,StudentsState>{
  final StudentRepository repository = StudentRepository();


  StudentsBloc() : 
    super(StudentIntializing(students: [])){
      on<AddStudent>(_addStudent);
      on<UpdateStudent>(_updateStudent);
      on<DeleteStudent>(_deleteStudent);
      on<GetStudents>(_getStudent);
      on<GetDetailStudent>(_getDetailStudent);
    }


  void _addStudent(AddStudent event, Emitter<StudentsState> emit) {
    try{
      state.students!.add(event.std);
      repository.createStudent(event.std);
      emit(StudentUpdated(students: state.students!));
    }catch(e){
      OnError(message: e.toString());
    }
  }

  void _updateStudent(UpdateStudent event, Emitter<StudentsState> emit) {
    try{
      final int oldIndex = state.students!.indexWhere((element) => element.id == event.id);
      Student oldStudent = state.students![oldIndex];
      state.students![oldIndex] = event.updatedStudent;
      repository.updateStudent(event.updatedStudent, oldStudent.id!);
      emit(StudentUpdated(students: state.students!));
    }catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      OnError(message: e.toString());
    }
  }

  void _deleteStudent(DeleteStudent event, Emitter<StudentsState> emit) {
    try{
      state.students!.removeWhere((element) => element.id == event.id);
      repository.deleteStudent(event.id);
      emit(StudentUpdated(students: state.students!));
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      OnError(message: e.toString());
    }
  }

  void _getStudent(GetStudents event, Emitter<StudentsState> emit)  async{
    state.students = await repository.getStudents();
  }

  void _getDetailStudent(GetDetailStudent event, Emitter<StudentsState> emit) {
     state.selectedStudent = state.students!.singleWhere((element) => element.id == event.id);
     //emit(SelectedStudentUpdated(student: state.selectedStudent!));
  }
}