import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:weather/application/services/local_data_source/local_db_provider.dart';
import 'package:weather/application/utils/database_creation_query.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';

class LocalDataSource {
  LocalDataSource(this.dbProvider);

  final LocalDBProvider dbProvider;

  Future<WeatherModel?> getWeatherData() async {
    final db = await dbProvider.dataBaseRef;
    final res = await db.query(
      dbProvider.tableName,
      orderBy: 'id DESC',
      limit: 10,
    );

    if (res.isNotEmpty) {
      final weatherDataString = res.last[DBCreationQuery.weatherData] as String;
      return WeatherModel.fromJson(jsonDecode(weatherDataString));
    }
    return null;
  }

  Future<int> saveWeatherData(WeatherModel weather) async {
    final db = await dbProvider.dataBaseRef;

    final weatherJson = jsonEncode(weather.toJson());

    return await db.insert(
      dbProvider.tableName,
      {DBCreationQuery.weatherData: weatherJson},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> clearWeatherData() async {
    final db = await dbProvider.dataBaseRef;
    return await db.delete(dbProvider.tableName);
  }
}
