// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/user_model.dart';
import 'package:ringy_flutter/ringy/domain/localDB/users_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [UsersModel])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}