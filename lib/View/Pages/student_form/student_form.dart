import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:pratama_form_field_factory/pratama_form_field_factory.dart';
import 'package:spisy10/View/Pages/student_form/student_presenter.dart';
import 'package:spisy10/View/Pages/student_form/student_view.dart';
import 'package:spisy10/View/widgets/buttons/pratama_icon_button.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';
import 'package:spisy10/bloc/students/students_event.dart';
import 'package:spisy10/bloc/students/students_state.dart';
import 'package:spisy10/models/student.dart';

class StudentForm extends StatelessWidget {
  final Student? existingStudent;
  final bool? isUpdating;
  final StudentsBloc studentBloc;
  StudentForm({super.key, this.existingStudent, this.isUpdating = false, required this.studentBloc});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    final StudentPresenter presenter = StudentPresenter(view: StudentView(context: context), existingStudent: existingStudent);
    return WillPopScope(
      onWillPop: () async{
        Navigator.of(context).pop();
        return false;
      },
      child: BlocProvider(
        create: (context) => studentBloc,
        child: Builder(
          builder: (context) => Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 204, 110, 200),
              elevation: 2,
              centerTitle: false,
              actions: [
                PratamaIconButton(
                  icon: Icons.close,
                  onTap: presenter.onCLoseTapped,
                  color: Colors.white,
                )
              ],
              title: const Text(
                "Student"
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            body: Form(
              key: formKey, 
              child: BlocListener<StudentsBloc,StudentsState>(
                listenWhen: (prevState, state){
                  return state is StudentUpdated;
                },
                listener: (context,state){
                  BlocProvider.of<StudentsBloc>(context).add(GetStudents());
                  Navigator.of(context).pop();
                },
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: "Nama" 
                          ),
                          initialValue: presenter.existingStudent!.name??"",
                          onChanged: presenter.onTextNameChanged,
                          validator: presenter.onTextNameValidation,
                        ),
                        
                        PratamaDateTimePicker(
                          label: "Tanggal Lahir", 
                          presenter: presenter.dateTimePresenter,
                        ),

                        TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: "Umur" 
                          ),
                          initialValue: presenter.existingStudent!.name??"",
                          onChanged: presenter.onTextNameChanged,
                          validator: presenter.onTextNameValidation,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      )
    );
  }
}