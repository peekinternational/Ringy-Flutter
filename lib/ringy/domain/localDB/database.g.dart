// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UsersModel` (`myId` INTEGER PRIMARY KEY AUTOINCREMENT, `sId` TEXT NOT NULL, `userName` TEXT NOT NULL, `qrRing` TEXT NOT NULL, `pImage` TEXT NOT NULL, `ringName` TEXT NOT NULL, `ringUserId` TEXT NOT NULL, `ringValue` TEXT NOT NULL, `isDefault` INTEGER NOT NULL, `ringStatus` INTEGER NOT NULL, `onlineStatus` INTEGER NOT NULL, `pStatus` INTEGER NOT NULL, `callStatus` INTEGER NOT NULL, `isGroup` INTEGER NOT NULL, `seenStatus` INTEGER NOT NULL, `readReceipts` INTEGER NOT NULL, `lastActiveTime` TEXT NOT NULL, `chatWithRefId` TEXT NOT NULL, `onlineHideStatus` TEXT NOT NULL, `stopAudioCall` TEXT NOT NULL, `stopVideoCall` TEXT NOT NULL, `userId` TEXT NOT NULL, `updatedByMsg` TEXT NOT NULL, `friendReqId` TEXT NOT NULL, `friendReqStatus` INTEGER NOT NULL, `friendReqSenderId` TEXT NOT NULL, `usCount` INTEGER NOT NULL, `isSeenCount` INTEGER NOT NULL, `mute` TEXT NOT NULL, `hide` TEXT NOT NULL, `block` TEXT NOT NULL, `hideChat` TEXT NOT NULL, `unreadUserStatus` TEXT NOT NULL, `pinStatus` INTEGER NOT NULL, `hiddenChat` INTEGER NOT NULL, `selectedRingId` TEXT NOT NULL, `latestMsg` TEXT NOT NULL, `latestMsgType` INTEGER NOT NULL, `latestMsgSenderId` TEXT NOT NULL, `latestMsgCreatedAt` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _usersModelInsertionAdapter = InsertionAdapter(
            database,
            'UsersModel',
            (UsersModel item) => <String, Object?>{
                  'myId': item.myId,
                  'sId': item.sId,
                  'userName': item.userName,
                  'qrRing': item.qrRing,
                  'pImage': item.pImage,
                  'ringName': item.ringName,
                  'ringUserId': item.ringUserId,
                  'ringValue': item.ringValue,
                  'isDefault': item.isDefault,
                  'ringStatus': item.ringStatus,
                  'onlineStatus': item.onlineStatus,
                  'pStatus': item.pStatus,
                  'callStatus': item.callStatus,
                  'isGroup': item.isGroup,
                  'seenStatus': item.seenStatus,
                  'readReceipts': item.readReceipts,
                  'lastActiveTime': item.lastActiveTime,
                  'chatWithRefId': item.chatWithRefId,
                  'onlineHideStatus': item.onlineHideStatus,
                  'stopAudioCall': item.stopAudioCall,
                  'stopVideoCall': item.stopVideoCall,
                  'userId': item.userId,
                  'updatedByMsg': item.updatedByMsg,
                  'friendReqId': item.friendReqId,
                  'friendReqStatus': item.friendReqStatus,
                  'friendReqSenderId': item.friendReqSenderId,
                  'usCount': item.usCount,
                  'isSeenCount': item.isSeenCount,
                  'mute': item.mute,
                  'hide': item.hide,
                  'block': item.block,
                  'hideChat': item.hideChat,
                  'unreadUserStatus': item.unreadUserStatus,
                  'pinStatus': item.pinStatus,
                  'hiddenChat': item.hiddenChat,
                  'selectedRingId': item.selectedRingId,
                  'latestMsg': item.latestMsg,
                  'latestMsgType': item.latestMsgType,
                  'latestMsgSenderId': item.latestMsgSenderId,
                  'latestMsgCreatedAt': item.latestMsgCreatedAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UsersModel> _usersModelInsertionAdapter;

  @override
  Future<List<UsersModel?>> getAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM UsersModel',
        mapper: (Map<String, Object?> row) => UsersModel(
            row['myId'] as int?,
            row['sId'] as String,
            row['userName'] as String,
            row['qrRing'] as String,
            row['pImage'] as String,
            row['ringName'] as String,
            row['ringUserId'] as String,
            row['ringValue'] as String,
            row['isDefault'] as int,
            row['ringStatus'] as int,
            row['onlineStatus'] as int,
            row['pStatus'] as int,
            row['callStatus'] as int,
            row['isGroup'] as int,
            row['seenStatus'] as int,
            row['readReceipts'] as int,
            row['lastActiveTime'] as String,
            row['chatWithRefId'] as String,
            row['onlineHideStatus'] as String,
            row['stopAudioCall'] as String,
            row['stopVideoCall'] as String,
            row['userId'] as String,
            row['updatedByMsg'] as String,
            row['friendReqId'] as String,
            row['friendReqStatus'] as int,
            row['friendReqSenderId'] as String,
            row['usCount'] as int,
            row['isSeenCount'] as int,
            row['mute'] as String,
            row['hide'] as String,
            row['block'] as String,
            row['hideChat'] as String,
            row['unreadUserStatus'] as String,
            row['pinStatus'] as int,
            row['hiddenChat'] as int,
            row['selectedRingId'] as String,
            row['latestMsg'] as String,
            row['latestMsgType'] as int,
            row['latestMsgSenderId'] as String,
            row['latestMsgCreatedAt'] as String));
  }

  @override
  Future<List<UsersModel>> getUsers() async {
    return _queryAdapter.queryList(
        'SELECT * FROM UsersModel where isGroup = 0 AND hideChat =2',
        mapper: (Map<String, Object?> row) => UsersModel(
            row['myId'] as int?,
            row['sId'] as String,
            row['userName'] as String,
            row['qrRing'] as String,
            row['pImage'] as String,
            row['ringName'] as String,
            row['ringUserId'] as String,
            row['ringValue'] as String,
            row['isDefault'] as int,
            row['ringStatus'] as int,
            row['onlineStatus'] as int,
            row['pStatus'] as int,
            row['callStatus'] as int,
            row['isGroup'] as int,
            row['seenStatus'] as int,
            row['readReceipts'] as int,
            row['lastActiveTime'] as String,
            row['chatWithRefId'] as String,
            row['onlineHideStatus'] as String,
            row['stopAudioCall'] as String,
            row['stopVideoCall'] as String,
            row['userId'] as String,
            row['updatedByMsg'] as String,
            row['friendReqId'] as String,
            row['friendReqStatus'] as int,
            row['friendReqSenderId'] as String,
            row['usCount'] as int,
            row['isSeenCount'] as int,
            row['mute'] as String,
            row['hide'] as String,
            row['block'] as String,
            row['hideChat'] as String,
            row['unreadUserStatus'] as String,
            row['pinStatus'] as int,
            row['hiddenChat'] as int,
            row['selectedRingId'] as String,
            row['latestMsg'] as String,
            row['latestMsgType'] as int,
            row['latestMsgSenderId'] as String,
            row['latestMsgCreatedAt'] as String));
  }

  @override
  Future<List<UsersModel?>> getHideUsers() async {
    return _queryAdapter.queryList('SELECT * FROM UsersModel where hideChat =1',
        mapper: (Map<String, Object?> row) => UsersModel(
            row['myId'] as int?,
            row['sId'] as String,
            row['userName'] as String,
            row['qrRing'] as String,
            row['pImage'] as String,
            row['ringName'] as String,
            row['ringUserId'] as String,
            row['ringValue'] as String,
            row['isDefault'] as int,
            row['ringStatus'] as int,
            row['onlineStatus'] as int,
            row['pStatus'] as int,
            row['callStatus'] as int,
            row['isGroup'] as int,
            row['seenStatus'] as int,
            row['readReceipts'] as int,
            row['lastActiveTime'] as String,
            row['chatWithRefId'] as String,
            row['onlineHideStatus'] as String,
            row['stopAudioCall'] as String,
            row['stopVideoCall'] as String,
            row['userId'] as String,
            row['updatedByMsg'] as String,
            row['friendReqId'] as String,
            row['friendReqStatus'] as int,
            row['friendReqSenderId'] as String,
            row['usCount'] as int,
            row['isSeenCount'] as int,
            row['mute'] as String,
            row['hide'] as String,
            row['block'] as String,
            row['hideChat'] as String,
            row['unreadUserStatus'] as String,
            row['pinStatus'] as int,
            row['hiddenChat'] as int,
            row['selectedRingId'] as String,
            row['latestMsg'] as String,
            row['latestMsgType'] as int,
            row['latestMsgSenderId'] as String,
            row['latestMsgCreatedAt'] as String));
  }

  @override
  Future<List<UsersModel?>> getGroup() async {
    return _queryAdapter.queryList(
        'SELECT * FROM UsersModel where isGroup = 1 AND hideChat =2',
        mapper: (Map<String, Object?> row) => UsersModel(
            row['myId'] as int?,
            row['sId'] as String,
            row['userName'] as String,
            row['qrRing'] as String,
            row['pImage'] as String,
            row['ringName'] as String,
            row['ringUserId'] as String,
            row['ringValue'] as String,
            row['isDefault'] as int,
            row['ringStatus'] as int,
            row['onlineStatus'] as int,
            row['pStatus'] as int,
            row['callStatus'] as int,
            row['isGroup'] as int,
            row['seenStatus'] as int,
            row['readReceipts'] as int,
            row['lastActiveTime'] as String,
            row['chatWithRefId'] as String,
            row['onlineHideStatus'] as String,
            row['stopAudioCall'] as String,
            row['stopVideoCall'] as String,
            row['userId'] as String,
            row['updatedByMsg'] as String,
            row['friendReqId'] as String,
            row['friendReqStatus'] as int,
            row['friendReqSenderId'] as String,
            row['usCount'] as int,
            row['isSeenCount'] as int,
            row['mute'] as String,
            row['hide'] as String,
            row['block'] as String,
            row['hideChat'] as String,
            row['unreadUserStatus'] as String,
            row['pinStatus'] as int,
            row['hiddenChat'] as int,
            row['selectedRingId'] as String,
            row['latestMsg'] as String,
            row['latestMsgType'] as int,
            row['latestMsgSenderId'] as String,
            row['latestMsgCreatedAt'] as String));
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM UsersModel');
  }

  @override
  Future<void> delete(String uID) async {
    await _queryAdapter.queryNoReturn('Delete from UsersModel where id = ?1',
        arguments: [uID]);
  }

  @override
  Future<void> updateUser(int status, String mId) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE UsersModel SET pinnedChat=?1 WHERE id = ?2',
        arguments: [status, mId]);
  }

  @override
  Future<void> insertUser(UsersModel person) async {
    await _usersModelInsertionAdapter.insert(person, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertAll(List<UsersModel> mList) async {
    await _usersModelInsertionAdapter.insertList(
        mList, OnConflictStrategy.abort);
  }
}
