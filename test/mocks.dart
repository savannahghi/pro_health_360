// Dart imports:
// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart' as core;
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_messaging_platform_interface/firebase_messaging_platform_interface.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/services/message_codec.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_local_notifications_platform_interface/flutter_local_notifications_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
// Project imports:
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/domain/core/entities/communities/group.dart';
import 'package:pro_health_360/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/infrastructure/repository/initialize_db.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

import 'mock_utils.dart';
import 'test_utils.dart';
import 'package:firebase_analytics_platform_interface/firebase_analytics_platform_interface.dart';

class MockInitializeDB extends Mock implements InitializeDB<MockStateDB> {
  @override
  Future<MockStateDB> database({MockStateDB? preInitializedDB}) =>
      super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: Future<MockStateDB>.value(MockStateDB()),
      ) as Future<MockStateDB>;

  @override
  String get dbName =>
      super.noSuchMethod(Invocation.getter(#dbName), returnValue: 'testDb')
          as String;
}

const String testString = 'test';

class MockClientState extends Mock implements stream.ClientState {}

class MockLogger extends Mock implements stream.Logger {}

class MockChannel extends Mock implements stream.Channel {
  @override
  Future<bool> get initialized async => true;
}

class MockConnectivityPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements ConnectivityPlatform {
  MockConnectivityPlatform({List<ConnectivityResult>? connectivityValues})
      : connectivityValues = connectivityValues ??
            <ConnectivityResult>[ConnectivityResult.mobile];

  final List<ConnectivityResult> connectivityValues;

  @override
  Future<ConnectivityResult> checkConnectivity() async {
    return connectivityValues.last;
  }

  @override
  Stream<ConnectivityResult> get onConnectivityChanged {
    return Stream<ConnectivityResult>.fromIterable(connectivityValues);
  }
}

class MockStateDB extends Mock implements Database {
  @override
  Batch batch() {
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  Future<int> delete(String table, {String? where, List<Object?>? whereArgs}) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeMethod<T>(String method, [dynamic arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeSqlMethod<T>(
    String method,
    String sql, [
    List<Object?>? arguments,
  ]) {
    throw UnimplementedError();
  }

  @override
  Future<void> execute(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<int> getVersion() {
    throw UnimplementedError();
  }

  @override
  Future<int> insert(
    String table,
    Map<String, Object?> values, {
    String? nullColumnHack,
    ConflictAlgorithm? conflictAlgorithm,
  }) {
    throw UnimplementedError();
  }

  @override
  bool get isOpen => true;

  @override
  String get path => 'test';

  @override
  Future<List<Map<String, Object?>>> query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawDelete(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawInsert(String sql, [List<Object?>? arguments]) =>
      super.noSuchMethod(
        Invocation.method(#rawInsert, <dynamic>[sql, arguments]),
        returnValue: Future<int>.value(10),
      ) as Future<int>;

  @override
  Future<List<Map<String, Object?>>> rawQuery(
    String sql, [
    List<Object?>? arguments,
  ]) =>
      super.noSuchMethod(
        Invocation.method(#rawQuery, <dynamic>[sql, arguments]),
        returnValue: Future<List<Map<String, Object?>>>.value(
          <Map<String, Object?>>[
            <String, Object?>{'users': 10}
          ],
        ),
      ) as Future<List<Map<String, Object?>>>;

  @override
  Future<int> rawUpdate(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<void> setVersion(int version) {
    throw UnimplementedError();
  }

  @override
  Future<T> transaction<T>(
    Future<T> Function(Transaction txn) action, {
    bool? exclusive,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<int> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
    ConflictAlgorithm? conflictAlgorithm,
  }) {
    throw UnimplementedError();
  }
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockBuildContext extends Mock implements BuildContext {}

class MockTextEditingController extends Mock implements TextEditingController {}

typedef OnObservation = void Function(
  Route<dynamic>? route,
  Route<dynamic>? previousRoute,
);

class TestNavigatorObserver extends NavigatorObserver {
  TestNavigatorObserver({this.onPop, this.onPush});

  final OnObservation? onPop;
  final OnObservation? onPush;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      onPop?.call(route, previousRoute);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPush?.call(route, previousRoute);
  }
}

/// a short client for providing custom responses
///
/// a good use case is when you want to return error responses
class MockShortGraphQlClient extends IGraphQlClient {
  MockShortGraphQlClient();
  MockShortGraphQlClient.withResponse(
    String idToken,
    String endpoint,
    this.response,
  ) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  late final http.Response response;

  @override
  Future<http.Response> callRESTAPI({
    required String endpoint,
    required String method,
    Map<String, dynamic>? variables,
  }) {
    return Future<http.Response>.value(response);
  }

  @override
  Future<http.Response> query(
    String queryString,
    Map<String, dynamic> variables, [
    ContentType contentType = ContentType.json,
  ]) {
    return Future<http.Response>.value(response);
  }
}

class MockGraphQlClient extends Mock implements GraphQlClient {
  String removeUserAsExperimenterVariables =
      json.encode(<String, dynamic>{'participate': false});

  String sendOTPTesterVariables =
      json.encode(<String, dynamic>{'phone': testPhoneNumber});

  String setupUserAsExperimenterVariables =
      json.encode(<String, dynamic>{'participate': true});

  @override
  Future<http.Response> callRESTAPI({
    required String endpoint,
    required String method,
    Map<String, dynamic>? variables,
  }) {
    if (endpoint.contains('login_by_phone')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(mockLoginResponse),
          201,
        ),
      );
    }

    if (endpoint.contains('request_pin_reset')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, String>{
              'otp': '6969',
              'phoneNumber': '+25471123123',
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('user_recovery_phonenumbers')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{'otp': '6969'},
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('verify_phone')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'isNewUser': false,
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('upload')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'id': '1r1idoAs54kbZ90l9KkHSK7GKva',
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('reset_pin')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(true),
          201,
        ),
      );
    }

    if (endpoint.contains('verify_otp')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(true),
          201,
        ),
      );
    }

    if (endpoint.contains('send_otp')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode('123456'),
          201,
        ),
      );
    }

    if (endpoint.contains('send_retry_otp')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode('123456'),
          201,
        ),
      );
    }

    if (endpoint.contains('create_user_by_phone')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'userCreated': true,
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('refresh_token')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'expiresIn': '3600',
              'idToken': 'some-id-token',
              'refreshToken': 'some-refresh-token'
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('refresh_getstream_token')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'idToken': 'some-id-token',
            },
          ),
          201,
        ),
      );
    }

    return Future<http.Response>.value(
      http.Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              // add your data here
            }
          },
        ),
        201,
      ),
    );
  }

  @override
  String? parseError(Map<String, dynamic>? body) {
    const String errString =
        'Oops!!! Something wrong just happened. If this persists, log out and login again';
    if (body == null) {
      return errString;
    }
    Object? error;
    if (body.containsKey('errors')) {
      error = body['errors'];
    } else if (body.containsKey('error')) {
      error = body['error'];
    } else {
      error = null;
    }
    if (error is String) {
      return error.contains('ID token')
          ? 'Oops!!! Something wrong just happened. If this persists, log out and login again'
          : error;
    }
    if (error is List<dynamic>) {
      // ignore: avoid_dynamic_calls
      return error[0]['message'] as String;
    }
    if (error is Map) {
      return error.toString();
    }
    return null;
  }

  @override
  Future<http.Response> query(
    String queryString,
    Map<String, dynamic> variables, [
    ContentType contentType = ContentType.json,
  ]) {
    if (queryString.contains(patientTimelineQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': mockHealthTimelineItems,
            },
          ),
          200,
        ),
      );
    }

    if (json.encode(variables) == sendOTPTesterVariables) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'otp': testOTP,
                'phoneNumber': testPhoneNumber,
              }
            },
          ),
          200,
        ),
      );
    }

    if (queryString.contains('UpdateProfile')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'updateProfile': true}
          }),
          201,
        ),
      );
    }

    if (queryString.contains('unreadPersistentItems')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'unreadPersistentItems': 3}
          }),
          201,
        ),
      );
    }

    if (queryString.contains('generateOTP')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'generateOTP': '1234'}
          }),
          201,
        ),
      );
    }

    if (queryString.contains('emailVerificationOTP')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'emailVerificationOTP': '1234'}
          }),
          201,
        ),
      );
    }
    if (queryString.contains('verifyMSISDNandPIN')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'verifyMSISDNandPIN': true}
          }),
          201,
        ),
      );
    }

    if (queryString.contains('updateUserPIN')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'updateUserPIN': true},
          }),
          201,
        ),
      );
    }

    if (queryString.contains('generateRetryOTP')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'generateRetryOTP': '1234'},
          }),
          201,
        ),
      );
    }

    if (queryString.contains('completeSignup')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'completeSignup': true},
          }),
          201,
        ),
      );
    }

    if (queryString.contains('updateUserProfile')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'updateUserProfile': <String, dynamic>{
                'userBioData': <String, dynamic>{
                  'firstName': 'John',
                  'lastName': 'Doe',
                  'gender': 'male',
                  'dateOfBirth': '2000-01-01'
                }
              }
            },
          }),
          201,
        ),
      );
    }

    if (queryString.contains('userProfile')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'userProfile': true,
            },
          }),
          201,
        ),
      );
    }

    if (queryString == getHealthDiaryEntriesQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getClientHealthDiaryEntries': mockDiaryEntries,
              },
            },
          ),
          201,
        ),
      );
    }

    if (queryString == updateClientCaregiverMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'createOrUpdateClientCaregiver': true}
            },
          ),
          201,
        ),
      );
    }

    if (queryString == retrieveFacilityQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'retrieveFacility': <String, dynamic>{
                  'ID': 'some-id',
                  'name': 'name',
                  'code': 1111,
                  'county': 'Nairobi',
                  'active': true,
                  'phone': '+254712345678',
                  'description': 'name Hospital'
                }
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('canrecordmood')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'canRecordMood': true,
            },
          }),
          201,
        ),
      );
    }

    if (queryString.contains('userProfile')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'userProfile': true,
            },
          }),
          201,
        ),
      );
    }

    if (queryString == getContentQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getContent': <String, dynamic>{
                  'items': <dynamic>[contentMock.first]
                },
              },
            },
          ),
          201,
        ),
      );
    }
    if (queryString == getFAQsQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getFAQs': <String, dynamic>{
                  'items': <dynamic>[contentMock.first]
                },
              },
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('fetchSuggestedGroups')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'fetchSuggestedGroups': mockSuggestions,
              },
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('getEmptyFAQ')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'getFaqsContent': <dynamic>[]}
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('getErrorFAQ')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{'error': 'no FAQ'}), 201),
      );
    }

    if (queryString.contains('resendOTP')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'resendOTP': true,
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('sendOTP')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'sendOTP': true,
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('getTimeoutErrorFAQ')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{'error': 'timeout'}), 201),
      );
    }

    if (queryString.contains('getNullFAQ')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{}), 401),
      );
    }

    if (queryString.contains('createMemberProfileRequest')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'createMemberProfileRequest': <String, dynamic>{'state': 'DRAFT'}
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains('upload')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'upload': <String, dynamic>{
                'id': 'uploadID',
              },
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains('getEmptyLibrary')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'getLibraryContent': <dynamic>[]}
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('getErrorLibrary')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{'error': 'no FAQ'}), 201),
      );
    }

    if (queryString.contains('getTimeoutErrorLibrary')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{'error': 'timeout'}), 201),
      );
    }

    if (queryString.contains('setUserCommunicationsSettings')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'setUserCommunicationsSettings': <String, dynamic>{
                'allowWhatsApp': true,
                'allowPush': false,
                'allowEmail': true,
                'allowTextSMS': true
              }
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains('getMemberRequestByPhoneNumber')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getMemberRequestByPhoneNumber': <dynamic>[]
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains('getNullLibrary')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{'data': null}), 401),
      );
    }

    //set User PIN
    if (queryString == setUserPINMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'setUserPIN': true}
          }),
          201,
        ),
      );
    }

    //setNickname
    if (queryString == setNickNameMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'setNickName': true}
          }),
          201,
        ),
      );
    }

    if (queryString == completeOnboardingTourMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'completeOnboardingTour': true}
          }),
          201,
        ),
      );
    }

    if (queryString == getTermsQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getCurrentTerms': termsMock,
            }
          }),
          200,
        ),
      );
    }

    if (queryString == checkIfUserHasLikedContentQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'checkIfUserHasLikedContent': true,
            }
          }),
          200,
        ),
      );
    }

    if (queryString == getClientCaregiverQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getClientCaregiver': <String, dynamic>{
                'firstName': 'Jac',
                'lastName': 'Dough',
                'phoneNumber': '+254712344679',
                'caregiverType': 'SIBLING'
              }
            }
          }),
          200,
        ),
      );
    }

    if (queryString == checkIfUserBookmarkedContentQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'checkIfUserBookmarkedContent': false,
            }
          }),
          200,
        ),
      );
    }

    if (queryString == canRecordMoodQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'canRecordMood': true,
            }
          }),
          200,
        ),
      );
    }

    if (queryString == medicalDataQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': mockMedicalDataResponse}),
          200,
        ),
      );
    }

    if (queryString == searchObservationsQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': mockViralLoadDataResponse}),
          200,
        ),
      );
    }

    if (queryString == optOutMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'optOut': true,
            }
          }),
          200,
        ),
      );
    }
    if (queryString == getScreeningToolsQuestionsQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getScreeningToolQuestions': <dynamic>[
                <String, dynamic>{
                  'id': 'some_id',
                  'question': 'some question here',
                  'toolType': 'VIOLENCE_ASSESSMENT',
                  'responseType': 'INTEGER',
                  'responseChoices': <String, dynamic>{'0': 'Yes', '1': 'No'},
                  'responseCategory': 'SINGLE_CHOICE',
                  'sequence': 0,
                  'active': true,
                  'meta': <String, dynamic>{'violence_type': 'EMOTIONAL'}
                },
              ]
            }
          }),
          200,
        ),
      );
    }
    if (queryString == answerScreeningToolQuestionMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'answerScreeningToolQuestion': true}
            },
          ),
          200,
        ),
      );
    }
    if (queryString == getAvailableScreeningToolQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getAvailableScreeningToolQuestions': <dynamic>[
                <String, dynamic>{'toolType': 'VIOLENCE_ASSESSMENT'},
              ]
            }
          }),
          200,
        ),
      );
    }
    if (queryString == getUserSurveyFormsQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getUserSurveyForms': <dynamic>[
                <String, dynamic>{
                  'id': '725d719d-d720-47d0-860e-64b8431a4cad',
                  'link': 'https://mycarehub.org',
                  'title': 'phq9',
                  'description': 'description'
                },
              ]
            }
          }),
          200,
        ),
      );
    }
    if (queryString == listAppointmentsQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'fetchClientAppointments': <String, dynamic>{
                'appointments': mockAppointments,
              }
            }
          }),
          200,
        ),
      );
    }
    if (queryString == rescheduleAppointmentMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'rescheduleAppointment': true,
            }
          }),
          200,
        ),
      );
    }
    if (queryString == acceptInvitationMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'acceptInvitation': true,
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString == rejectInvitationMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'rejectInvitation': true,
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString == shareHealthDiaryEntryMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'shareHealthDiaryEntry': true,
            }
          }),
          200,
        ),
      );
    }

    if (queryString.contains(listNotificationsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': mockNotificationsResponse}),
          201,
        ),
      );
    }
    if (queryString.contains(getCategoriesQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'listContentCategories': categoriesMock,
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(readNotificationsMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'readNotifications': true,
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(viewContentMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'viewContent': true,
              }
            },
          ),
          201,
        ),
      );
    }

    return Future<http.Response>.value(
      http.Response(
        json.encode(<String, dynamic>{'data': <String, dynamic>{}}),
        200,
      ),
    );
  }

  @override
  Map<String, dynamic> toMap(http.Response? response) {
    final dynamic _res = json.decode(response!.body);

    if (_res is Map) return _res as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    return _res[0] as Map<String, dynamic>;
  }
}

