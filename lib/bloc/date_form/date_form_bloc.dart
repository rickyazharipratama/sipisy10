import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/bloc/date_form/date_form_event.dart';
import 'package:spisy10/bloc/date_form/date_form_state.dart';

class DateFormBloc extends Bloc<DateFormEvent,DateFormState>{

  DateFormBloc() : super(InitDateForm(diffAge: -1)){
    on<CountingDifferenceAge> (_countingAge);
  }

  
  FutureOr<void> _countingAge(CountingDifferenceAge event, Emitter<DateFormState> emit) {
    print("called");
    emit(SuccessCounted(diffAge: event.diff));
  }
}