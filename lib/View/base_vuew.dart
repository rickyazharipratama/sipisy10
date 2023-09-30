import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  @override
  _BaseViewState createState() => new _BaseViewState();
}

class _BaseViewState extends State<BaseView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute<UserFormScreen>(
              //     builder: (context) {
              //       return MultiBlocProvider(
              //         providers: [
              //           BlocProvider<_UserFormBloc.UserFormBloc>.value(
              //               value: userFormBloc..add(_UserFormBloc.GetUser())),
              //           BlocProvider<UserListBloc>.value(value: userListBloc),
              //         ],
              //         child: UserFormScreen(),
              //       );
              //     },
              //   ),
              // );
            }),
    );
  }
}