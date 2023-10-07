import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratama_form_field_factory/pratama_form_field_factory.dart';
import 'package:spisy10/View/Pages/student_form/student_presenter.dart';
import 'package:spisy10/View/Pages/student_form/student_view.dart';
import 'package:spisy10/View/widgets/buttons/pratama_icon_button.dart';
import 'package:spisy10/bloc/date_form/date_form_bloc.dart';
import 'package:spisy10/bloc/date_form/date_form_state.dart';
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
       presenter.dispose();
        return false;
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<StudentsBloc>(
            create: (context) => studentBloc
          ),
          BlocProvider<DateFormBloc>(
            create: (context) => presenter.dateFormBloc
          )
        ],
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
                  onTap: presenter.dispose,
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
                  studentBloc.add(GetStudents());
                  presenter.dispose();
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

                        BlocListener<DateFormBloc,DateFormState>(
                          listenWhen:(prev,current){
                          return current is SuccessCounted;
                          },
                          listener: (context, state){
                              presenter.umurController.value = TextEditingValue(
                                text: presenter.formattedUmur
                              );
                          },
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: "Umur" 
                            ),
                            controller: presenter.umurController,
                            onChanged: presenter.onTextNameChanged,
                            validator: presenter.onTextNameValidation,
                          ),
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