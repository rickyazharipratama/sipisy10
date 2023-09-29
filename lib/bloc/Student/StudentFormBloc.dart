import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:spisy10/bloc/Student/StudentFormEvent.dart';
import 'package:spisy10/models/Student.dart';
import 'package:spisy10/utils/StudentRepository.dart';
import './StudentBloc.dart';

class StudentFormBloc extends Bloc<StudentFromEvent, StudentFormState> {
  final _studentRepository = StudentRepository();

  StudentFormBloc() : super(InitialUserFormState());

  @override
  Stream<StudentFormState> mapEventToState(StudentFromEvent event) async* {
    yield Loading();
    if (event is GetUser) {
      try {
        yield Loaded(
            user: event.student!.id == null
                ? Student()
                : await _studentRepository.getUser(event.student!.id));
      } catch (e) {
        yield Error(errorMessage: e.toString());
      }
    } else if (event is BackEvent) {
      yield InitialUserFormState();
    } else if (event is CreateUser) {
      try {
        await _studentRepository.createUser(event.student);
        yield Success(successMessage: event.student.name + ' created');
      } catch (e) {
        yield Error(errorMessage: e.toString());
      }
    } else if (event is UpdateUser) {
      try {
        await _studentRepository.updateUser(event.student);
        yield Success(successMessage: event.student!.name !+ ' updated');
      } catch (e) {
        yield Error(errorMessage: e.toString());
      }
    }
  }
}