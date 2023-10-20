import 'package:spisy10/warehouse/models/student.dart';
import 'package:spisy10/warehouse/database/daos/base_dao.dart';
import 'package:spisy10/warehouse/database/daos/student_dao.dart';

class StudentDAOImpl extends BaseDAO implements StudentDAO{
  
  StudentDAOImpl({required super.table});

  @override
  Future<List<Student>?> getStudents() async{
    var result = await connector.then((value) => value!.query(table));
    return result.map((e) => Student.fromJson(e)).toList();
  }

  @override
  Future<Student?> getStudent(int id) async{
     List<Map<String,dynamic>>? result = await connector.then((value) => 
      value!.query(
        table, 
        where: "id = ?", 
        whereArgs: [id]
      )
    );
    if(result != null){
      return Student.fromJson(result[0]);
    }
    return null;
  }

  @override
  Future<int> createStudent(Student student) async{
    return await connector.then((value) => value!.insert(table, student.toJson()));
  }

  @override
  Future<int> updateStudent(Student student) async{
    return await connector.then((value) => value!.update(table, student.toJson(),where: "id = ?", whereArgs: [student.id]));
  }

  @override
  Future<int> deleteStudent(int id) async{
    return await connector.then((value) => value!.delete(table, where: "id= ?", whereArgs: [id]));
  }
}

