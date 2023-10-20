import 'package:spisy10/factory/impls/warehouse/repos/student_repository_impl.dart';
import 'package:spisy10/factory/impls/warehouse/repos/user_repository_impl.dart';
import 'package:spisy10/warehouse/repos/student_repository.dart';
import 'package:spisy10/warehouse/repos/user_repository.dart';

class RepositoryCollection{

  static final RepositoryCollection repository =RepositoryCollection();

  final UserRepository user = UserRepositoryImpl();
  final StudentRepository student = StudentRepositoryImpl();
}