/// Please refer to:
///
///  https://developer.android.com/training/multiscreen/screendensities#dips-pels
const Size typicalPhoneScreenSizePortrait = Size(320, 480);
const Size typicalPhoneScreenSizeLandscape = Size(480, 320);

const Size mediumSizedTabletPortrait = Size(600, 1024);
const Size mediumSizedTabletLandscape = Size(1024, 600);

const Size tabletPortrait = Size(720, 1280);
const Size tabletLandscape = Size(1280, 720);
const Size typicalLargePhoneScreenSizePortrait = Size(300, 800);

List<Map<String, dynamic>> mockFilterItems = <Map<String, dynamic>>[
  <String, dynamic>{
    'filterIcon': Icons.grid_view_sharp,
    'filterText': 'All',
  },
  <String, dynamic>{
    'filterIcon': Icons.lightbulb_rounded,
    'filterText': 'Recommended',
  },
  <String, dynamic>{
    'filterIcon': Icons.grid_view_sharp,
    'filterText': 'Exercise',
  },
  <String, dynamic>{
    'filterIcon': Icons.fastfood_outlined,
    'filterText': 'diet',
  },
];

List<Map<String, dynamic>> mockSuggestions = <Map<String, dynamic>>[
  <String, dynamic>{
    'avatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'members': '20',
    'name': 'Ruaraka'
  },
  <String, dynamic>{
    'avatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'members': '50',
    'name': 'Mental health'
  },
];

