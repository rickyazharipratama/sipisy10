import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:pratama_form_field_factory/pickers/pratama_date_time_picker/pratama_date_time_picker_presenter.dart';
import 'package:pratama_form_field_factory/radios/models/pratama_radio_model.dart';
import 'package:pratama_form_field_factory/radios/pratama_radio_list_tile/pratama_radio_list_tile_presenter.dart';
import 'package:pratama_form_field_factory/text_field/pratama_text_field_presenter.dart';
import 'package:spisy10/View/Pages/student_form/student_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/bloc/date_form/date_form_bloc.dart';
import 'package:spisy10/bloc/date_form/date_form_event.dart';
import 'package:spisy10/models/student.dart';

class StudentPresenter extends BasePresenter{

  final StudentView view;
  Student? existingStudent;
  late PratamaDateTimePickerPresenter dateTimePresenter;
  late PratamaRadioListTilePresenter radioListTilePresenter;
  late PratamaTextFieldPresenter nameTextPresenter;
  late PratamaTextFieldPresenter umurTextPresenter;
  late PratamaTextFieldPresenter alamatTextPresenter;
  late DateFormBloc _dateFormBloc;

  StudentPresenter({required this.view, this.existingStudent}){
    existingStudent ??= Student();
    _dateFormBloc = DateFormBloc();
    nameTextPresenter = PratamaTextFieldPresenter(
      label: "Nama",
      keyboardType: TextInputType.name,
      val: existingStudent!.name,
      validator: onTextNameValidation,
    );
    dateTimePresenter = PratamaDateTimePickerPresenter(
      initialDate: existingStudent!.date != null ? DateTime.fromMillisecondsSinceEpoch(int.tryParse(existingStudent!.date!)!):null,
      locale: DateTimePickerLocale.id,
      maxDateTime: DateTime.now(),
      validator: onTglLahirValidation,
      onSelectedDate: onDateSelected
    );
    umurTextPresenter = PratamaTextFieldPresenter(
      label: "Umur",
      isReadOnly: true,
      val: existingStudent?.age!= null ? "$existingStudent!.age Tahun" : null
    );
    radioListTilePresenter = PratamaRadioListTilePresenter(
      groups: [
        PratamaRadioModel(value: true, title: "Pria"),
        PratamaRadioModel(value: false, title: "Wanita")
      ],
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
    }
    super.dispose();
    view.close();
  }
}