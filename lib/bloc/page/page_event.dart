import 'package:flutter/widgets.dart';

@immutable
abstract class PageEvent{

}

class ChangingPage extends PageEvent{
  final int index;

  ChangingPage({required this.index});
}
