import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/Pages/LandingPage/LandingPage.dart';
import 'package:spisy10/bloc/authentication/authentication_bloc.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';
import 'package:spisy10/bloc/students/students_event.dart';

class SpisyApp extends StatelessWidget {
  const SpisyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Spisy10",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<StudentsBloc>(
            create: (context) => StudentsBloc()..add(GetStudents()),
          ),
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(),)
        ],
        child: LandingPage(),
      ),
    );
  }
}