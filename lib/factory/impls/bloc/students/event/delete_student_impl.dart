import 'package:spisy10/factory/bloc/students/students_event.dart';
import 'package:spisy10/warehouse/models/student.dart';
import 'package:spisy10/warehouse/repository_collection.dart';

class DeleteStudentImpl extends StudentsEvent implements DeleteStudent{

  final int id;
  DeleteStudentImpl({required this.id});
  
  @override
  Future<int> deletingStudent() async{
    return await RepositoryCollection.repository.student.deleteStudent(id);
  }
  
  @override
  void removeFromList(List<Student> students) {
    students.removeWhere((element) => element.id == id);
  }
}