import 'package:spisy10/factory/bloc/students/students_event.dart';
import 'package:spisy10/warehouse/models/student.dart';
import 'package:spisy10/warehouse/repository_collection.dart';

class UpdateStudentImpl extends StudentsEvent implements UpdateStudent{

  final Student updatedStudent;
  UpdateStudentImpl({
    required this.updatedStudent,
  });

  @override
  Future<int> updatingStudent() async{
    return await RepositoryCollection.repository.student.updateStudent(updatedStudent);
  }
}