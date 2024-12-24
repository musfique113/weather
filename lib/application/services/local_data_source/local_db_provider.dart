import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather/application/utils/database_creation_query.dart';

class LocalDBProvider {
  LocalDBProvider._();

  static final LocalDBProvider db = LocalDBProvider._();
  Database? _database;
  final String databaseName = 'weather.db';
  String tableName = 'cached_weather_data';

  Future<Database> get dataBaseRef async {
    if (_database != null) return _database!;
    _database = await initWeatherDB();
    return _database!;
  }

  Future<Database> initWeatherDB() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.toString(), databaseName);
    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        final query = DBCreationQuery(
          tableName: tableName,
        );
        await db.execute(query.tableCreationQuery);
      },
      onUpgrade: (
        Database db,
        int oldVersion,
        int newVersion,
      ) async {},
    );
    return database;
  }
}
