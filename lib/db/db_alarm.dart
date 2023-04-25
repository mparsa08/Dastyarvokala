import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/model_alarm.dart';

class AlarmDataBase {
  AlarmDataBase._init();
  static final AlarmDataBase instance = AlarmDataBase._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('alarm_db.db');
    return _database!;
  }

  Future<Database> _initDB(String databasename) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, databasename);
    return await openDatabase(path, version: 2, onCreate: _creatDB);
  }

  Future _creatDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''CREATE TABLE $tableName (
    id $idType,
    onvan $textType,
    movakelname $textType,
    mahalmoraje $textType,
    ghazi $textType,
    shomareparvande $textType,
    tarikh $textType,
    tozihat $textType
  )
''');
  }

  Future<Alarm> create(Alarm alarm) async {
    final db = await instance.database;
    final id = await db.insert(tableName, alarm.toJson());
    return alarm.copy(id: id);
  }

  Future<Alarm> readAlarm(int? id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableName,
      columns: AlarmFields.values,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Alarm.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Alarm>> readAllAlarm() async {
    final db = await instance.database;
    final result = await db.query(tableName);
    return result.map((json) => Alarm.fromJson(json)).toList();
  }

  Future<int> updateAlarm(Alarm alarm) async {
    final db = await instance.database;
    return db.update(
      tableName,
      alarm.toJson(),
      where: 'id = ?',
      whereArgs: [alarm.id],
    );
  }

  Future<int> deleteAlarm(int? id) async {
    final db = await instance.database;
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
