import 'package:spisy10/factory/bloc/authentication/authentication_event.dart';
import 'package:spisy10/factory/utils/log.dart';
import 'package:spisy10/warehouse/models/user_auth.dart';
import 'package:spisy10/warehouse/models/user_model.dart';
import 'package:spisy10/warehouse/repository_collection.dart';

class AuthenticatingImpl extends AuthenticationEvent implements Authenticating{
  final UserAuth user;
  final String loginCompare = "spisy10mobile";

  AuthenticatingImpl({required this.user});
  
  @override
  UserAuth get currentUser => user;

  @override
  bool get isValidUser => user.username == loginCompare && user.password == loginCompare;
  
  @override
  Future<bool> insertingeUser(UserModel usr) async{
    bool isInsert = false;
    try{
      await RepositoryCollection.repository.user.insertActiveUser(usr);
      isInsert = true;
    }catch(e){
      Log(e);
    }
    return isInsert;
  }
}
