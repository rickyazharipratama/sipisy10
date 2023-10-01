class UserAuth{

  String username;
  String password;
  final String compare = "spisy10mobile";

  UserAuth({
    required this.username,
    required this.password
  });
  
  void wipeUser(){
    username = "";
    password = "";
  }
}