import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20) 
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: Color(0xFF666666)
          )
        ),
      )
    );
  }
}