import 'package:pratama_form_field_factory/pickers/pratama_date_time_picker/pratama_date_time_picker_presenter.dart';
import 'package:pratama_form_field_factory/radios/pratama_radio_presenter.dart';
import 'package:pratama_form_field_factory/text_field/pratama_text_field_presenter.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/factory/bloc/date_form/date_form_bloc.dart';
import 'package:spisy10/factory/bloc/students/students_bloc.dart';
import 'package:spisy10/warehouse/models/student.dart';

abstract class StudentPresenter extends BasePresenter{

  
  DateFormBloc get dateFormBloc;
  StudentsBloc get studentsBloc;

  PratamaDateTimePickerPresenter get currentDateTimePresenter;
  PratamaRadioPresenter get currentGenderPresenter;
  PratamaTextFieldPresenter get currentNameTextPresenter;
  PratamaTextFieldPresenter get currentUmurTextPresenter;
  PratamaTextFieldPresenter get currentAlamatTextPresenter;
  String? get formattedUmur;
  Student? get currentExistingStudent;

  void onCLoseTapped();
  void onAddStudents();
  void onUpdateStudents();
}