import 'dart:io';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'Question.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper = DatabaseHelper.createInstance();
  static late Database _database;

  String colid = "id";
  String questTable = "questionTable";
  String colname = "name";
  String coljob = "job";
  String coltheQuest = "theQuest";
  String colPhone = "phone";

  DatabaseHelper.createInstance();
  factory DatabaseHelper() {
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = "${directory.path}questions.db";

    var questsDatabase =
        await openDatabase(path, version: 1, onCreate: _createDB);

    return questsDatabase;
  }

  void _createDB(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $questTable($colid INTEGER PRIMARY KEY AUTOINCREMENT, $colname TEXT, $coljob TEXT, $coltheQuest TEXT,$colPhone TEXT)');
  }

  //
  Future<List<Map<String, dynamic>>> getQuestions() async {
    Database db = await this.database;
    var result = db.query(questTable);
    return result;
  }

  Future<int> insertQuestion(Question question) async {
    Database db = await this.database;
    var result = db.insert(questTable, question.toMap());
    return result;
  }

  Future<List<Question>> getQuestionList() async {
    var questMapList = await getQuestions();
    int count = questMapList.length;

    List<Question> questList = List.empty();
    for (var i = 0; i < count; i++) {
      questList.add(Question.fromMap(questMapList[i]));
    }
    return questList;
  }
}
