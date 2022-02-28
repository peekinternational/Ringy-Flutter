// dao/person_dao.dart

import 'package:floor/floor.dart';

import '../entities/chat_message/user_model.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM UsersModel')
  Future<List<UsersModel?>> getAllUsers();


  @insert
  Future<void> insertUser(UsersModel person);

  @insert
  Future<void> insertAll(List<UsersModel> mList);

  @Query('SELECT * FROM UsersModel where isGroup = 0 AND hideChat =2')
  Future<List<UsersModel>> getUsers();

  // @Query('SELECT * FROM UsersModel where isGroup = 0 AND hideChat =2 AND isChannel =0')
  // Future<List<UsersModel>> getUsers();
// hiddenChatUsers
  @Query('SELECT * FROM UsersModel where hideChat =1')
  Future<List<UsersModel?>> getHideUsers();
  @Query('SELECT * FROM UsersModel where isGroup = 1 AND hideChat =2')
  Future<List<UsersModel?>> getGroup();

  @Query("DELETE FROM UsersModel")
  Future<void> deleteAll();

  @Query('Delete from UsersModel where id = :uID')
  Future<void> delete(String uID);

  @Query('UPDATE UsersModel SET pinnedChat=:status WHERE id = :mId')
  Future<void> updateUser(int status, String mId);

}