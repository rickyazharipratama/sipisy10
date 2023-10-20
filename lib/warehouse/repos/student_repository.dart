import 'package:spisy10/warehouse/models/student.dart';

abstract class StudentRepository{
  

  Future<List<Student>?> getStudents();
  Future getStudent(int id);
  Future<int> createStudent(Student std);
  Future<int> updateStudent(Student stud);
  Future deleteStudent(int id);
}
