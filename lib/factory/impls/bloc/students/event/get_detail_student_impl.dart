import 'package:spisy10/factory/bloc/students/students_event.dart';
import 'package:spisy10/warehouse/models/student.dart';

class GetDetailStudentImpl extends StudentsEvent implements GetDetailStudent{

  final int id;
  GetDetailStudentImpl({required this.id});
  
  @override
  Student? retrieveSelectedStudentFromList(List<Student> students) =>
    students.singleWhere((element) => element.id == id);  
}
