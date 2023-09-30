import 'package:spisy10/models/Student.dart';
import 'package:spisy10/utils/StudentDAO.dart';

class StudentRepository{
  final stdDao = StudentDAO();

  Future getStudent({String? query}) => stdDao.getStudents(query: query);

  Future getUser(int? id) => stdDao.getStudent(id: id);

  Future createUser(Student std) => stdDao.createStudent(std);

  Future updateUser(Student stud) => stdDao.updateStudent(stud);

  Future deleteUser(int id) => stdDao.deleteStudent(id);
}