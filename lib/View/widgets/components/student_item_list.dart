import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:spisy10/View/Pages/student_form/student_form.dart';
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
    String jenisKelamin = student.gender! ? "Pria" :  "wanita";
    final StudentsBloc studentsBloc = BlocProvider.of<StudentsBloc>(context);
    return ListTile(
      title: Text(student.name!),
      subtitle: Text("$jenisKelamin, ${student.age!}  Tahun"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () async{
              int? isUpdating = await Navigatorium.instance.push(
                context,
                child: StudentForm(
                  existingStudent: student,
                  isUpdating: true,
                )
              );
              if(isUpdating != null){
                 if(isUpdating == 1){
                   studentsBloc.add(InitializeStudent());
                 }
              }
            },
            icon:const Icon(
              Icons.update,
              size: 25,
              color: Colors.black54,
            )
          ),
          IconButton(
            onPressed: ()=> studentsBloc.add(DeleteStudent(id: student.id!)), 
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