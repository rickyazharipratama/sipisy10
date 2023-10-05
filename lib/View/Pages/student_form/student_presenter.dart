import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:pratama_form_field_factory/pickers/pratama_date_time_picker/pratama_date_time_picker_presenter.dart';
import 'package:spisy10/View/Pages/student_form/student_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/models/student.dart';

class StudentPresenter extends BasePresenter{

  final StudentView view;
  Student? existingStudent;
  late PratamaDateTimePickerPresenter dateTimePresenter;

  StudentPresenter({required this.view, this.existingStudent}){
    existingStudent ??= Student();
    dateTimePresenter = PratamaDateTimePickerPresenter(
      initialDate: existingStudent!.date != null ? DateTime.fromMillisecondsSinceEpoch(int.tryParse(existingStudent!.date!)!):null,
      locale: DateTimePickerLocale.id,
      validator: onTextNameValidation
    );
  }


  void onCLoseTapped(){

  }

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
}