
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/factory/bloc/students/student_bloc_controller.dart';
import 'package:spisy10/factory/bloc/students/students_event.dart';
import 'package:spisy10/factory/bloc/students/students_state.dart';
import 'package:spisy10/factory/impls/bloc/students/student_bloc_controller_impl.dart';

class StudentsBloc extends Bloc<StudentsEvent,StudentsState>{

  late StudentBlocController controller;
  StudentsBloc() : 
    super(StudentIntializing(students: [])){
      controller = StudentBlocControllerImpl(state: state);
      on<AddStudent>(controller.addStudent);
      on<UpdateStudent>(controller.updateStudent);
      on<DeleteStudent>(controller.deleteStudent);
      on<GetStudents>(controller.getStudent);
      on<GetDetailStudent>(controller.getDetailStudent);
      on<InitializeStudent> (controller.initializeStudent);
    }  
}