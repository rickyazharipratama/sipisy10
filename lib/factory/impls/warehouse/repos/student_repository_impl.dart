import 'package:spisy10/factory/impls/warehouse/database/dao/student_dao_impl.dart';
import 'package:spisy10/warehouse/models/student.dart';
import 'package:spisy10/warehouse/constant_collection.dart';
import 'package:spisy10/warehouse/database/daos/student_dao.dart';
import 'package:spisy10/warehouse/repos/student_repository.dart';

class StudentRepositoryImpl implements StudentRepository{

  final StudentDAO _dao = StudentDAOImpl(table: ConstantCollection.collection.table.student);

  @override
  Future<List<Student>?> getStudents() async =>  await _dao.getStudents();

  @override
  Future<Student?> getStudent(int id) async => await _dao.getStudent(id);

  @override
  Future<int> createStudent(Student student) async => await _dao.createStudent(student);

  @override
  Future<int> updateStudent(Student student) async => await _dao.updateStudent(student);

  @override
  Future<int> deleteStudent(int id) async => await _dao.deleteStudent(id);

}