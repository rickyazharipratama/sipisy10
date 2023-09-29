import 'package:spisy10/models/student.dart';
import 'package:spisy10/utils/studentDAO.dart';

class StudentRepository{
  final stdDao = StudentDAO();

  Future getStudent({String? query}) => stdDao.getStudents(query: query);

  Future getUser(int id) => stdDao.getStudent(id: id);

  Future createUser(Student std) => stdDao.createStudent(std);

  Future updateUser(Student std) => stdDao.updateStudent(std);

  Future deleteUser(int id) => stdDao.deleteStudent(id);
}