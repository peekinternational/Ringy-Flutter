// dao/person_dao.dart

import 'package:floor/floor.dart';

import '../entities/chat_message/user_model.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM Person')
  Future<List<UsersModel>> getAllUsers();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<UsersModel?> findUserById(int id);

  @insert
  Future<void> insertUser(UsersModel person);
}