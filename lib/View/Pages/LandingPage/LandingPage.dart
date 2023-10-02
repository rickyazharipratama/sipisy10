// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:spisy10/View/Fragments/student_list.dart';
import 'package:spisy10/View/Fragments/student_list_empty.dart';
import 'package:spisy10/View/Pages/LandingPage/LandingPagePresenter.dart';
import 'package:spisy10/View/widgets/buttons/appbar_button.dart';

class LandingPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>  with TickerProviderStateMixin{

  late LandingPagePresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = LandingPagePresenter(
      context: context
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: widget.scaffoldKey,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: PageView(
              controller:presenter.view.pageController,
              children: [
                StudentList(),
                const StudentListEmpty()
              ],
            ),
          ),

          TabBar(
            controller: presenter.view.tabController,
            dividerColor: Colors.black,
            isScrollable: false,
            tabs: const [
              Icon(
                Icons.home_filled,
                size: 30,
                color: Colors.white54,
                ),
              Icon(
                Icons.logout_rounded,
                size: 30,
                color: Colors.white54,
              )
            ],
          )
        ],
      )
    );
  }
}