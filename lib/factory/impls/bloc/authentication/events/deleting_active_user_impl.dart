import 'package:spisy10/factory/bloc/authentication/authentication_event.dart';
import 'package:spisy10/warehouse/repository_collection.dart';

class DeletingActiveUserImpl extends AuthenticationEvent implements DeletingActiveUser{
  
  @override
  Future<void> deletingUser(int id) async{
    await RepositoryCollection.repository.user.deleteActiveUser(id);
  }
}