Map<String, dynamic> mockIconDetails = <String, dynamic>{
  'url': shieldIconImgUrl
};

Map<String, dynamic> mockNotificationActions = <String, dynamic>{
  'name': 'Calendar',
  'route': ' ',
  'icon': mockIconDetails
};

Map<String, dynamic> mockNotification = <String, dynamic>{
  'description':
      'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join ',
  'createdAt': '2022-04-28T07:00:20Z',
  'type': 'APPOINTMENT',
  'actions': <dynamic>[mockNotificationActions],
  'status': 'Missed',
  'id': 'some-id',
};

Map<String, dynamic> mockNotificationsResponse = <String, dynamic>{
  'fetchNotifications': <String, dynamic>{
    'notifications': <dynamic>[
      mockNotification,
      <String, dynamic>{
        'id': 'some-id',
        'title': 'title',
        'type': 'SERVICE_REQUEST',
        'body':
            'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join ',
        'isRead': false,
        'createdAt': '2022-04-28T07:00:20Z',
        'actions': <dynamic>[mockNotificationActions],
        'status': 'Missed'
      },
    ]
  }
};

final List<dynamic> mockAppointments = <dynamic>[
  <String, dynamic>{
    'ID': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': false
  },
  <String, dynamic>{
    'ID': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': true
  },
  <String, dynamic>{
    'ID': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': false
  },
  <String, dynamic>{
    'ID': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': true
  },
  <String, dynamic>{
    'ID': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': false
  },
  <String, dynamic>{
    'ID': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': true
  },
  <String, dynamic>{
    'ID': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': false
  },
  <String, dynamic>{
    'ID': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': true
  },
  <String, dynamic>{
    'ID': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': false
  },
  <String, dynamic>{
    'ID': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': true
  },
  <String, dynamic>{
    'ID': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': false
  },
  <String, dynamic>{
    'ID': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': true
  },
  <String, dynamic>{
    'ID': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': false
  },
  <String, dynamic>{
    'ID': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': true
  },
  <String, dynamic>{
    'ID': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': false
  },
  <String, dynamic>{
    'ID': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': true
  },
  <String, dynamic>{
    'ID': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': false
  },
  <String, dynamic>{
    'ID': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': true
  },
  <String, dynamic>{
    'ID': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': false
  },
  <String, dynamic>{
    'ID': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': true
  },
  <String, dynamic>{
    'ID': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': false
  },
  <String, dynamic>{
    'ID': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'HasRescheduledAppointment': true
  },
];

Map<String, dynamic> mockBottomNavigationState = <String, dynamic>{
  'currentBottomNavIndex': 0,
};

Map<String, dynamic> mockSecurityQuestion = <String, dynamic>{
  'SecurityQuestionID': 'id',
  'QuestionStem': 'question_stem',
  'Description': 'description',
  'ResponseType': core.SecurityQuestionResponseType.UNKNOWN.name,
  'Active': true,
};

final List<dynamic> securityQuestionsMock = <dynamic>[
  <String, dynamic>{
    'SecurityQuestionID': 'id1',
    'QuestionStem': 'What are the last 4 digits of your CCC number?',
    'Description': 'Please provide the last 4 digits of your clinic number',
    'ResponseType': core.SecurityQuestionResponseType.UNKNOWN.name,
    'Active': true,
  },
  <String, dynamic>{
    'SecurityQuestionID': 'id2',
    'QuestionStem': 'Which month did you start your treatment?',
    'Description': 'Enter the month you started your treatment',
    'ResponseType': core.SecurityQuestionResponseType.DATE.name,
    'Active': true,
  },
  <String, dynamic>{
    'SecurityQuestionID': 'id3',
    'QuestionStem': 'Which county is your clinic located?',
    'Description': 'enter the name of the county in small letters',
    'ResponseType': core.SecurityQuestionResponseType.UNKNOWN.name,
    'Active': true,
  },
];

Map<String, dynamic> mockSecurityQuestionsData = <String, dynamic>{
  'getSecurityQuestions': securityQuestionsMock
};

final List<dynamic> recordSecurityQuestionResponseMock = <dynamic>[
  <String, dynamic>{'securityQuestionID': 'id1', 'isCorrect': true},
  <String, dynamic>{'SecurityQuestionID': 'id2', 'isCorrect': true},
  <String, dynamic>{'SecurityQuestionID': 'id3', 'isCorrect': true},
];

Map<String, dynamic> mockRecordSecurityQuestionResponseData = <String, dynamic>{
  'recordSecurityQuestionResponses': recordSecurityQuestionResponseMock
};

Map<String, dynamic> mockSecurityQuestionResponse = <String, dynamic>{
  'userID': 'userId',
  'securityQuestionID': 'securityQuestionId',
  'response': 'response',
};

Map<String, dynamic> mockFAQContentResponse = <String, dynamic>{
  'getFAQContent': <dynamic>[
    mockFAQContent,
  ]
};

Map<String, dynamic> mockFAQContent = <String, dynamic>{
  'ID': 'id',
  'Active': true,
  'Title': 'title',
  'Body': 'body',
  'Description': 'description',
  'Flavour': core.Flavour.consumer.name,
};

final Map<String, dynamic> termsMock = <String, dynamic>{
  'termsID': 0,
  'text': 'Terms will be available here soon'
};

