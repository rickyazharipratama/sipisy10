abstract class DateFormState{
  int  diffAge = -1;
  DateFormState({required this.diffAge});
}

class InitDateForm extends DateFormState{
  InitDateForm({required super.diffAge});
}

class SuccessCounted extends DateFormState{
  SuccessCounted({required super.diffAge});
}