import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/factory/bloc/date_form/date_form_bloc_controller.dart';
import 'package:spisy10/factory/bloc/date_form/date_form_event.dart';
import 'package:spisy10/factory/bloc/date_form/date_form_state.dart';
import 'package:spisy10/factory/impls/bloc/date_form/date_form_bloc_controller_impl.dart';

class DateFormBloc extends Bloc<DateFormEvent,DateFormState>{
  late DateFormBlocController controller;
  DateFormBloc() : super(InitDateForm(diffAge: -1)){
    controller = DateFormBlocControllerImpl();
    on<CountingDifferenceAge> (controller.countingAge);
  }
}