final Map<String, dynamic> mockLoginResponse = <String, dynamic>{
  'code': 0,
  'message': 'success',
  'response': <String, dynamic>{
    'credentials': <String, dynamic>{
      'expiresIn': '3600',
      'idToken': 'some id token',
      'refreshToken': 'some-refresh-token'
    },
    'clientProfile': <String, dynamic>{
      'active': true,
      'addresses': <Map<String, dynamic>>[
        <String, dynamic>{
          'active': true,
          'addressType': 'POSTAL',
          'country': 'Kenya',
          'county': null,
          'postalCode': '00300',
          'text': 'One Padmore'
        }
      ],
      'clientCounselled': true,
      'clientType': 'PMTCT',
      'facilityID': 'some-facility-id',
      'relatedPersons': <Map<String, dynamic>>[
        <String, dynamic>{
          'active': true,
          'dateOfBirth': '21 Nov 2002',
          'firstName': 'Juha',
          'gender': 'MALE',
          'lastName': 'Kalulu',
          'otherName': null,
          'relatedTo': 'some-user-id',
          'relationshipType': 'NEXT_OF_KIN',
          'addresses': <Map<String, dynamic>>[
            <String, dynamic>{
              'active': true,
              'addressType': 'POSTAL',
              'country': 'Kenya',
              'county': null,
              'postalCode': '00300',
              'text': 'One Padmore'
            }
          ],
          'primaryContact': <String, dynamic>{
            'active': true,
            'contact': '+254717356476',
            'contactType': 'PHONE',
            'optedIn': true
          },
          'secondaryContacts': <Map<String, dynamic>>[
            <String, dynamic>{
              'active': true,
              'contact': '+254717356476',
              'contactType': 'PHONE',
              'optedIn': true
            }
          ]
        }
      ],
      'treatmentBuddy': null,
      'treatmentEnrollmentDate': '21 Nov 2021',
      'user': <String, dynamic>{
        'active': true,
        'name': 'Juha Kalulu',
        'firstName': 'Juha',
        'gender': 'MALE',
        'languages': <String>['en', 'sw'],
        'suspended': false,
        'avatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
        'primaryContact': <String, dynamic>{
          'active': true,
          'contact': '+254717356476',
          'contactType': 'PHONE',
          'optedIn': true
        },
        'secondaryContacts': <Map<String, dynamic>>[
          <String, dynamic>{
            'active': true,
            'contact': '+254717356476',
            'contactType': 'PHONE',
            'optedIn': true
          }
        ],
        'lastName': 'Kalulu',
        'pinChangeRequired': false,
        'termsAccepted': false,
        'userID': 'some-user-id',
        'userName': 'Kowalski',
        'userType': 'CLIENT',
        'dateOfBirth': '21 Nov 2002',
      },
    },
    'getStreamToken': 'some-test-token',
  }
};

final core.Content mockVideoContent =
    core.Content.fromJson(videoContentMock.first);

final Map<String, dynamic> mockAudioContent = <String, dynamic>{
  'ID': 11,
  'title': 'Tips on how to keep yourself healthy',
  'date': '2021-08-23T06:42:05.085216Z',
  'intro': 'Keep yourself healthy',
  'authorName': 'Abiud Orina',
  'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
  'author': <String, dynamic>{'ID': 'some-id'},
  'itemType': 'AUDIO_VIDEO',
  'timeEstimateSeconds': 180,
  'featuredMedia': <dynamic>[
    <String, dynamic>{
      'ID': 1,
      'title': 'Test Document',
      'date': '2022-01-13',
      'intro': 'This is a test document',
      'authorName': 'Test',
      'tagNames': <String>['test'],
      'url': 'test.mp3',
      'type': 'audio',
      'thumbnail':
          'https://storage.googleapis.com/mycarehub-test/media/media_thumbnails/vitalii-pavlyshynets-kcRFW-Hje8Y-unsplash_1.jpg',
    }
  ],
  'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
  'meta': <String, dynamic>{
    'contentHTMLURL': 'https://mycarehub.co.ke/',
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
  },
};

final Map<String, dynamic> documentContentMock = <String, dynamic>{
  'ID': 16,
  'title': 'Test Document',
  'date': '2022-01-13',
  'intro': 'This is a test document',
  'authorName': 'Test',
  'tagNames': <String>['test'],
  'meta': <String, dynamic>{
    'contentType': 'content.ContentItem',
    'contentHTMLURL': 'http://test-document/',
    'slug': 'test-document',
    'showInMenus': false,
    'seoTitle': '',
    'searchDescription': '',
    'firstPublishedAt': '2022-01-13T11:36:56.749531+03:00',
    'locale': 'en'
  },
  'itemType': 'PDF_DOCUMENT',
  'timeEstimateSeconds': 10,
  'body': '''
<p data-block-key="sg8u8">Test document</p>''',
  'heroImage': <String, dynamic>{'ID': 14, 'title': 'document'},
  'heroImageRendition': <String, dynamic>{
    'url': 'https://test.jpg',
    'width': 720,
    'height': 1080,
    'alt': 'document'
  },
  'likeCount': 0,
  'bookmarkCount': 0,
  'viewCount': 0,
  'shareCount': 0,
  'author': <String, dynamic>{'ID': 'test-id-001'},
  'documents': <Map<String, dynamic>>[
    <String, dynamic>{
      'ID': 10001,
      'Document': <String, dynamic>{
        'ID': 10001,
        'title': 'ProHealth360 Requirements',
        'meta': <String, dynamic>{
          'documentDetailUrl':
              'http://www.africau.edu/images/default/sample.pdf',
          'documentDownloadUrl':
              'http://www.africau.edu/images/default/sample.pdf'
        }
      }
    }
  ],
  'categoryDetails': <Map<String, dynamic>>[
    <String, dynamic>{
      'ID': 6,
      'categoryName': 'recommended',
      'categoryIcon': 'https://test.png'
    }
  ],
};
final Map<String, dynamic> contentEngagementMock = <String, dynamic>{
  'contentId': 1,
  'contentOpenedAt': '2021-01-01'
};

final Map<String, dynamic> mockGalleryImage = <String, dynamic>{
  'id': 2,
  'image': <String, dynamic>{
    'title': 'mockImage',
    'meta': <String, String>{'imageDownloadUrl': 'testImage'}
  }
};
final core.Content mockContent = core.Content.fromJson(contentMock.first);

