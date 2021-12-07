// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:myafyahub/infrastructure/repository/database_base.dart';
import 'package:myafyahub/infrastructure/repository/initialize_db.dart';
import 'package:myafyahub/infrastructure/repository/sqlite.dart';

/// [BeWellDatabaseMobile] is the main entry for interacting with the database for My Afya Hub mobile
/// It uses sqlite which a common RDMS. Unlike other key:value storage, sqlite offers
/// high flexibility when storing structured data.
/// The idea is to store, sessions, permissions(highly structured) and anything else
/// that required persistence.
/// When a new state has been added, it needs to be serialized so that it may be saved in the database
/// The command to serialize is [flutter pub run build_runner build --delete-conflicting-outputs]
class BeWellDatabaseMobile<T extends DatabaseExecutor>
    implements BeWellDatabaseBase<T> {
  BeWellDatabaseMobile({this.initializeDB});

  final InitializeDB<T>? initializeDB;

  /// [database] creates and returns an instance of the database as a future
  @override
  Future<T> get database async {
    return initializeDB!.database();
  }

  @override
  Future<void> clearDatabase() =>
      clearDatabaseHelper(this.initializeDB!.dbName);

  @override
  Future<int> countTableRecords(String table) async {
    final T _db = await this.database;
    final int? count = Sqflite.firstIntValue(
      await _db.rawQuery('SELECT COUNT(*) FROM $table'),
    );
    return Future<int>.value(count);
  }

  @override
  Future<bool> isDatabaseEmpty() async {
    final int t1 = await countTableRecords(Tables.credentials.name);
    final int t2 = await countTableRecords(Tables.clientState.name);
    final int t3 = await countTableRecords(Tables.onboardingState.name);
    final int t4 = await countTableRecords(Tables.bottomNavigationState.name);
    final int t5 = await countTableRecords(Tables.connectivityState.name);
    final int t6 = await countTableRecords(Tables.miscState.name);
    final int t7 = await countTableRecords(Tables.contentState.name);

    final int counts = t1 + t2 + t3 + t4 + t5 + t6 + t7;
    if (counts > 0) {
      return false;
    }
    return true;
  }

  Future<Map<String, dynamic>> retrieveWorker(Tables table) async {
    final T _db = await this.database;
    final List<Map<dynamic, dynamic>> states = await _db
        .rawQuery('SELECT * FROM ${table.name} ORDER BY id DESC LIMIT 1');
    final Map<String, dynamic> _state = Map<String, dynamic>.from(states.first);

    return _state;
  }

  /// [retrieveState] get the current states.
  @override
  Future<Map<String, dynamic>> retrieveState(Tables table) async {
    final T _db = await this.database;

    if (table != Tables.unknown) {
      final Map<String, dynamic> _state = await retrieveWorker(table);

      final dynamic state = json.decode(_state[table.name] as String);

      return state as Map<String, dynamic>;
    }

    // any other state object that does not need custom mapping
    final List<Map<dynamic, dynamic>> states = await _db
        .rawQuery('SELECT * FROM ${table.name} ORDER BY id DESC LIMIT 1');
    return states.first as Map<String, dynamic>;
  }

  /// [saveState] saves the current states by an [INSERT] in the database
  /// IMPORTANT: THIS METHOD WORKS ON THE ASSUMPTION THAT THE TABLE NAME MATCHES THE INSERTION FIELD NAME
  @override
  Future<void> saveState({
    required Map<String, dynamic> data,
    required Tables table,
  }) async {
    final T _db = await this.database;
    final String dataAsString = jsonEncode(data);
    final String tableName = table.name;
    await _db.rawInsert(
      'INSERT INTO $tableName($tableName) VALUES(?)',
      <dynamic>[dataAsString],
    );
    return;
  }
}
