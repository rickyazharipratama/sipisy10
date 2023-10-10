import 'package:flutter/material.dart';
import 'package:pratama_form_field_factory/buttons/pratama_primary_button.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Positioned.fill(
          child: Center(
            child: Icon(
              Icons.logout,
              color: const Color(0xFFf3f3f3),
              size: MediaQuery.of(context).size.width * 3 /4
            ),
          ),
        ),

        Positioned.fill(
          child:  Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const Padding(
                    padding:  EdgeInsets.only(
                      bottom: 50
                    ),
                    child: Text(
                      "Dengan ini saya dalam keadaan sadar untuk keluar dari halaman utama.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 95, 53, 53),
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                      ),
                    ),
                  ) ,

                  PratamaPrimaryButton(
                    onTap: (){

                    }, 
                    text: "Keluar"
                  )
                ],
              )
            ),
          )
        )

      ],
    );
  }
}