final List<Map<String, dynamic>> contentMock = <Map<String, dynamic>>[
  <String, dynamic>{
    'ID': 1,
    'title': 'Tips on how to keep yourself healthy',
    'date': '2021-08-23T06:42:05.085216Z',
    'intro': 'Keep yourself healthy',
    'authorName': 'Abiud Orina',
    'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'author': <String, dynamic>{'ID': 'some-id'},
    'itemType': 'ARTICLE',
    'timeEstimateSeconds': 180,
    'body':
        'The coronavirus pandemic has affected our lives, our economy, and nearly every corner of the globe. Almost 4 billion vaccine doses have been administered worldwide; 53 for every 100 people. But the worldwide numbers of infections continue to rise, driven by the Delta variant with highly vaccinated regions like Western Europe and the United States, where cases are relatively low but climbing fast. As cases continue to surge, you can take some steps to keep yourself and your family safe. Here are some tips from our trusted science team.',
    'heroImageRendition': <String, dynamic>{
      'url': 'https://i.postimg.cc/zvW46yxk/wellness.jpg',
    },
    'likeCount': 180,
    'bookmarkCount': 180,
    'viewCount': 180,
    'shareCount': 180,
    'hasSaved': false,
    'hasLiked': false,
    'documents': <dynamic>[],
    'isNew': true,
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    'meta': <String, dynamic>{
      'contentHTMLURL': 'https://mycarehub.co.ke/',
      'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    },
    'tagNames': <String>['Recommended', 'Health', 'Fitness'],
    'featuredMedia': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 7,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/Background_Music_Soft_Piano_Music.aac',
        'title': 'Background',
        'type': 'audio',
        'width': 0,
        'duration': 6,
        'height': 0,
        'thumbnail': ''
      }
    ]
  },
  <String, dynamic>{
    'ID': 12,
    'title': 'Test article',
    'date': '2022-01-06',
    'intro': 'This is a test article',
    'authorName': 'John Ngugi',
    'tagNames': <String>['test'],
    'meta': <String, dynamic>{
      'contentType': 'content.ContentItem',
      'contentHTMLURL':
          'http://mycarehub-stage.savannahghi.org/health-education/test-article/',
      'slug': 'test-article',
      'showInMenus': false,
      'seoTitle': '',
      'searchDescription': '',
      'firstPublishedAt': '2022-01-06T09:18:42.024393+03:00',
      'locale': 'en'
    },
    'itemType': 'AUDIO_VIDEO',
    'timeEstimateSeconds': 6,
    'body': '<p data-block-key="9gd2w">Test article</p>',
    'heroImage': <String, dynamic>{'ID': 10, 'title': 'sunbeds3'},
    'heroImageRendition': <String, dynamic>{
      'url':
          'https://storage.googleapis.com/mycarehub-test/media/images/sunbeds3_VNXQPgI.2e16d0ba.fill-800x1200.jpegquality-60.jpg',
      'width': 800,
      'height': 1200,
      'alt': 'sunbeds3'
    },
    'likeCount': 6,
    'bookmarkCount': 2,
    'viewCount': 0,
    'shareCount': 1,
    'author': <String, dynamic>{'ID': 'cd92a709-c397-4b04-a963-709eb7e08486'},
    'categoryDetails': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 6,
        'categoryName': 'recommended',
        'categoryIcon': ''
      }
    ],
    'featuredMedia': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 2,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/Background_Music_Soft_Piano_Music_ppKS2s4.aac',
        'title': 'soft_piano_music',
        'type': 'audio',
        'duration': 141,
        'width': 0,
        'height': 0,
        'thumbnail': ''
      }
    ],
    'galleryImages': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 1,
        'image': <String, dynamic>{
          'ID': 8,
          'title': 'Contrail',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/jake-nackos-zAeD6Gug2PY-unsplash_IXYJr4K.jpg'
          }
        }
      },
      <String, dynamic>{
        'ID': 2,
        'image': <String, dynamic>{
          'ID': 7,
          'title': 'Plane_with_background',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/vino-li-kpcJgsvpY3Q-unsplash_9w4CILs.jpg'
          }
        }
      },
      <String, dynamic>{
        'ID': 3,
        'image': <String, dynamic>{
          'ID': 9,
          'title': 'sunbeds3',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/valentin-b-kremer-icXbm3QDw2w-unsplash_YNcTzbk.jpg'
          }
        }
      },
      <String, dynamic>{
        'ID': 4,
        'image': <String, dynamic>{
          'ID': 11,
          'title': 'syringe',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/mika-baumeister-fPE_qTJu3Ws-unsplash_4NqBMVN.jpg'
          }
        }
      }
    ],
  },
  <String, dynamic>{
    'ID': 1,
    'title': 'Tips on how to keep yourself healthy',
    'date': '2021-08-23T06:42:05.085216Z',
    'intro': 'Keep yourself healthy',
    'authorName': 'Abiud Orina',
    'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'author': <String, dynamic>{'ID': 'some-id'},
    'itemType': 'ARTICLE',
    'timeEstimateSeconds': 180,
    'body':
        'The coronavirus pandemic has affected our lives, our economy, and nearly every corner of the globe. Almost 4 billion vaccine doses have been administered worldwide; 53 for every 100 people. But the worldwide numbers of infections continue to rise, driven by the Delta variant with highly vaccinated regions like Western Europe and the United States, where cases are relatively low but climbing fast. As cases continue to surge, you can take some steps to keep yourself and your family safe. Here are some tips from our trusted science team.',
    'heroImageRendition': <String, dynamic>{
      'url': 'https://i.postimg.cc/zvW46yxk/wellness.jpg',
    },
    'likeCount': 180,
    'bookmarkCount': 180,
    'viewCount': 180,
    'shareCount': 180,
    'hasSaved': false,
    'hasLiked': false,
    'documents': <dynamic>[],
    'isNew': true,
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    'meta': <String, dynamic>{
      'contentHTMLURL': 'https://mycarehub.co.ke/',
      'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    },
    'tagNames': <String>['Recommended', 'Health', 'Fitness'],
    'featuredMedia': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 7,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/Background_Music_Soft_Piano_Music.aac',
        'title': 'Background',
        'type': 'audio',
        'width': 0,
        'duration': 6,
        'height': 0,
        'thumbnail': ''
      }
    ],
    'galleryImages': <Map<String, dynamic>>[
      mockGalleryImage,
      mockGalleryImage,
      mockGalleryImage,
      mockGalleryImage,
      mockGalleryImage,
    ],
  },
];

