import 'package:spisy10/factory/bloc/students/students_event.dart';
import 'package:spisy10/warehouse/models/student.dart';
import 'package:spisy10/warehouse/repository_collection.dart';

class AddStudentImpl extends StudentsEvent implements AddStudent{
  final Student std;
  AddStudentImpl({required this.std});
  
  @override
  void insertIntoList(List<Student> students) {
    students.add(std);
  }
  
  @override
  Future<int> insertIntoRepo() async{
    return await RepositoryCollection.repository.student.createStudent(std);
  }
}
