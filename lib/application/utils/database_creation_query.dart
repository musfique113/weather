class DBCreationQuery {
  DBCreationQuery({required this.tableName});

  String tableName;
  static String columnId = 'id';
  static String columnCreatedAt = 'createdAt';
  static String weatherData = 'weather_data';

  String get tableCreationQuery => 'CREATE TABLE "$tableName" ('
      '$columnId INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$weatherData TEXT, '
      "$columnCreatedAt DATE DEFAULT (datetime('now','localtime')))";
}
