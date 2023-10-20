import 'package:spisy10/factory/bloc/students/students_event.dart';
import 'package:spisy10/warehouse/models/student.dart';
import 'package:spisy10/warehouse/repository_collection.dart';

class GetStudentsImpl extends StudentsEvent implements GetStudents{

  @override
  Future<List<Student>?> get savedStudent async => 
    await RepositoryCollection.repository.student.getStudents();

}
