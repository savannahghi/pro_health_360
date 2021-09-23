import 'package:myafyahub/infrastructure/repository/migrations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<T> initDatabase<T extends DatabaseExecutor>(String dbName) async {
  final String _dbPath = await getDatabasesPath();
  final String _path = join(_dbPath, dbName);
  return await openDatabase(
    _path,
    version: migrations.length + 1,
    onCreate: onCreateCallback,
    onUpgrade: onUpgradeCallback,
  ) as T;
}

Future<void> onCreateCallback(Database db, int version) async {
  await migrate(db, 0, version);
}

Future<void> onUpgradeCallback(
    Database db, int oldVersion, int newVersion) async {
  await migrate(db, oldVersion, newVersion);
}

Future<void> migrate(Database db, int oldVersion, int newVersion) async {
  for (int i = oldVersion; i <= newVersion - 2; i++) {
    try {
      await db.execute(migrations[i]);
    } catch (e) {
      Sentry.captureException(e);
    }
  }
}

Future<void> clearDatabaseHelper(String dbName) async {
  final String _dbPath = await getDatabasesPath();
  final String _path = join(_dbPath, dbName);
  deleteDatabase(_path);
}
