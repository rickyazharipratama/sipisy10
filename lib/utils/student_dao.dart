import 'package:spisy10/models/student.dart';
import 'package:spisy10/utils/database_provider.dart';

class StudentDAO{
  final dbProvider = DatabaseProvider.db;

  Future<List<Student>> getStudents({List<String>? columns, String? query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>>? result;
    if (query != null && query != '') {
      if (query.isNotEmpty) {
        result = await db!.query(studentTable,
            columns: columns, where: 'name LIKE ?', whereArgs: ['%$query%']);
      }
    } else {
      result = await db!.query(studentTable, columns: columns);
    }

    List<Student> students = result!.isNotEmpty
        ? result.map((student) => Student.fromJson(student)).toList()
        : [];
    return students;
  }

  Future<Student?> getStudent({List<String>? columns, int? id}) async {
    final db = await dbProvider.database;

    var result = await db!.query(studentTable, columns: columns, where: 'id = ?', whereArgs: [id]);

    List<Student> students = result.isNotEmpty ? result.map((student) => Student.fromJson(student)).toList() : [];
    Student? student = students.isNotEmpty ? students[0] : null;

    return student;
  }

  Future<int> createStudent(Student student) async {
    final db = await dbProvider.database;

    var result = await db!.insert(studentTable, student.toJson());

    return result;
  }

  Future<int> updateStudent(Student student, int id) async {
    final db = await dbProvider.database;

    var result = await db!.update(studentTable, student.toJson(),
        where: 'id = ?', whereArgs: [id]);

    return result;
  }

  Future<int> deleteStudent(int id) async {
    final db = await dbProvider.database;

    var result = await db!.delete(studentTable, where: 'id = ?', whereArgs: [id]);

    return result;
  }
}