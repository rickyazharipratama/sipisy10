import 'package:spisy10/warehouse/models/student.dart';
import 'package:spisy10/warehouse/database/daos/base_dao.dart';

abstract class StudentDAO extends BaseDAO{

  StudentDAO({required super.table});

  Future<List<Student>?> getStudents();
  Future<Student?> getStudent(int id);
  Future<int> createStudent(Student student);
  Future<int> updateStudent(Student student);
  Future<int> deleteStudent(int id);
}
