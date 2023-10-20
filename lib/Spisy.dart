import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/Pages/splash/splash.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_bloc.dart';

class SpisyApp extends StatelessWidget {
  const SpisyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(),
      child: MaterialApp(
        title: "Spisy10",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
        home: const Splash(),
      )
    );
  }
}