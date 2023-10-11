import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/Pages/splash/splash.dart';
import 'package:spisy10/bloc/authentication/authentication_bloc.dart';

class SpisyApp extends StatelessWidget {
  const SpisyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Spisy10",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(),
        child: const Splash(),
      )
    );
  }
}