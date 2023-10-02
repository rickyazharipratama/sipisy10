import 'package:flutter/material.dart';

class StudentListEmpty extends StatelessWidget {
  const StudentListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
        ),
        child: Text(
          "Silakan masukan data murid.",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}