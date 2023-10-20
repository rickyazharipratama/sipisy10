import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratama_form_field_factory/buttons/pratama_primary_button.dart';
import 'package:spisy10/View/Fragments/logout/logout_presenter.dart';
import 'package:spisy10/View/Fragments/logout/logout_view.dart';
import 'package:spisy10/View/widgets/components/loading.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_bloc.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_state.dart';
import 'package:spisy10/factory/impls/views/fragments/logout/logout_presenter_impl.dart';
import 'package:spisy10/factory/impls/views/fragments/logout/logout_view_impl.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});


  @override
  Widget build(BuildContext context) {
    final LogoutPresenter presenter = LogoutPresenterImpl(
      view: LogoutViewImpl(context: context), 
      authBloc: BlocProvider.of<AuthenticationBloc>(context)
    );
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

                  BlocListener<AuthenticationBloc,AuthenticationState>(
                    listenWhen: (previous, current) => current is NoActiveUser || current is ActiveUserDeleted,
                    listener: (context, state) {
                      Navigator.of(context).pop();
                      presenter.currentView.navigateIntoLoginPage();
                    },
                    child: PratamaPrimaryButton(
                      onTap: () async{
                        await showDialog(
                        context: context, 
                        barrierDismissible: false,
                        builder: (context){
                           Future.delayed(
                            const Duration(milliseconds: 799),
                            (){}
                          ).whenComplete(() => presenter.logoutUser());
                          return const Loading(); 
                        });
                      }, 
                      text: "Keluar"
                    ),
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