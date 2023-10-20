class UserAuth{

  String username;
  String password;

  UserAuth({
    required this.username,
    required this.password
  });
  
  void wipeUser(){
    username = "";
    password = "";
  }
}