import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:pratama_form_field_factory/pickers/pratama_date_time_picker/pratama_date_time_picker_presenter.dart';
import 'package:spisy10/View/Pages/student_form/student_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/bloc/date_form/date_form_bloc.dart';
import 'package:spisy10/bloc/date_form/date_form_event.dart';
import 'package:spisy10/models/student.dart';

class StudentPresenter extends BasePresenter{

  final StudentView view;
  Student? existingStudent;
  late PratamaDateTimePickerPresenter dateTimePresenter;
  late DateFormBloc _dateFormBloc;
  late TextEditingController _umurController;
  int _umur = -1;

  StudentPresenter({required this.view, this.existingStudent}){
    existingStudent ??= Student();
    _dateFormBloc = DateFormBloc();
    dateTimePresenter = PratamaDateTimePickerPresenter(
      initialDate: existingStudent!.date != null ? DateTime.fromMillisecondsSinceEpoch(int.tryParse(existingStudent!.date!)!):null,
      locale: DateTimePickerLocale.id,
      maxDateTime: DateTime.now(),
      validator: onTextNameValidation,
      onSelectedDate: onDateSelected
    );
    _umurController = TextEditingController();
  }


  void onCLoseTapped(){
    dispose();
  }

  void onDateSelected(){
    _umur = dateTimePresenter.diffYearDuration;
    _dateFormBloc.add(CountingDifferenceAge(diff: _umur));
  }

  String get formattedUmur{
    if(_umur >= 0 ){
      return "$_umur Tahun";
    }
    return "";
  }


  TextEditingController get umurController => _umurController;

  DateFormBloc get dateFormBloc => _dateFormBloc;

  void onTextNameChanged(String val){
    existingStudent!.name = val;
  }
  String? onTextNameValidation(String? val){
    if(val != null){
      if(val.isEmpty){
        return "silakan masukkan nama murid";
      }
    }
    return null;
  }

  @override
  void dispose() {
    if(!dateFormBloc.isClosed){
      print("closing bloc");
      dateFormBloc.close();
    }
    super.dispose();
    view.close();
  }
}