// ignore_for_file: depend_on_referenced_packages

import 'package:sqflite/sqflite.dart';

abstract class DatabaseProvider{
  Future<Database?> get connector;
}
