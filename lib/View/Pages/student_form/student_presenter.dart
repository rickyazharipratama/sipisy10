import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:pratama_form_field_factory/pickers/pratama_date_time_picker/pratama_date_time_picker_presenter.dart';
import 'package:pratama_form_field_factory/radios/models/pratama_radio_model.dart';
import 'package:pratama_form_field_factory/radios/pratama_radio_presenter.dart';
import 'package:pratama_form_field_factory/text_field/pratama_text_field_presenter.dart';
import 'package:spisy10/View/Pages/student_form/student_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/bloc/date_form/date_form_bloc.dart';
import 'package:spisy10/bloc/date_form/date_form_event.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';
import 'package:spisy10/bloc/students/students_event.dart';
import 'package:spisy10/models/student.dart';

class StudentPresenter extends BasePresenter{

  final StudentView view;
  Student? existingStudent;
  late PratamaDateTimePickerPresenter dateTimePresenter;
  late PratamaRadioPresenter radioPresenter;
  late PratamaTextFieldPresenter nameTextPresenter;
  late PratamaTextFieldPresenter umurTextPresenter;
  late PratamaTextFieldPresenter alamatTextPresenter;
  
  late DateFormBloc _dateFormBloc;
  late StudentsBloc _studentsBloc;

  StudentPresenter({required this.view, this.existingStudent}){
    existingStudent ??= Student();
    _dateFormBloc = DateFormBloc();
    _studentsBloc = StudentsBloc();
    nameTextPresenter = PratamaTextFieldPresenter(
      label: "Nama",
      keyboardType: TextInputType.name,
      val: existingStudent!.name,
      validator: onTextNameValidation,
    );
    dateTimePresenter = PratamaDateTimePickerPresenter(
      label: "Tanggal Lahir",
      initialDate: existingStudent?.date,
      locale: DateTimePickerLocale.id,
      maxDateTime: DateTime.now(),
      validator: onTglLahirValidation,
      onSelectedDate: onDateSelected
    );

    umurTextPresenter = PratamaTextFieldPresenter(
      label: "Umur",
      isReadOnly: true,
      val: existingStudent?.age.toString()
    );
    radioPresenter = PratamaRadioPresenter(
      groups: [
        PratamaRadioModel(value: true, title: "Pria"),
        PratamaRadioModel(value: false, title: "Wanita")
      ],
      label: "Jenis Kelamin",
      validator:onGenderValidation,
      selectedValue: existingStudent != null ?  existingStudent!.gender : null,
    );
    alamatTextPresenter = PratamaTextFieldPresenter(
      label: "Alamat",
      keyboardType: TextInputType.streetAddress,
      maxLine: 3,
      val: existingStudent?.address,
      validator: onAlamatValidation
    );
  }


  void onCLoseTapped(){
    dispose();
  }

  void onDateSelected(){
    int diff = dateTimePresenter.diffYearDuration;
    umurTextPresenter.val = diff.toString(); 
    _dateFormBloc.add(CountingDifferenceAge(diff: diff));
  }

  String? get formattedUmur{
    if(umurTextPresenter.val != null){
      String umr =  umurTextPresenter.val!;
        return "$umr Tahun";
    }
    return null;
  }


  DateFormBloc get dateFormBloc => _dateFormBloc;
  StudentsBloc get studentsBloc => _studentsBloc;

  void onTextNameChanged(String val){
    existingStudent!.name = val;
  }
  String? onTextNameValidation(String? val){
    if(val != null){
      if(val.isEmpty){
        return "Silakan masukkan nama murid.";
      }
    }
    return null;
  }

  String? onTglLahirValidation(String? val){
    if(val != null){
      if(val.isEmpty){
        return "Silakan pilih tanggal lahir murid.";
      }
    }
    return null;
  }

  String? onGenderValidation(dynamic val){
    if(val == null){
      return "silakan pilih jenis kelamin murid";
    }
    return null;
  }

  String? onAlamatValidation(String? val){
    if(val != null){
      if(val.isEmpty){
        return "Silakan masukkan alamat murid.";
      }
    }
    return null;
  }

  @override
  void dispose() {
    if(!dateFormBloc.isClosed){
      print("closing bloc");
      dateFormBloc.close();
      studentsBloc.close();
    }
    super.dispose();
    view.close();
  }

  onAddStudents(){
    Student newStudent = Student(
      name: nameTextPresenter.textController.value.text,
      date: dateTimePresenter.selectedDate,
      age: int.tryParse(umurTextPresenter.val!),
      gender: radioPresenter.selectedValue,
      address: alamatTextPresenter.textController.value.text
    );
    studentsBloc.add(AddStudent(std: newStudent));
  }
  onUpdateStudents(){
    Student updateStudent = Student(
      id: existingStudent!.id,
      name: nameTextPresenter.textController.value.text,
      date: dateTimePresenter.selectedDate,
      age: int.tryParse(umurTextPresenter.val!),
      gender: radioPresenter.selectedValue,
      address: alamatTextPresenter.textController.value.text
    );
    studentsBloc.add(UpdateStudent(updatedStudent: updateStudent, id: updateStudent.id!));
  }
}