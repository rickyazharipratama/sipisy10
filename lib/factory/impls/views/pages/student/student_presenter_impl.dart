import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:pratama_form_field_factory/pickers/pratama_date_time_picker/pratama_date_time_picker_presenter.dart';
import 'package:pratama_form_field_factory/radios/models/pratama_radio_model.dart';
import 'package:pratama_form_field_factory/radios/pratama_radio_presenter.dart';
import 'package:pratama_form_field_factory/text_field/pratama_text_field_presenter.dart';
import 'package:spisy10/View/Pages/student_form/student_presenter.dart';
import 'package:spisy10/View/Pages/student_form/student_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/factory/bloc/date_form/date_form_bloc.dart';
import 'package:spisy10/factory/bloc/date_form/date_form_event.dart';
import 'package:spisy10/factory/bloc/students/students_bloc.dart';
import 'package:spisy10/factory/impls/bloc/students/event/add_student_impl.dart';
import 'package:spisy10/factory/impls/bloc/students/event/update_student_impl.dart';
import 'package:spisy10/warehouse/models/student.dart';

class StudentPresenterImpl extends BasePresenter implements StudentPresenter{

  final StudentView view;
  Student? existingStudent;
  late PratamaDateTimePickerPresenter dateTimePresenter;
  late PratamaRadioPresenter radioPresenter;
  late PratamaTextFieldPresenter nameTextPresenter;
  late PratamaTextFieldPresenter umurTextPresenter;
  late PratamaTextFieldPresenter alamatTextPresenter;

  late DateFormBloc _dateFormBloc;
  late StudentsBloc _studentsBloc;

  StudentPresenterImpl({required this.view, this.existingStudent}){
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

  void onDateSelected(){
    int diff = dateTimePresenter.diffYearDuration;
    umurTextPresenter.val = diff.toString(); 
    _dateFormBloc.add(CountingDifferenceAge(diff: diff));
  }

   void onTextNameChanged(String val){
    existingStudent!.name = val;
  }

  @override
  String? get formattedUmur{
    if(umurTextPresenter.val != null){
      String umr =  umurTextPresenter.val!;
        return "$umr Tahun";
    }
    return null;
  }

  @override
   void onCLoseTapped(){
    dispose();
  }

  @override
  void onAddStudents(){
    Student newStudent = Student(
      name: nameTextPresenter.textController.value.text,
      date: dateTimePresenter.selectedDate,
      age: int.tryParse(umurTextPresenter.val!),
      gender: radioPresenter.selectedValue,
      address: alamatTextPresenter.textController.value.text
    );
    studentsBloc.add(AddStudentImpl(std: newStudent));
  }

  @override
  void onUpdateStudents(){
    Student updateStudent = Student(
      id: existingStudent!.id,
      name: nameTextPresenter.textController.value.text,
      date: dateTimePresenter.selectedDate,
      age: int.tryParse(umurTextPresenter.val!),
      gender: radioPresenter.selectedValue,
      address: alamatTextPresenter.textController.value.text
    );
    studentsBloc.add(UpdateStudentImpl(updatedStudent: updateStudent));
  }
  
  @override
  PratamaTextFieldPresenter get currentAlamatTextPresenter => alamatTextPresenter;
  
  @override
  PratamaDateTimePickerPresenter get currentDateTimePresenter => dateTimePresenter;
  
  @override
  Student? get currentExistingStudent => existingStudent;
  
  @override
  PratamaRadioPresenter get currentGenderPresenter => radioPresenter;
  
  @override
  PratamaTextFieldPresenter get currentNameTextPresenter => nameTextPresenter;
  
  @override
  PratamaTextFieldPresenter get currentUmurTextPresenter => umurTextPresenter;
  
  @override
  DateFormBloc get dateFormBloc => _dateFormBloc;
  
  @override
  StudentsBloc get studentsBloc => _studentsBloc;
}