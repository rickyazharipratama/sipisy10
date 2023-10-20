import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/factory/bloc/date_form/date_form_event.dart';
import 'package:spisy10/factory/bloc/date_form/date_form_state.dart';

abstract class DateFormBlocController{
  Future<void> countingAge(CountingDifferenceAge event, Emitter<DateFormState> emit);
}