final List<Map<String, dynamic>> videoContentMock = <Map<String, dynamic>>[
  <String, dynamic>{
    'ID': 1,
    'title': 'Tips on how to keep yourself healthy',
    'date': '2021-08-23T06:42:05.085216Z',
    'intro': 'Keep yourself healthy',
    'authorName': 'Abiud Orina',
    'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'author': <String, dynamic>{'ID': 'some-id'},
    'itemType': 'AUDIO_VIDEO',
    'timeEstimateSeconds': 180,
    'body':
        'The coronavirus pandemic has affected our lives, our economy, and nearly every corner of the globe. Almost 4 billion vaccine doses have been administered worldwide; 53 for every 100 people. But the worldwide numbers of infections continue to rise, driven by the Delta variant with highly vaccinated regions like Western Europe and the United States, where cases are relatively low but climbing fast. As cases continue to surge, you can take some steps to keep yourself and your family safe. Here are some tips from our trusted science team.',
    'heroImageRendition': <String, dynamic>{
      'url': 'https://i.postimg.cc/zvW46yxk/wellness.jpg',
    },
    'likeCount': 180,
    'bookmarkCount': 180,
    'viewCount': 180,
    'shareCount': 180,
    'hasSaved': false,
    'hasLiked': false,
    'documents': <dynamic>[],
    'isNew': true,
    'featuredMedia': <dynamic>[
      <String, dynamic>{
        'ID': 1,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/production_ID_4473012.mp4',
        'title': 'Awesome diet video',
        'type': 'video',
        'duration': 165,
        'width': 100,
        'height': 0,
        'thumbnail':
            'https://storage.googleapis.com/mycarehub-test/media/media_thumbnails/vitalii-pavlyshynets-kcRFW-Hje8Y-unsplash_1.jpg',
      }
    ],
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    'meta': <String, dynamic>{
      'contentHTMLURL': 'https://mycarehub.co.ke/',
      'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    },
    'tagNames': <String>['Recommended', 'Health', 'Fitness'],
  },
];

final List<Map<String, dynamic>> categoriesMock = <Map<String, dynamic>>[
  <String, dynamic>{
    'id': 2,
    'name': 'recommended',
    'iconUrl': 'test-image.png',
  },
  <String, dynamic>{
    'id': 1,
    'name': 'welcome',
    'iconUrl': 'test-image.png',
  },
  <String, dynamic>{
    'id': 3,
    'name': 'exercise',
    'iconUrl': 'test-image.png',
  },
  <String, dynamic>{
    'id': 4,
    'name': 'diet',
    'iconUrl': 'test-image.png',
  },
  <String, dynamic>{
    'id': 10002,
    'name': 'consumer-faqs',
    'iconUrl': 'test-image.png',
  }
];

final List<Map<String, dynamic>> mockDiaryEntries = <Map<String, dynamic>>[
  <String, dynamic>{
    'active': true,
    'mood': 'HAPPY',
    'note': 'I am healthy',
    'entryType': 'HOME_PAGE_HEALTH_DIARY_ENTRY',
    'createdAt': '2021-11-30T16:17:57Z',
    'shareWithHealthWorker': false,
    'sharedAt': DateTime.now().subtract(const Duration(hours: 5)).toString()
  },
  <String, dynamic>{
    'active': true,
    'mood': 'HAPPY',
    'note': 'I am very healthy',
    'entryType': 'HOME_PAGE_HEALTH_DIARY_ENTRY',
    'createdAt': '2021-11-30T16:17:53Z',
    'sharedAt': DateTime.now().subtract(const Duration(minutes: 10)).toString()
  },
  <String, dynamic>{
    'active': true,
    'mood': 'HAPPY',
    'note': 'I am very healthy',
    'entryType': 'HOME_PAGE_HEALTH_DIARY_ENTRY',
    'createdAt': '2021-11-30T16:17:53Z',
    'sharedAt': DateTime.now().subtract(const Duration(minutes: 10)).toString()
  },
];

final Map<String, dynamic> mockCommunitiesState = <String, dynamic>{
  'invitedCommunities': <dynamic>[
    <String, dynamic>{
      'id': core.UNKNOWN,
      'name': core.UNKNOWN,
      'memberCount': 0,
      'description': core.UNKNOWN,
      'createdBy': <String, dynamic>{
        'id': core.UNKNOWN,
        'userID': core.UNKNOWN,
        'role': core.UNKNOWN,
        'username': core.UNKNOWN,
        'gender': core.Gender.unknown.name,
      },
    },
  ]
};

final Group mockGroup = Group(
  name: testString,
  avatar: 'https://i.postimg.cc/9XpbrC25/profile-image.png',
  id: testString,
  memberCount: 0,
);

final Map<String, dynamic> mockOnboardingState = <String, dynamic>{
  'termsAndConditions': TermsAndConditions.initial().toJson(),
  'securityQuestions': <Map<String, dynamic>>[
    core.SecurityQuestion.initial().toJson(),
  ],
  'securityQuestionResponses': <Map<String, dynamic>>[
    core.SecurityQuestionResponse.initial().toJson(),
  ],
};

final Map<String, dynamic> mockAddress = <String, dynamic>{
  'active': true,
  'addressType': 'POSTAL',
  'country': 'Kenya',
  'county': null,
  'postalCode': '00300',
  'text': 'One Padmore'
};

final Map<String, dynamic> mockCommunity = <String, dynamic>{
  'id': core.UNKNOWN,
  'name': core.UNKNOWN,
  'memberCount': 0,
  'description': core.UNKNOWN,
  'ageRange': <String, dynamic>{
    'lowerBound': 14,
    'upperBound': 20,
  },
  'createdBy': <String, dynamic>{
    'id': core.UNKNOWN,
    'userID': core.UNKNOWN,
    'role': core.UNKNOWN,
    'username': core.UNKNOWN,
    'gender': core.Gender.unknown.name,
    'userType': core.UserType.CLIENT.name,
  },
  'clientType': <String>['PMTCT']
};

final Map<String, dynamic> mockAuthCredentials = <String, dynamic>{
  'expiresIn': '3600',
  'idToken': 'some id token',
  'refreshToken': 'some refresh token'
};

final Map<String, dynamic> mockGetStreamToken = <String, dynamic>{
  'getStreamToken': 'test.token',
};

final Map<String, dynamic> mockPrimaryContact = <String, dynamic>{
  'active': true,
  'contact': '+254717356476',
  'contactType': 'PHONE',
  'optedIn': true
};

final Map<String, dynamic> mockFeedContent = <String, dynamic>{
  'getContent': <String, dynamic>{
    'items': <dynamic>[contentMock.first]
  },
};
final Map<String, dynamic> mockListContentCategories = <String, dynamic>{
  'listContentCategories': categoriesMock
};

final Map<String, dynamic> mockRelatedPerson = <String, dynamic>{
  'active': true,
  'dateOfBirth': '21 Nov 2002',
  'firstName': 'Juha',
  'gender': 'MALE',
  'lastName': 'Kalulu',
  'otherName': null,
  'relatedTo': 'some-user-id',
  'relationshipType': 'NEXT_OF_KIN',
  'addresses': <dynamic>[mockAddress],
  'primaryContact': mockPrimaryContact,
  'secondaryContacts': <dynamic>[mockPrimaryContact]
};

final Map<String, dynamic> mockUser = <String, dynamic>{
  'active': true,
  'name': 'Kowalski',
  'firstName': 'Juha',
  'gender': 'MALE',
  'languages': <dynamic>['en', 'sw'],
  'suspended': false,
  'avatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
  'primaryContact': <String, dynamic>{
    'active': true,
    'contact': '+254717356476',
    'contactType': 'PHONE',
    'optedIn': true
  },
  'secondaryContacts': <dynamic>[
    <String, dynamic>{
      'active': true,
      'contact': '+254717356476',
      'contactType': 'PHONE',
      'optedIn': true
    }
  ],
  'lastName': 'Kalulu',
  'pinChangeRequired': false,
  'termsAccepted': true,
  'userID': 'some-user-id',
  'userName': 'Kowalski',
  'dateOfBirth': '21 Nov 2002',
  'hasSetPin': false,
  'hasSetSecurityQuestions': false,
  'hasSetNickname': false,
  'isPhoneVerified': false,
};

final Map<String, dynamic> mockClientProfile = <String, dynamic>{
  'clientProfile': <String, dynamic>{
    'active': true,
    'addresses': <dynamic>[mockAddress],
    'clientCounselled': true,
    'clientType': 'PMTCT',
    'facilityID': 'some-facility-id',
    'relatedPersons': <dynamic>[mockRelatedPerson],
    'treatmentBuddy': null,
    'treatmentEnrollmentDate': '21 Nov 2021',
    'user': mockUser
  }
};

final List<dynamic> mockListFlaggedMessages = <dynamic>[
  <String, dynamic>{
    'message': <String, dynamic>{
      'id': '1fc5d6be-8550-47a4-8f46-e515ae04f7a9',
      'text': 'Test',
      'created_at': '2022-04-08T12:02:20Z',
      'attachments': <dynamic>[],
      'mentioned_users': <dynamic>[],
      'user': <String, dynamic>{
        'id': '740128ce-32b4-4b5e-8359-a92442c8f741',
        'userID': '',
        'name': 'John Ngugi',
        'username': ''
      }
    }
  },
  <String, dynamic>{
    'message': <String, dynamic>{
      'id': '71a64e8a-98cb-4a27-9ee7-4786eb7a8135',
      'text': "Who's available?",
      'created_at': '2022-03-04T12:45:54Z',
      'attachments': <dynamic>[],
      'mentioned_users': <dynamic>[],
      'user': <String, dynamic>{
        'id': 'da614cc4-b503-4bd8-9530-a7eb0d676433',
        'userID': '',
        'name': 'Nairoua Salaton',
        'username': ''
      }
    }
  },
  <String, dynamic>{
    'message': <String, dynamic>{
      'id': '1c2a059c-f49b-4b6e-a130-2812777bb280',
      'text': 'Hi I am now available',
      'created_at': '2022-04-09T08:07:38Z',
      'attachments': <dynamic>[],
      'mentioned_users': <dynamic>[],
      'user': <String, dynamic>{
        'id': '305db9b5-2ff9-4e4c-9a7a-57660b31df4c',
        'userID': '',
        'name': 'Abiud Consumer',
        'username': ''
      }
    }
  }
];

final Map<String, dynamic> mockQuote = <String, dynamic>{
  'getHealthDiaryQuote': <String, dynamic>{
    'quote': 'Health at your fingerprints',
    'author': 'myAfyaHub'
  },
};

Map<String, dynamic> mockUpdateClientCareGiver = <String, dynamic>{
  'firstName': 'John',
  'lastName': 'Doe',
  'phoneNumber': '+254798000000',
  'caregiverType': 'SIBLING',
  'clientID': core.UNKNOWN,
};

Map<String, dynamic> mockMedicalDataState = <String, dynamic>{
  'medicalData': mockMedicalData,
};

Map<String, dynamic> mockMedicalDataDetails = <String, dynamic>{
  'Category': <String, dynamic>{'Text': 'Pneumonia'},
  'MedicationCodeableConcept': <String, dynamic>{
    'Text': 'Amoxicillin',
  },
  'Code': <String, dynamic>{
    'Text': 'Milk powder (cow\'s milk)',
  },
  'ValueString': 'some-value'
};

Map<String, dynamic> mockMedicalDataResponse = <String, dynamic>{
  'getMedicalData': mockMedicalData,
};

Map<String, dynamic> mockMedicalData = <String, dynamic>{
  'regimen': <dynamic>[
    <String, dynamic>{
      'Category': <String, dynamic>{'Text': 'Pneumonia'},
      'MedicationCodeableConcept': <String, dynamic>{
        'Text': 'Amoxicillin',
      },
    }
  ],
  'allergies': <dynamic>[
    <String, dynamic>{
      'Code': <String, dynamic>{'Text': 'Beef'}
    },
    <String, dynamic>{
      'Code': <String, dynamic>{'Text': 'Shellfish'}
    },
    <String, dynamic>{
      'Code': <String, dynamic>{'Text': 'Shellfish'}
    }
  ],
  'weight': <dynamic>[
    <String, dynamic>{'ValueString': 'some-value'}
  ],
  'viralLoad': <dynamic>[
    <String, dynamic>{'ValueString': 'some-value'}
  ],
  'bmi': <dynamic>[
    <String, dynamic>{'ValueString': 'some-bmi-value'},
    <String, dynamic>{'ValueString': 'second-bmi-value'}
  ],
  'cd4Count': <dynamic>[
    <String, dynamic>{'ValueString': 'some-value'}
  ],
};

Map<String, dynamic> mockEmptyMedicalData = <String, dynamic>{
  'regimen': <dynamic>[],
  'allergies': <dynamic>[],
  'weight': <dynamic>[],
  'viralLoad': <dynamic>[],
  'bmi': <dynamic>[],
  'cd4Count': <dynamic>[],
};

Map<String, dynamic> mockNextRefillDataResponse = <String, dynamic>{
  'nextRefill': '2023-12-12',
};

Map<String, dynamic> mockViralLoadDataResponse = <String, dynamic>{
  'searchFHIRObservation': mockViralLoadData,
};

Map<String, dynamic> mockViralLoadData = <String, dynamic>{
  'edges': <dynamic>[
    <String, dynamic>{
      'node': <String, dynamic>{
        'Status': 'some-status',
        'ValueString': '50,000',
        'EffectiveInstant': '2022-02-08T12:45:25Z',
        'Code': <String, dynamic>{
          'Text': 'HIV viral load',
        },
      },
    }
  ],
};

final Map<String, dynamic> mockHealthTimelineItems = <String, dynamic>{
  'patientHealthTimeline': <String, dynamic>{
    'totalCount': 30,
    'timeline': <Map<String, dynamic>>[
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': '73e69080-5d5a-481e-97f9-a004589b6f56',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': '9bc8b78f-ce36-4906-9bec-5936d520ef3b',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': 'e1bf5db2-bd65-46f7-932e-423f1ccd9051',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': '5edb4d3f-7aec-429d-8fc4-440aeec8eced',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': 'd2b2975a-4002-4735-b9e6-15c2c44b50f9',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': 'cbca415f-02be-4251-a6d5-f4106752acc8',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': 'ac3b73c9-5a3a-430c-b1a3-15f6ad572e74',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': 'f7b0ea6a-a6ee-4eac-a1ae-2fa7fb408302',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': 'e273444a-53b4-469b-8a8a-b5d9b02f7e1e',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <Map<String, dynamic>>[
          <String, dynamic>{
            'coding': <Map<String, dynamic>>[
              <String, dynamic>{
                'code': 'laboratory',
                'display': 'Laboratory',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Laboratory'
          }
        ],
        'code': <String, dynamic>{
          'coding': <Map<String, dynamic>>[
            <String, dynamic>{
              'code': '306',
              'display': 'Widal test',
              'system': '/orgs/CIEL/sources/CIEL/concepts/306/'
            }
          ],
          'text': 'Widal test'
        },
        'effectiveDateTime': '2022-03-05',
        'id': '954aa3fc-0a9d-46e8-a145-703571ee434a',
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': '8371c56f-2cc3-4ea9-9db7-2befef290f9c',
          'reference': 'Patient/8371c56f-2cc3-4ea9-9db7-2befef290f9c'
        },
        'timelineDate': '2022-03-05',
        'valueString': 'Non Reactive'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5096',
              'display': 'Return visit date',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5096/'
            }
          ],
          'text': 'Return visit date'
        },
        'effectiveInstant': '2022-04-05T09:36:28Z',
        'id': '3f753b78-7c91-4693-b8fd-f45f5a6538e6',
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': '510a98f5-8e39-465f-abf8-663c150ce355',
          'reference': 'Patient/510a98f5-8e39-465f-abf8-663c150ce355'
        },
        'timelineDate': '2022-04-05T09:36:28Z',
        'valueString': '2022-04-21'
      },
      <String, dynamic>{
        'category': <String, dynamic>{
          'coding': <Map<String, dynamic>>[
            <String, dynamic>{
              'code': '114100',
              'display': 'Pneumonia',
              'system': '/orgs/CIEL/sources/CIEL/concepts/114100/'
            }
          ],
          'text': 'Pneumonia'
        },
        'effectiveDateTime': '2022-03-04',
        'id': 'ab7313bb-3688-4f67-87db-e98bb69d0263',
        'medicationCodeableConcept': <String, dynamic>{
          'coding': <Map<String, dynamic>>[
            <String, dynamic>{
              'code': '71160',
              'display': 'Amoxicillin',
              'system': '/orgs/CIEL/sources/CIEL/concepts/71160/'
            }
          ],
          'text': 'Amoxicillin'
        },
        'resourceType': 'MedicationStatement',
        'status': 'unknown',
        'subject': <String, dynamic>{
          'display': '340611da-fcd0-4fc2-bb29-ef6ba3bbcb0b',
          'reference': 'Patient/340611da-fcd0-4fc2-bb29-ef6ba3bbcb0b'
        },
        'timelineDate': '2022-03-04'
      },
      <String, dynamic>{
        'category': <String>['medication'],
        'clinicalStatus': <String, dynamic>{
          'coding': <Map<String, dynamic>>[
            <String, dynamic>{
              'code': '165586',
              'display': "Milk powder (cow's milk)",
              'system': '/orgs/CIEL/sources/CIEL/concepts/165586/'
            }
          ],
          'text': "Milk powder (cow's milk)"
        },
        'code': <String, dynamic>{},
        'id': '35fe4b5e-1f26-4d65-89bf-bdc22a4ac9c5',
        'patient': <String, dynamic>{
          'display': '8371c56f-2cc3-4ea9-9db7-2befef290f9c',
          'reference': 'Patient/8371c56f-2cc3-4ea9-9db7-2befef290f9c'
        },
        'reaction': <Map<String, dynamic>>[
          <String, dynamic>{
            'description': "Milk powder (cow's milk)",
            'manifestation': <Map<String, dynamic>>[
              <String, dynamic>{
                'coding': <Map<String, dynamic>>[
                  <String, dynamic>{
                    'code': '512',
                    'display': 'Rash',
                    'system': '/orgs/CIEL/sources/CIEL/concepts/165586/'
                  }
                ],
                'text': 'Rash'
              }
            ],
            'severity': 'severe',
            'substance': <String, dynamic>{
              'coding': <Map<String, dynamic>>[
                <String, dynamic>{
                  'code': '165586',
                  'display': "Milk powder (cow's milk)",
                  'system': '/orgs/CIEL/sources/CIEL/concepts/165586/'
                }
              ],
              'text': "Milk powder (cow's milk)"
            }
          }
        ],
        'recordedDate': '2022-03-04',
        'resourceType': 'AllergyIntolerance',
        'timelineDate': '2022-03-04',
        'type': 'allergy',
        'verificationStatus': <String, dynamic>{}
      },
    ],
  },
};

