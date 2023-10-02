import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';
import 'package:spisy10/bloc/students/students_event.dart';
import 'package:spisy10/models/student.dart';

class StudentItemList extends StatelessWidget {
  final Student student;

  const StudentItemList({super.key, 
    required this.student
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(student.name!),
      subtitle: Text("${student.gender!}, ${student.age!}  Tahun"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: (){
              
            },
            icon:const Icon(
              Icons.update,
              size: 25,
              color: Colors.black54,
            )
          ),
          IconButton(
            onPressed: ()=> BlocProvider.of<StudentsBloc>(context)..add(DeleteStudent(id: student.id!)), 
            icon: const Icon(
              Icons.delete,
              size: 25,
              color: Colors.black54,
            )
          )         
        ],
      ),
    );
  }
}