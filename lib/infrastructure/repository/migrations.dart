// Project imports:
import 'package:myafyahub/infrastructure/repository/database_base.dart';

/// add migrations here for example;
/// '''alter table _task add column done integer default 0;'''
final List<String> migrations = <String>[
  '''CREATE TABLE IF NOT EXISTS ${Tables.credentials.name}(id INTEGER PRIMARY KEY, ${Tables.credentials.name} TEXT)''',
  '''CREATE TABLE IF NOT EXISTS ${Tables.clientState.name}(id INTEGER PRIMARY KEY, ${Tables.clientState.name} TEXT)''',
  '''CREATE TABLE IF NOT EXISTS ${Tables.onboardingState.name}(id INTEGER PRIMARY KEY, ${Tables.onboardingState.name} TEXT)''',
  '''CREATE TABLE IF NOT EXISTS ${Tables.bottomNavigationState.name}(id INTEGER PRIMARY KEY, ${Tables.bottomNavigationState.name} TEXT)''',
  '''CREATE TABLE IF NOT EXISTS ${Tables.connectivityState.name}(id INTEGER PRIMARY KEY, ${Tables.connectivityState.name} TEXT)''',
  '''CREATE TABLE IF NOT EXISTS ${Tables.miscState.name}(id INTEGER PRIMARY KEY, ${Tables.miscState.name} TEXT)''',
];