final Map<String, dynamic> groupStateMock = <String, dynamic>{
  'listCommunityMembers': <dynamic>[
    <String, dynamic>{
      'user': <String, dynamic>{
        'id': core.UNKNOWN,
        'userID': core.UNKNOWN,
        'name': core.UNKNOWN,
        'role': core.UNKNOWN,
        'username': core.UNKNOWN,
        'gender': 'unknown',
        'extraData': <String, dynamic>{
          'bannedInCommunity': false,
        }
      },
      'isModerator': true,
    },
  ],
};

final MockFirebaseMessaging kMockMessagingPlatform = MockFirebaseMessaging();

void setupFirebaseCoreMocks() {
  TestFirebaseCoreHostApi.setup(MockFirebaseApp());
}

void setupFirebaseMessagingMocks() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setupFirebaseCoreMocks();

  // Mock Platform Interface Methods
  // ignore: invalid_use_of_protected_member
  when(kMockMessagingPlatform.delegateFor(app: anyNamed('app')))
      .thenReturn(kMockMessagingPlatform);
  // ignore: invalid_use_of_protected_member
  when(
    kMockMessagingPlatform.setInitialValues(
      isAutoInitEnabled: anyNamed('isAutoInitEnabled'),
    ),
  ).thenReturn(kMockMessagingPlatform);
}

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future<T>.delayed(const Duration(minutes: 5));
  }
}

