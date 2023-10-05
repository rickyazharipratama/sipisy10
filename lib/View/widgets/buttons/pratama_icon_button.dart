import 'package:flutter/material.dart';

class PratamaIconButton extends StatelessWidget {

  final  Function()? onTap;
  final double? size;
  final Color? color;
  final IconData icon;

  const PratamaIconButton({super.key, required this.icon, this.onTap, this.size, this.color});


  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap??(){},
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20) 
        ),
        child: Center(
          child: Icon(
            icon,
            size: size ?? 30,
            color: color ?? const Color(0xFF666666)
          )
        ),
      )
    );
  }
}