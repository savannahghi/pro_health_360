// Project imports:
import 'package:myafyahub/infrastructure/repository/database_base.dart';

/// add migrations here for example;
/// '''alter table _task add column done integer default 0;'''
final List<String> migrations = <String>[
  '''CREATE TABLE IF NOT EXISTS ${Tables.userProfileState.name}(id INTEGER PRIMARY KEY, ${Tables.userProfileState.name} TEXT)''',
  '''CREATE TABLE IF NOT EXISTS ${Tables.connectivityState.name}(id INTEGER PRIMARY KEY, ${Tables.connectivityState.name} TEXT) ''',
  '''CREATE TABLE IF NOT EXISTS ${Tables.userFeedState.name}(id INTEGER PRIMARY KEY, ${Tables.userFeedState.name} TEXT) ''',
  '''CREATE TABLE IF NOT EXISTS ${Tables.miscState.name}(id INTEGER PRIMARY KEY, ${Tables.miscState.name} TEXT) ''',
];