final List<MethodCall> methodCallLog = <MethodCall>[];

void setupFirebaseAnalyticsMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  setupFirebaseCoreMocks();

  MethodChannelFirebaseAnalytics.channel
      .setMockMethodCallHandler((MethodCall methodCall) async {
    methodCallLog.add(methodCall);
    switch (methodCall.method) {
      default:
        return false;
    }
  });
}

class MockFirebaseMessaging extends Mock
    with MockPlatformInterfaceMixin
    implements FirebaseMessagingPlatform {
  MockFirebaseMessaging() {
    TestFirebaseMessagingPlatform();
  }

  @override
  bool get isAutoInitEnabled {
    return super.noSuchMethod(
      Invocation.getter(#isAutoInitEnabled),
      returnValue: true,
      returnValueForMissingStub: true,
    ) as bool;
  }

  @override
  FirebaseMessagingPlatform delegateFor({FirebaseApp? app}) {
    return super.noSuchMethod(
      Invocation.method(
        #delegateFor,
        <Object?>[],
        <Symbol, Object?>{#app: app},
      ),
      returnValue: TestFirebaseMessagingPlatform(),
      returnValueForMissingStub: TestFirebaseMessagingPlatform(),
    ) as FirebaseMessagingPlatform;
  }

  @override
  FirebaseMessagingPlatform setInitialValues({bool? isAutoInitEnabled}) {
    return super.noSuchMethod(
      Invocation.method(
        #setInitialValues,
        <Object?>[],
        <Symbol, Object?>{#isAutoInitEnabled: isAutoInitEnabled},
      ),
      returnValue: TestFirebaseMessagingPlatform(),
      returnValueForMissingStub: TestFirebaseMessagingPlatform(),
    ) as FirebaseMessagingPlatform;
  }

  @override
  Future<RemoteMessage?> getInitialMessage() {
    return super.noSuchMethod(
      Invocation.method(#getInitialMessage, <Object?>[]),
      returnValue: neverEndingFuture<RemoteMessage>(),
      returnValueForMissingStub: neverEndingFuture<RemoteMessage>(),
    ) as Future<RemoteMessage?>;
  }

  @override
  Future<void> deleteToken() {
    return super.noSuchMethod(
      Invocation.method(#deleteToken, <Object?>[]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<String?> getAPNSToken() {
    return super.noSuchMethod(
      Invocation.method(#getAPNSToken, <Object?>[]),
      returnValue: Future<String>.value(''),
      returnValueForMissingStub: Future<String>.value(''),
    ) as Future<String?>;
  }

  @override
  Future<String> getToken({String? vapidKey}) {
    return super.noSuchMethod(
      Invocation.method(
        #getToken,
        <Object?>[],
        <Symbol, Object?>{#vapidKey: vapidKey},
      ),
      returnValue: Future<String>.value(''),
      returnValueForMissingStub: Future<String>.value(''),
    ) as Future<String>;
  }

  @override
  Future<void> setAutoInitEnabled(bool? enabled) {
    return super.noSuchMethod(
      Invocation.method(#setAutoInitEnabled, <Object?>[enabled]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Stream<String> get onTokenRefresh {
    return super.noSuchMethod(
      Invocation.getter(#onTokenRefresh),
      returnValue: const Stream<String>.empty(),
      returnValueForMissingStub: const Stream<String>.empty(),
    ) as Stream<String>;
  }

  @override
  Future<NotificationSettings> requestPermission({
    bool? alert = true,
    bool? announcement = false,
    bool? badge = true,
    bool? carPlay = false,
    bool? criticalAlert = false,
    bool? provisional = false,
    bool? sound = true,
  }) {
    return super.noSuchMethod(
      Invocation.method(#requestPermission, <Object?>[], <Symbol, Object?>{
        #alert: alert,
        #announcement: announcement,
        #badge: badge,
        #carPlay: carPlay,
        #criticalAlert: criticalAlert,
        #provisional: provisional,
        #sound: sound
      }),
      returnValue: neverEndingFuture<NotificationSettings>(),
      returnValueForMissingStub: neverEndingFuture<NotificationSettings>(),
    ) as Future<NotificationSettings>;
  }

  @override
  Future<void> subscribeToTopic(String? topic) {
    return super.noSuchMethod(
      Invocation.method(#subscribeToTopic, <Object?>[topic]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<void> unsubscribeFromTopic(String? topic) {
    return super.noSuchMethod(
      Invocation.method(#unsubscribeFromTopic, <Object?>[topic]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }
}

class TestFirebaseMessagingPlatform extends FirebaseMessagingPlatform {
  TestFirebaseMessagingPlatform() : super();
}

class MockFlutterLocalNotificationsPlugin extends Mock
    with MockPlatformInterfaceMixin
    implements FlutterLocalNotificationsPlatform {
  @override
  Future<void> show(
    int id,
    String? title,
    String? body, {
    String? payload,
  }) async {}
}
