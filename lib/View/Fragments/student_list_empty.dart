import 'package:flutter/material.dart';

class StudentListEmpty extends StatelessWidget {
  const StudentListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [

        Positioned.fill(
          child: Center(
            child: Icon(
              Icons.people_alt_outlined,
              color: Color(0xFFf3f3f3),
              size: 70
            ),
          ),
        ),

        Positioned.fill(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15
              ),
              child: Text(
                "Silakan masukan data murid.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 95, 53, 53),
                  fontWeight: FontWeight.w300,
                  fontSize: 13
                ),
              ) ,
            ),
          )
        )
      ],
    );
  }
}