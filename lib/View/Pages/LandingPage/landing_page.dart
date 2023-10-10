// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/Fragments/logout.dart';
import 'package:spisy10/View/Fragments/student_list/student_list.dart';
import 'package:spisy10/View/Pages/LandingPage/landing_page_presenter.dart';
import 'package:spisy10/View/Pages/LandingPage/landing_page_presenter_view.dart';
import 'package:spisy10/View/widgets/buttons/appbar_button/appbar_button.dart';
import 'package:spisy10/bloc/page/page_bloc.dart';
import 'package:spisy10/bloc/page/page_event.dart';
import 'package:spisy10/bloc/page/page_state.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
    final LandingPagePresenter presenter = LandingPagePresenter(
      view : LandingPagePresenterView(
        context: context
      ),
    );
    return  MultiBlocProvider(
      providers: [
        BlocProvider<PageBloc>(
          create: presenter.pageProvider,
        ),
        BlocProvider<StudentsBloc>(create: presenter.studentPRovider)
      ],
      child: Builder(
        builder: (context) {
          presenter.view.setCurrentContext(context);
          return Scaffold(
            appBar: AppBar(
              key: key,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Image.asset(
                "assets/images/spisyLogo.png",
                width: (30 * 16) / 9,
                alignment: Alignment.topCenter,
                height: 30,
                fit: BoxFit.contain,
              ),
              actions: const [
                AppBarButton()
              ],
            ),
            backgroundColor: Colors.white,
            body: BlocListener<PageBloc,PageState>(
              listenWhen: (previous, current) => current is PageChanged,
              listener: (context, state) {
                presenter.pageViewBlocListener(state.activePage!);
              },
              child: PageView(
                controller:presenter.view.pageController,
                allowImplicitScrolling: false,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  StudentList(),
                  const Logout()
                ],
              ),
            ),
            bottomNavigationBar: BlocBuilder<PageBloc,PageState>(
             buildWhen: (previous, current) => current is PageChanged,
             builder: (context, state){
              return BottomNavigationBar(
                backgroundColor:const Color.fromARGB(255, 204, 110, 200),
                selectedItemColor: Colors.white,
                unselectedItemColor: const Color.fromARGB(255, 131, 50, 127),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                    ),
                    label: "Home"
                  ),
                  BottomNavigationBarItem(
                    icon : Icon(
                      Icons.logout_rounded
                    ),
                    label: "Logout"
                  ),
                ],
                onTap: presenter.navigationBarOnTapped,
                currentIndex: state.activePage!,
              );
             }
            )
          );
        },
      )
    );
  }
}