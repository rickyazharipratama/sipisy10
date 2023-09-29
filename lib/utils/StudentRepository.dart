import 'package:spisy10/models/student.dart';
import 'package:spisy10/utils/studentDAO.dart';

class StudentRepository{
  final stdDao = StudentDAO();

  Future getStudent({String? query}) => stdDao.getStudents(query: query);

  Future getUser(int? id) => stdDao.getStudent(id: id);

  Future createUser(Student stud) => stdDao.createStudent(stud);

  Future updateUser(Student? stud) => stdDao.updateStudent(stud);

  Future deleteUser(int? id) => stdDao.deleteStudent(id);
}