import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratama_form_field_factory/Utils/pratama_Constants.dart';
import 'package:pratama_form_field_factory/builders/form_builder/pratama_form_builder_model.dart';
import 'package:pratama_form_field_factory/builders/form_builder/pratama_form_custom_field.dart';
import 'package:pratama_form_field_factory/buttons/pratama_primary_button.dart';
import 'package:pratama_form_field_factory/pratama_form_field_factory.dart';
import 'package:spisy10/View/Pages/student_form/student_presenter.dart';
import 'package:spisy10/View/Pages/student_form/student_view.dart';
import 'package:spisy10/View/widgets/buttons/pratama_icon_button.dart';
import 'package:spisy10/View/widgets/components/loading.dart';
import 'package:spisy10/bloc/date_form/date_form_bloc.dart';
import 'package:spisy10/bloc/date_form/date_form_state.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';
import 'package:spisy10/bloc/students/students_state.dart';
import 'package:spisy10/models/student.dart';

class StudentForm extends StatelessWidget {
  final Student? existingStudent;
  final bool? isUpdating;
  StudentForm({super.key, this.existingStudent, this.isUpdating = false});
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
            create: (context) => presenter.studentsBloc
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
            body: BlocListener<StudentsBloc,StudentsState>(
              listenWhen: (prev,current){
                return current is StudentUpdated;
              },
              listener: (context, state) {
                Future.delayed(
                 const  Duration(milliseconds: 700),
                 (){
                  print("add success");
                  presenter.dispose();
                 }
                ).whenComplete(() => 
                  Navigator.of(context).pop(1)
                );
              },
              child: PratamaFormBuilder(
                formKey:formKey,
                fields: [
                  PratamaFormBuilderModel(
                    field: PratamaFormField.textField,
                    presenter: presenter.nameTextPresenter
                  ),
                  PratamaFormBuilderModel(
                    field:PratamaFormField.dateTIemPicker,
                    presenter: presenter.dateTimePresenter
                  ),
                  PratamaFormBuilderModel(
                    field: PratamaFormField.radio,
                    presenter: presenter.radioPresenter
                  ),
                  PratamaFormBuilderModel(
                    field: PratamaFormField.textField,
                    presenter: presenter.alamatTextPresenter
                  )
                ],
                customField: [
                  PratamaFormCustomField(
                    topOf: 2, 
                    field:  BlocListener<DateFormBloc,DateFormState>(
                      listenWhen:(prev,current){
                        return current is SuccessCounted;
                      },
                      listener: (context, state){
                        presenter.umurTextPresenter.textController.value  = TextEditingValue(
                          text: presenter.formattedUmur!
                        );
                      },
                      child: PratamaTextField(
                        presenter: presenter.umurTextPresenter,
                      ),
                    ),
                  ),
                  PratamaFormCustomField(
                    topOf: 4, 
                    field: Padding(
                      padding: const EdgeInsets.fromLTRB(10,30.0,10,10),
                      child: PratamaPrimaryButton(
                        onTap: () async{
                          bool radioValidate = presenter.radioPresenter.validate();
                          if(formKey.currentState!.validate()&& radioValidate){
                            await showDialog(
                              context: context,
                              barrierDismissible: false,
                               builder: (context){
                                if(presenter.existingStudent!.id == null){
                                  presenter.onAddStudents();
                                }else{
                                  presenter.onUpdateStudents();
                                }
                                return const Loading(
                                  color:  Color.fromARGB(255, 204, 110, 200),
                                );
                               }
                            );
                          }
                        },
                        text: presenter.existingStudent!.id == null ? "Simpan" : "Perbaharui",
                      ),
                    )
                  )
                ],
              ),
            )
            
            
            
            
            // Form(
            //   key: formKey,
            //   child: BlocListener<StudentsBloc,StudentsState>(
            //     listenWhen: (prevState, state){
            //       return state is StudentUpdated;
            //     },
            //     listener: (context,state){
            //       studentBloc.add(GetStudents());
            //       presenter.dispose();
            //       Navigator.of(context).pop();
            //     },
            //     child: SingleChildScrollView(
            //       child: Container(
            //         padding: const EdgeInsets.symmetric(
            //           horizontal: 15,
            //           vertical: 10
            //         ),
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             PratamaTextField(
            //               presenter: presenter.nameTextPresenter
            //             ),
                      
            //             PratamaDateTimePicker(
            //               presenter: presenter.dateTimePresenter,
            //             ),

            //             BlocListener<DateFormBloc,DateFormState>(
            //               listenWhen:(prev,current){
            //               return current is SuccessCounted;
            //               },
            //               listener: (context, state){
            //                 presenter.umurTextPresenter.textController.value  = TextEditingValue(
            //                   text: presenter.formattedUmur!
            //                 );
            //               },
            //               child: PratamaTextField(
            //                 presenter: presenter.umurTextPresenter,
            //               ),
            //             ),

            //             PratamaRadio(
            //               presenter: presenter.radioPresenter,
            //               activeColor: const Color.fromARGB(255, 204, 110, 200),
            //             ),

            //             PratamaTextField(
            //               presenter: presenter.alamatTextPresenter
            //             ),

            //             Padding(
            //               padding: const EdgeInsets.fromLTRB(10,30.0,10,10),
            //               child: InkWell(
            //                 onTap: (){
            //                   bool radioValidate = presenter.radioPresenter.validate();
            //                   if(formKey.currentState!.validate()&& radioValidate){
            //                     print("valid");
            //                   }
            //                 },
            //                 child: Container(
            //                   decoration: const BoxDecoration(
            //                     borderRadius: BorderRadius.all(Radius.circular(5)),
            //                     color:  Color.fromARGB(255, 204, 110, 200),
            //                   ),
            //                   padding: const EdgeInsets.symmetric(
            //                     vertical: 15
            //                   ),
            //                   child: const Center(
            //                     child: Text(
            //                       "Simpan",
            //                       style: TextStyle(
            //                         color: Colors.white,
            //                         fontSize: 18,
            //                         fontWeight: FontWeight.w500,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ),
        )
      )
    );
  }
}