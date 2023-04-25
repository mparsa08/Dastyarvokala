import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/model_x.dart';

class MyDatabase {
  MyDatabase._init();
  static final MyDatabase instance = MyDatabase._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('Dav.db');
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
    movakel_firstname $textType,
    movakel_lastname $textType,
    movakel_namepedar $textType,
    movakel_kodemeli $textType,
    movakel_shomareshenasname $textType,
    movakel_addres $textType,
    movakel_shomaretamas $textType,
    parvande_shomareparvande $textType,
    parvande_shomareshobe $textType,
    parvande_shomarebaygani $textType,
    parvande_namekhande $textType,
    parvande_mozooe $textType,
    parvande_mojtamaghazayi $textType,
    parvande_kholaseparvande $textType,
    khande_firstname $textType,
    khande_lastname $textType,
    khande_namepedar $textType,
    khande_kodemeli $textType,
    khande_shomareshenasname $textType,
    khande_addres $textType,
    khande_shomaretamas $textType,
    gharardad_shomarevekalatname $textType,
    gharardad_tarikh $textType,
    gharardad_mablaghkol $textType,
    gharardad_pishpardakht $textType,
    gharardad_tozihat $textType,
    parvandeEjrayi_shomareparvandeejrayi $textType,
    parvandeEjrayi_tozihat $textType
  )
''');
  }

  Future<Dav> create(Dav dav) async {
    final db = await instance.database;
    final id = await db.insert(tableName, dav.toJson());
    return dav.copy(id: id);
  }

  Future<Dav> readDav(int? id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableName,
      columns: DavFields.values,
      where: 'parvande_shomareparvande = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Dav.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Dav>> readAllDav() async {
    final db = await instance.database;
    final result = await db.query(tableName);
    return result.map((json) => Dav.fromJson(json)).toList();
  }

  Future<int> updateDav(Dav dav) async {
    final db = await instance.database;
    return db.update(
      tableName,
      dav.toJson(),
      where: 'parvande_shomareparvande = ?',
      whereArgs: [dav.parvandeShomareparvande],
    );
  }

  Future<int> deleteDav(int? id) async {
    final db = await instance.database;
    return await db.delete(
      tableName,
      where: 'parvande_shomareparvande = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
