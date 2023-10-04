import 'package:flutter/foundation.dart';

class Log{
  Log(Object? obj){
    if (kDebugMode) {
      print(obj);
    }
  }
}

