import 'package:notes/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static late Database _database;

  Future<Database> get database async {
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), "notes.db"),
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          body TEXT,
          date DATE
        )
      ''');
    }, version: 1);
  }

  addNewNote(Note note) async {
    final db = await database;
    db.insert("notes", note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  getNotes() async {
    final db = await database;
    var res = await db.query("notes");
    if (res.isEmpty) {
      return Null;
    } else {
      var resultMap = res.toList();
      return resultMap.isNotEmpty ? resultMap : Null;
    }
  }
}
