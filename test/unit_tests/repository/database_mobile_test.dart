// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:myafyahub/infrastructure/repository/database_base.dart';
import 'package:myafyahub/infrastructure/repository/database_mobile.dart';
import 'package:myafyahub/infrastructure/repository/initialize_db.dart';
import '../../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final MockStateDB mockDb = MockStateDB();

  final MockInitializeDB initDb = MockInitializeDB();

  when(initDb.database()).thenAnswer(
    (Invocation realInvocation) => Future<MockStateDB>.value(mockDb),
  );

  final BeWellDatabaseMobile<MockStateDB> db =
      BeWellDatabaseMobile<MockStateDB>(initializeDB: initDb);

  Future<List<Map<String, Object?>>> returnVal(int count) =>
      Future<List<Map<String, Object?>>>.value(<Map<String, Object?>>[
        <String, Object?>{'users': count}
      ]);

  test('should call initialize and clear database : mock', () {
    expect(() => InitializeDB<MockStateDB>(dbName: 'test_db'), returnsNormally);
    expect(
      () => InitializeDB<MockStateDB>(dbName: 'test_db')
          .database(preInitializedDB: mockDb),
      returnsNormally,
    );

    final InitializeDB<MockStateDB> initDB =
        InitializeDB<MockStateDB>(dbName: 'test_db');

    final BeWellDatabaseMobile<MockStateDB> _db =
        BeWellDatabaseMobile<MockStateDB>(initializeDB: initDB);

    expect(_db.clearDatabase(), throwsException);
  });

  test('should throw exception on real state db. Missing plugin', () {
    expect(() => InitializeDB<MockStateDB>(dbName: 'test_db'), returnsNormally);
    expect(
      () => InitializeDB<MockStateDB>(dbName: 'test_db').database(),
      throwsException,
    );

    final InitializeDB<MockStateDB> initDB =
        InitializeDB<MockStateDB>(dbName: 'test_db');

    final BeWellDatabaseMobile<MockStateDB> _db =
        BeWellDatabaseMobile<MockStateDB>(initializeDB: initDB);

    expect(_db.clearDatabase(), throwsException);
  });

  test('countTableRecords should return 0 entries', () async {
    when(mockDb.rawQuery('SELECT COUNT(*) FROM users'))
        .thenAnswer((Invocation realInvocation) async => returnVal(10));
    expect(await db.countTableRecords('users'), 10);
  });

  group('isDatabaseEmpty', () {
    void buildWhenMock(String arg, int count) {
      when(mockDb.rawQuery('SELECT COUNT(*) FROM $arg'))
          .thenAnswer((_) => returnVal(count));
    }

    test('isDatabaseEmpty should return false', () async {
      buildWhenMock('credentials', 10);
      buildWhenMock('clientState', 10);
      buildWhenMock('onboardingState', 10);
      buildWhenMock('bottomNavigationState', 10);
      buildWhenMock('connectivityState', 10);
      buildWhenMock('miscState', 10);

      expect(await db.isDatabaseEmpty(), false);
    });

    test('isDatabaseEmpty should return true', () async {
      buildWhenMock('credentials', 0);
      buildWhenMock('clientState', 0);
      buildWhenMock('onboardingState', 0);
      buildWhenMock('bottomNavigationState', 0);
      buildWhenMock('connectivityState', 0);
      buildWhenMock('miscState', 0);

      expect(await db.isDatabaseEmpty(), true);
    });
  });

  test('retrieveWorker should return record from database', () async {
    when(
      mockDb.rawQuery(
        'SELECT * FROM credentials ORDER BY id DESC LIMIT 1',
      ),
    ).thenAnswer((_) => returnVal(10));
    expect(
      await db.retrieveWorker(Tables.credentials),
      <String, Object?>{'users': 10},
    );
  });

  test('retrieveState should return state from credentials table', () async {
    when(
      mockDb.rawQuery(
        'SELECT * FROM credentials ORDER BY id DESC LIMIT 1',
      ),
    ).thenAnswer(
      (_) => Future<List<Map<String, Object?>>>.value(<Map<String, Object?>>[
        <String, Object?>{
          'credentials':
              json.encode(<String, String>{'idToken': 'some-id-token'})
        }
      ]),
    );
    expect(
      await db.retrieveState(Tables.credentials),
      <String, String>{'idToken': 'some-id-token'},
    );
  });

  test('retrieveState should return state any unknown table', () async {
    when(mockDb.rawQuery('SELECT * FROM unknown ORDER BY id DESC LIMIT 1'))
        .thenAnswer(
      (_) => Future<List<Map<String, Object?>>>.value(<Map<String, Object?>>[
        <String, Object?>{
          'unknown': json.encode(<String, String>{'name': 'Vincent Michuki'})
        }
      ]),
    );
    expect(
      await db.retrieveState(Tables.unknown),
      <String, Object?>{'unknown': '{"name":"Vincent Michuki"}'},
    );
  });

  test('saveState should call rawInsert', () async {
    final String tableName = Tables.credentials.name;
    final Map<String, dynamic> data = <String, dynamic>{'name': 'Vincent'};
    final String query = 'INSERT INTO $tableName($tableName) VALUES(?)';
    when(mockDb.rawInsert(query, <dynamic>[jsonEncode(data)]))
        .thenAnswer((_) => Future<int>.value(10));
    await db.saveState(data: data, table: Tables.credentials);
    verify(await mockDb.rawInsert(query, <dynamic>[jsonEncode(data)]))
        .called(1);
  });
}
