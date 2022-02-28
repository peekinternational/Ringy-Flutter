import 'database.dart';

class DBProvider{
 // static DioClient _instance = DioClient._();
  static final DBProvider db = DBProvider._();
  DBProvider._();
  static DBProvider get instance => db;

  Future<AppDatabase> getDatabaseClient() async {
    final database = await $FloorAppDatabase.databaseBuilder('ringy.db').build();

    return database;
  }


}