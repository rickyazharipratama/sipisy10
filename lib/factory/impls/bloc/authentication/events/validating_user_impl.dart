import 'package:spisy10/factory/bloc/authentication/authentication_event.dart';
import 'package:spisy10/warehouse/models/user_model.dart';
import 'package:spisy10/warehouse/repository_collection.dart';

class ValidatingUserImpl extends AuthenticationEvent implements ValidatingUser{

  final int requiredLogin = 15;
  
  @override
  Future<UserModel?> get getActiveUser async{
    return await RepositoryCollection.repository.user.getActiveUser();
  }
  
  @override
  bool isLoginTimeExpired(DateTime valid) {
    Duration diff = DateTime.now().difference(valid);
    if(diff.inMinutes > requiredLogin){
      return true;
    }
    return false; 
  }
  
  @override
  Future<void> clearActiveUser(int id)  async{
    await RepositoryCollection.repository.user.deleteActiveUser(id);
  }
}
