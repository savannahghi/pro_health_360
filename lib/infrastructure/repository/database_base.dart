/// [BeWellDatabaseBase] defines an interface to be fulfilled so that a storage component
/// may work, for each exclusive platform. (Mobile and Web)
abstract class BeWellDatabaseBase<T> {
  /// get the [database] instance
  Future<T> get database;

  /// [saveState] stores the state in the linked [database]
  Future<void> saveState({
    required Map<String, dynamic> data,
    required Tables table,
  });

  /// [countTableRecords] get how many records belong to specific table as in the
  /// case of SQLite, and key as in the case of local storage
  Future<int> countTableRecords(String table);

  Future<bool> isDatabaseEmpty();

  /// [retrieveState] fetches the state from storage unit
  Future<Map<String, dynamic>> retrieveState(Tables table);

  /// [clearDatabase] flushes or deletes the database.
  Future<void> clearDatabase();
}

/// [Tables] definitions
enum Tables {
  userProfileState,
  connectivityState,
  userFeedState,
  miscState,
  unknown,
}

/// [TablesEx] extends [Tables] enum to get the values as
/// strings
extension TablesEx on Tables {
  String get name {
    switch (this) {
      case Tables.userProfileState:
        return 'userProfileState';
      case Tables.connectivityState:
        return 'connectivityState';
      case Tables.userFeedState:
        return 'userFeedState';
      case Tables.miscState:
        return 'miscState';
      default:
        return 'unknown';
    }
  }
}
