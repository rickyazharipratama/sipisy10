import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/Pages/splash/splash_presenter.dart';
import 'package:spisy10/View/Pages/splash/splash_view.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_bloc.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_state.dart';
import 'package:spisy10/factory/impls/bloc/authentication/events/validating_user_impl.dart';
import 'package:spisy10/factory/impls/views/pages/splash/splash_presenter_impl.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});



  @override
  Widget build(BuildContext context) {
    final SplashPresenter presenter = SplashPresenterImpl(
      authBloc: BlocProvider.of<AuthenticationBloc>(context),
      view: SplashViewImpl(
        context: context
      )
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 110, 200),
      body: Stack(
        children: [

          Positioned.fill(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  "assets/images/spisyLogo.png",
                  width: 120,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
            )
          ),

          BlocListener<AuthenticationBloc,AuthenticationState>(
            listenWhen: (previous, current) => current is UserPrepared || current is NoActiveUser || current  is UserStillActive || current is ActiveUserDeleted,
            listener: (context, state) {
              if(state is UserPrepared){
                presenter.isNeedToShowLoading = true;
                presenter.currentAuthBloc.add(ValidatingUserImpl());
              }else if(state is UserStillActive){
                presenter.goToLandingPage();
              }else{
                presenter.goToLoginPage();
              }
            },
            child:  BlocBuilder<AuthenticationBloc,AuthenticationState>(
              buildWhen: (previous, current) => current is UserPrepared,
              builder: (context, state) => Positioned(
                bottom: 30 + MediaQuery.of(context).padding.bottom,
                left: 0,
                right: 0,
                child: const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white70,
                      strokeWidth: 3,
                    ),
                  ),
                )
              ),
            ),
          )
        ],
      ), 
    );
  }
}