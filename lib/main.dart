import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/spisy.dart';
import 'package:spisy10/bloc/bloc_delegate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocDelegate();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const SpisyApp());
  });
}
