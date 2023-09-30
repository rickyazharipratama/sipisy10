import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/bloc/Student/Student_Form_Event.dart';
import 'package:spisy10/bloc/Student/Student_Form_State.dart';
import 'package:spisy10/models/Student.dart';
import 'package:spisy10/utils/StudentRepository.dart';

class StudentFormBloc extends Bloc<StudentFormEvent, StudentFormState> {
  final _studentRepository = StudentRepository();

  StudentFormBloc() : super(InitialUserFormState());

  @override
  Stream<StudentFormState> onEvent(StudentFormEvent event) async* {
    super.onEvent(event);
    yield Loading();
    if (event is GetUser) {
      try {
        yield Loaded(
            user: event.student.id == null
                ? Student()
                : await _studentRepository.getUser(event.student.id));
      } catch (e) {
        yield Error(errorMessage: e.toString());
      }
    } else if (event is BackEvent) {
      yield InitialUserFormState();
    } else if (event is CreateUser) {
      try {
        await _studentRepository.createUser(event.student);
        yield Success(successMessage: event.student.name !+ ' created');
      } catch (e) {
        yield Error(errorMessage: e.toString());
      }
    } else if (event is UpdateUser) {
      try {
        await _studentRepository.updateUser(event.student);
        yield Success(successMessage: event.student.name !+ ' updated');
      } catch (e) {
        yield Error(errorMessage: e.toString());
      }
    }
  }
}