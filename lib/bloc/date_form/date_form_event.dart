import 'package:flutter/foundation.dart';

@immutable
abstract class DateFormEvent{

}

class CountingDifferenceAge extends DateFormEvent{
  final int diff;
  CountingDifferenceAge({required this.diff});
}