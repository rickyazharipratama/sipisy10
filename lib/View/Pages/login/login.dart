import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratama_form_field_factory/Utils/pratama_Constants.dart';
import 'package:pratama_form_field_factory/builders/form_builder/pratama_form_builder_model.dart';
import 'package:pratama_form_field_factory/buttons/pratama_filled_secondary_button.dart';
import 'package:pratama_form_field_factory/pratama_form_field_factory.dart';
import 'package:spisy10/View/Pages/login/login_presenter.dart';
import 'package:spisy10/View/Pages/login/login_view.dart';
import 'package:spisy10/View/widgets/components/loading.dart';
import 'package:spisy10/bloc/authentication/authentication_bloc.dart';
import 'package:spisy10/bloc/authentication/authentication_state.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final LoginPresenter presenter = LoginPresenter(
      authBloc: BlocProvider.of<AuthenticationBloc>(context), 
      view: LoginView(context: context)
    );
    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 204, 110, 200),
                    Color.fromARGB(255, 213, 127, 209),
                    Color.fromARGB(255, 251, 209, 249)
                  ],
                  stops: [
                    0.1,
                    0.3,
                    0.9
                  ]
                )
              ),
            )
          ),

          Positioned.fill(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 204, 110, 200),
                      Color.fromARGB(255, 249, 199, 246),
                      Color.fromARGB(255, 251, 209, 249)
                    ],
                    begin: Alignment.bottomCenter,
                    end:  Alignment.topCenter,
                    stops: [
                      0.05,
                      0.55,
                      0.8
                    ]
                  )
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Image.asset(
                        "assets/images/spisyLogo.png",
                        width: 120,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
              
                    PratamaFormBuilder(
                      formKey: formKey,
                      fields: [
                        PratamaFormBuilderModel(
                          field: PratamaFormField.textField,
                          presenter: presenter.usernamePresenter
                        ),
                        PratamaFormBuilderModel(
                          field: PratamaFormField.textField,
                          presenter: presenter.passwordPresenter
                        )
                      ],
                    ),

                    BlocListener<AuthenticationBloc,AuthenticationState>(
                      listener: (context, state) {
                        if(state is LoginFailed){
                          Navigator.of(context).pop();
                        }else if(state is LoginSuccess){
                          presenter.view.navigateIntoLandingPage();
                        }
                      },
                      child: BlocBuilder<AuthenticationBloc,AuthenticationState>(
                        builder: (context, state) {
                          if(state is LoginFailed){
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                  right: 20
                                ),
                                child: Text(
                                  state.message!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.error
                                  ),
                                ),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30
                      ),
                      child: PratamaFilledSecondaryButton(
                        text: "Login",
                        onTap: () async{
                          if(formKey.currentState!.validate()){
                           await showDialog(
                              context: context, 
                              barrierDismissible: false,
                              builder: (context){
                                Future.delayed(const Duration(milliseconds: 700),(){}).whenComplete(() =>  presenter.authenticatiog());
                                return const Loading(
                                  color: Color.fromARGB(255, 204, 110, 200),
                                );
                              });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ) ;
  }
}