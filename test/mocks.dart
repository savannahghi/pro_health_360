// Dart imports:
import 'dart:convert';
import 'dart:io' as io;

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_remote_config_platform_interface/firebase_remote_config_platform_interface.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:platform/platform.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sqflite/sqflite.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/domain/core/entities/communities/group.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/login/create_pin.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_state.dart';
import 'package:myafyahub/domain/core/entities/security_questions/questions/security_question.dart';
import 'package:myafyahub/domain/core/entities/security_questions/responses/security_question_response.dart';
import 'package:myafyahub/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart' as enums;
import 'package:myafyahub/domain/core/value_objects/enums.dart' as local_enums;
import 'package:myafyahub/infrastructure/connecitivity/connectivity_interface.dart';
import 'package:myafyahub/infrastructure/endpoints.dart';
import 'package:myafyahub/infrastructure/repository/initialize_db.dart';
import 'test_utils.dart';

const String testFirstName = 'John';
const String testLastName = 'Doe';
const String testDOB = '02/02/2012';
const String testDate = '2020-03-13T17:18:21+03:00';
const String testFormattedDate = '2020-03-13';
const String inaccurateGenderValue = 'knb jk ';

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

class MockHttpClientIO extends Mock implements io.HttpClient {}

class MockHttpClientRequest extends Mock implements io.HttpClientRequest {}

class MockHttpClientResponse extends Mock implements io.HttpClientResponse {}

class MockHttpHeaders extends Mock implements io.HttpHeaders {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

class MockPlatform extends Mock implements LocalPlatform {}

class MockHapticFeedback extends Mock implements HapticFeedback {}

class MockConnectivityStatus extends Mock implements ConnectivityStatus {}

class MockShortGraphQlClient extends Mock implements GraphQlClient {}

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
class MockShortSILGraphQlClient extends IGraphQlClient {
  MockShortSILGraphQlClient.withResponse(
    String idToken,
    String endpoint,
    this.response,
  ) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  final http.Response response;

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

/// a short client for providing custom error responses
///
/// a good use case is when you want to return error responses
class MockCustomGraphQLClient extends IGraphQlClient {
  MockCustomGraphQLClient.withResponse(
    String idToken,
    String endpoint,
    this.response,
  ) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  final http.Response response;

  @override
  Future<http.Response> callRESTAPI({
    required String endpoint,
    required String method,
    Map<String, dynamic>? variables,
  }) {
    if (endpoint == kTestLoginByPhoneEndpoint) {
      return Future<http.Response>.value(
        Response(
          json.encode(mockLoginResponse),
          200,
        ),
      );
    }
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
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getClientHealthDiaryEntries': mockDiaryEntries,
            },
          }),
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

    if (queryString.contains(fetchContentQuery)) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'error': <String, dynamic>{'error': 'some error'}
          }),
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

    if (queryString.contains('addCover')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'addCover': <String, dynamic>{
                'message': 'cover is LIVE',
                'status': 'VALID_COVER',
                'eligibilityTime': '2021-01-26T10:43:46Z'
              }
            }
          }),
          201,
        ),
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

    //resume with pin
    if (queryString == resumeWithPinQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'resumeWithPIN': true}
          }),
          201,
        ),
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

    return Future<http.Response>.value();
  }

  @override
  Map<String, dynamic> toMap(http.Response? response) {
    final dynamic _res = json.decode(response!.body);

    if (_res is Map) return _res as Map<String, dynamic>;
    return _res[0] as Map<String, dynamic>;
  }
}

class MockGraphQlClient2 extends IGraphQlClient {
  MockGraphQlClient2.withResponse(
    String idToken,
    String endpoint,
    this.response,
  ) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  late final Response response;

  @override
  Future<Response> query(
    String queryString,
    Map<String, dynamic> variables, [
    ContentType contentType = ContentType.json,
  ]) async =>
      this.response;
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

Map<String, dynamic> changePINMock() {
  return <String, dynamic>{
    'data': <String, dynamic>{'updateUserPIN': true}
  };
}

Map<String, dynamic> resetPINMock() {
  return <String, dynamic>{'otp': '856839'};
}

Map<String, dynamic> getEmptyLibraryMock() {
  return <String, dynamic>{
    'data': <String, dynamic>{'getLibraryContent': <dynamic>[]}
  };
}

Map<String, dynamic> getEmptyFAQs() {
  return <String, dynamic>{
    'data': <String, dynamic>{'getFaqsContent': <dynamic>[]}
  };
}

Map<String, dynamic> getErrorLibraryMock() {
  return <String, dynamic>{'error': 'timeout'};
}

Map<String, dynamic> getNoFAQLibraryMock() {
  return <String, dynamic>{'error': 'no FAQ'};
}

Map<String, dynamic> coverVerificationRequestsMockEmpty() {
  return <String, dynamic>{
    'data': <String, dynamic>{'getMemberRequestByPhoneNumber': <dynamic>[]},
  };
}

Map<String, dynamic> coverVerificationRequestsErrorMock() {
  return <String, dynamic>{
    'errors': 'An error occurred',
  };
}

final http.Response coverRequestsErrorResponse = http.Response(
  json.encode(coverVerificationRequestsErrorMock()),
  201,
);

final http.Response coverRequestsResponseEmpty = http.Response(
  json.encode(coverVerificationRequestsMockEmpty()),
  201,
);

Map<String, dynamic> helpCenterFAQMock = <String, dynamic>{
  'data': <String, dynamic>{
    'getFaqsContent': <dynamic>[
      <String, dynamic>{
        'id': '5f89b9120251c700391da360',
        'createdAt': '2020-10-16T18:15:30+03:00',
        'excerpt':
            '* Login to your My Afya Hub account\n * Navigate to the cover page\n * Choose the insurance provider you want attached to your cover\n * Add your member insurance as indicated in your insurance card\n * Then press the submit button',
        'featureImage':
            'https://images.unsplash.com/photo-1525466760727-1d8be8721154?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=2000&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ',
        'html':
            '<ul><li>Login to your My Afya Hub account</li><li>Navigate to the cover page</li><li>Choose the insurance provider you want attached to your cover</li><li>Add your member insurance as indicated in your insurance card</li><li>Then press the submit button</li></ul>',
        'publishedAt': '2020-10-16T18:19:34+03:00',
        'slug': 'how-to-add-your-cover',
        'title': 'How to add your cover',
        'readingTime': 0,
        'tags': <dynamic>[
          <String, dynamic>{
            'id': '5f89b94a0251c700391da364',
            'name': 'faqs-consumer',
            'slug': 'faqs-consumer'
          }
        ]
      },
      <String, dynamic>{
        'id': '5f89b9120251c700391da360',
        'createdAt': '2020-10-16T18:15:30+03:00',
        'excerpt':
            '* Login to your My Afya Hub account\n * Navigate to the cover page\n * Choose the insurance provider you want attached to your cover\n * Add your member insurance as indicated in your insurance card\n * Then press the submit button',
        'featureImage':
            'https://images.unsplash.com/photo-1525466760727-1d8be8721154?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=2000&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ',
        'html':
            '<ul><li>Login to your My Afya Hub account</li><li>Navigate to the cover page</li><li>Choose the insurance provider you want attached to your cover</li><li>Add your member insurance as indicated in your insurance card</li><li>Then press the submit button</li></ul>',
        'publishedAt': '2020-10-16T18:19:34+03:00',
        'slug': 'how-to-add-your-cover',
        'title': 'How to add your cover',
        'readingTime': 0,
        'tags': <dynamic>[
          <String, dynamic>{
            'id': '5f89b94a0251c700391da364',
            'name': 'faqs',
            'slug': 'faqs'
          }
        ]
      },
    ]
  }
};

String sampleEndPoint = 'http://www.example.com/';
Uri sampleUri = Uri.parse(sampleEndPoint);
String sampleQuery = '';
Route<dynamic> sampleRoute = MaterialPageRoute<dynamic>(
  builder: (BuildContext context) => const Placeholder(),
);

// Remote config service

class MockFirebaseRemoteConfig extends Mock
    with
        // ignore: prefer_mixin
        MockPlatformInterfaceMixin
    implements
        TestFirebaseRemoteConfigPlatform {
  MockFirebaseRemoteConfig() {
    TestFirebaseRemoteConfigPlatform();
  }

  @override
  Future<bool> activate() {
    return super.noSuchMethod(
      Invocation.method(#activate, <dynamic>[]),
      returnValue: Future<bool>.value(true),
      returnValueForMissingStub: Future<bool>.value(true),
    ) as Future<bool>;
  }

  @override
  FirebaseRemoteConfigPlatform delegateFor({FirebaseApp? app}) {
    return super.noSuchMethod(
      Invocation.method(
        #delegateFor,
        <dynamic>[],
        <Symbol, Object?>{#app: app},
      ),
      returnValue: TestFirebaseRemoteConfigPlatform(),
      returnValueForMissingStub: TestFirebaseRemoteConfigPlatform(),
    ) as FirebaseRemoteConfigPlatform;
  }

  @override
  Future<void> ensureInitialized() {
    return super.noSuchMethod(
      Invocation.method(#ensureInitialized, <dynamic>[]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<void> fetch() {
    return super.noSuchMethod(
      Invocation.method(#fetch, <dynamic>[]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<bool> fetchAndActivate() {
    return super.noSuchMethod(
      Invocation.method(#fetchAndActivate, <dynamic>[]),
      returnValue: Future<bool>.value(true),
      returnValueForMissingStub: Future<bool>.value(true),
    ) as Future<bool>;
  }

  @override
  Map<String, RemoteConfigValue> getAll() {
    return super.noSuchMethod(
      Invocation.method(#getAll, <dynamic>[]),
      returnValue: <String, RemoteConfigValue>{},
      returnValueForMissingStub: <String, RemoteConfigValue>{},
    ) as Map<String, RemoteConfigValue>;
  }

  @override
  bool getBool(String key) {
    return super.noSuchMethod(
      Invocation.method(#getBool, <dynamic>[key]),
      returnValue: true,
      returnValueForMissingStub: true,
    ) as bool;
  }

  @override
  double getDouble(String key) {
    return super.noSuchMethod(
      Invocation.method(#getDouble, <dynamic>[key]),
      returnValue: 8.8,
      returnValueForMissingStub: 8.8,
    ) as double;
  }

  @override
  int getInt(String key) {
    return super.noSuchMethod(
      Invocation.method(#getInt, <dynamic>[key]),
      returnValue: 8,
      returnValueForMissingStub: 8,
    ) as int;
  }

  @override
  String getString(String key) {
    return super.noSuchMethod(
      Invocation.method(#getString, <dynamic>[key]),
      returnValue: 'foo',
      returnValueForMissingStub: 'foo',
    ) as String;
  }

  @override
  RemoteConfigValue getValue(String key) {
    return super.noSuchMethod(
      Invocation.method(#getValue, <dynamic>[key]),
      returnValue: RemoteConfigValue(
        <int>[],
        ValueSource.valueStatic,
      ),
      returnValueForMissingStub: RemoteConfigValue(
        <int>[],
        ValueSource.valueStatic,
      ),
    ) as RemoteConfigValue;
  }

  @override
  RemoteConfigFetchStatus get lastFetchStatus {
    return super.noSuchMethod(
      Invocation.getter(#lastFetchStatus),
      returnValue: RemoteConfigFetchStatus.success,
      returnValueForMissingStub: RemoteConfigFetchStatus.success,
    ) as RemoteConfigFetchStatus;
  }

  @override
  DateTime get lastFetchTime {
    return super.noSuchMethod(
      Invocation.getter(#lastFetchTime),
      returnValue: DateTime(2020),
      returnValueForMissingStub: DateTime(2020),
    ) as DateTime;
  }

  @override
  Future<void> setConfigSettings(RemoteConfigSettings? remoteConfigSettings) {
    return super.noSuchMethod(
      Invocation.method(#setConfigSettings, <dynamic>[remoteConfigSettings]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<void> setDefaults(Map<String, dynamic>? defaultParameters) {
    return super.noSuchMethod(
      Invocation.method(#setDefaults, <dynamic>[defaultParameters]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  FirebaseRemoteConfigPlatform setInitialValues({
    Map<dynamic, dynamic>? remoteConfigValues,
  }) {
    return super.noSuchMethod(
      Invocation.method(
        #setInitialValues,
        <dynamic>[],
        <Symbol, Object?>{#remoteConfigValues: remoteConfigValues},
      ),
      returnValue: TestFirebaseRemoteConfigPlatform(),
      returnValueForMissingStub: TestFirebaseRemoteConfigPlatform(),
    ) as FirebaseRemoteConfigPlatform;
  }

  @override
  RemoteConfigSettings get settings {
    return super.noSuchMethod(
      Invocation.getter(#settings),
      returnValue: RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ),
      returnValueForMissingStub: RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    ) as RemoteConfigSettings;
  }
}

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

class TestFirebaseRemoteConfigPlatform extends FirebaseRemoteConfigPlatform {
  TestFirebaseRemoteConfigPlatform() : super();

  @override
  FirebaseRemoteConfigPlatform delegateFor({FirebaseApp? app}) {
    return this;
  }

  @override
  FirebaseRemoteConfigPlatform setInitialValues({
    Map<dynamic, dynamic>? remoteConfigValues,
  }) {
    return this;
  }

  void instanceFor({
    FirebaseApp? app,
    Map<dynamic, dynamic>? pluginConstants,
  }) {}
}

class MockRemoteConfig extends Mock implements RemoteConfig {}

MockRemoteConfig mockRemoteConfig = MockRemoteConfig();
MockFirebaseRemoteConfig mockRemoteConfigPlatform = MockFirebaseRemoteConfig();
void setUpRemoteConfigStubs() {
  final DateTime mockLastFetchTime = DateTime(2020);
  const RemoteConfigFetchStatus mockLastFetchStatus =
      RemoteConfigFetchStatus.noFetchYet;
  final RemoteConfigSettings mockRemoteConfigSettings = RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
  );
  final Map<String, RemoteConfigValue> mockParameters =
      <String, RemoteConfigValue>{};
  // Map<String, dynamic> mockDefaultParameters = <String, dynamic>{};
  final RemoteConfigValue mockRemoteConfigValue = RemoteConfigValue(
    <int>[],
    ValueSource.valueStatic,
  );

  when(
    mockRemoteConfigPlatform.instanceFor(
      app: anyNamed('app'),
      pluginConstants: anyNamed('pluginConstants'),
    ),
  ).thenAnswer((_) => mockRemoteConfigPlatform);

  when(
    mockRemoteConfigPlatform.delegateFor(
      app: anyNamed('app'),
    ),
  ).thenAnswer((_) => mockRemoteConfigPlatform);

  when(
    mockRemoteConfigPlatform.setInitialValues(
      remoteConfigValues: anyNamed('remoteConfigValues'),
    ),
  ).thenAnswer((_) => mockRemoteConfigPlatform);

  when(mockRemoteConfigPlatform.lastFetchTime).thenReturn(mockLastFetchTime);

  when(mockRemoteConfigPlatform.lastFetchStatus)
      .thenReturn(mockLastFetchStatus);

  when(mockRemoteConfigPlatform.settings).thenReturn(mockRemoteConfigSettings);

  when(mockRemoteConfigPlatform.setConfigSettings(any))
      .thenAnswer((_) => Future<void>.value());

  when(mockRemoteConfigPlatform.activate())
      .thenAnswer((_) => Future<bool>.value(true));

  when(mockRemoteConfigPlatform.ensureInitialized())
      .thenAnswer((_) => Future<void>.value());

  when(mockRemoteConfigPlatform.fetch())
      .thenAnswer((_) => Future<void>.value());

  when(mockRemoteConfigPlatform.fetchAndActivate())
      .thenAnswer((_) => Future<bool>.value(true));

  when(mockRemoteConfigPlatform.getAll()).thenReturn(mockParameters);

  when(mockRemoteConfigPlatform.getBool('foo')).thenReturn(true);

  when(mockRemoteConfigPlatform.getInt('foo')).thenReturn(8);

  when(mockRemoteConfigPlatform.getDouble('foo')).thenReturn(8.8);

  when(mockRemoteConfigPlatform.getString('foo')).thenReturn('bar');

  when(mockRemoteConfigPlatform.getValue('foo'))
      .thenReturn(mockRemoteConfigValue);

  when(mockRemoteConfigPlatform.setDefaults(any))
      .thenAnswer((_) => Future<void>.value());
}

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

// ignore_for_file: avoid_redundant_argument_values, null_argument_to_non_null_type
Map<String, dynamic> mockIconDetails = <String, dynamic>{
  'url': shieldIconImgUrl
};

Map<String, dynamic> mockNotificationActions = <String, dynamic>{
  'name': 'Calendar',
  'route': ' ',
  'icon': mockIconDetails
};

Map<String, dynamic> mockNotification = <String, dynamic>{
  'icon': mockIconDetails,
  'description':
      'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join ',
  'date': 'July 21 2021',
  'actions': <dynamic>[mockNotificationActions],
  'status': 'Missed'
};

Map<String, dynamic> mockBottomNavigationState = <String, dynamic>{
  'currentBottomNavIndex': 0,
};

Map<String, dynamic> mockSecurityQuestion = <String, dynamic>{
  'SecurityQuestionID': 'id',
  'QuestionStem': 'question_stem',
  'Description': 'description',
  'ResponseType': enums.SecurityQuestionResponseType.UNKNOWN.name,
  'Active': true,
};

final List<dynamic> securityQuestionsMock = <dynamic>[
  <String, dynamic>{
    'SecurityQuestionID': 'id1',
    'QuestionStem': 'What are the last 4 digits of your CCC number?',
    'Description': 'Please provide the last 4 digits of your clinic number',
    'ResponseType': enums.SecurityQuestionResponseType.UNKNOWN.name,
    'Active': true,
  },
  <String, dynamic>{
    'SecurityQuestionID': 'id2',
    'QuestionStem': 'Which month did you start your treatment?',
    'Description': 'Enter the month you started your treatment',
    'ResponseType': enums.SecurityQuestionResponseType.DATE.name,
    'Active': true,
  },
  <String, dynamic>{
    'SecurityQuestionID': 'id3',
    'QuestionStem': 'Which county is your clinic located?',
    'Description': 'nter the name of the county in small letters',
    'ResponseType': enums.SecurityQuestionResponseType.UNKNOWN.name,
    'Active': true,
  },
];

Map<String, dynamic> mockSecurityQuestionsData = <String, dynamic>{
  'getSecurityQuestions': securityQuestionsMock
};

final List<dynamic> recordSecurityQuestionReponseMock = <dynamic>[
  <String, dynamic>{
    'securityQuestionID': 'id1',
    'isCorrect': true,
  },
  <String, dynamic>{
    'SecurityQuestionID': 'id2',
    'isCorrect': true,
  },
  <String, dynamic>{
    'SecurityQuestionID': 'id3',
    'isCorrect': true,
  },
];

Map<String, dynamic> mockRecordSecurityQuestionResponseData = <String, dynamic>{
  'recordSecurityQuestionResponses': recordSecurityQuestionReponseMock
};

Map<String, dynamic> mockSecurityQuestionResponse = <String, dynamic>{
  'userID': 'userId',
  'securityQuestionID': 'securityQuestionId',
  'response': 'response',
};

Map<String, dynamic> mockFAQContentResponse = <String, dynamic>{
  'title': 'title',
  'body': 'body',
};

final Map<String, dynamic> termsMock = <String, dynamic>{
  'termsID': 0,
  'text': 'Terms will be available here soon'
};

final Map<String, dynamic> mockLoginResponse = <String, dynamic>{
  'code': 0,
  'message': 'success',
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
      'displayName': 'Kowalski',
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
      'middleName': null,
      'pinChangeRequired': false,
      'termsAccepted': true,
      'userID': 'some-user-id',
      'userName': 'Kowalski',
      'userType': 'CLIENT',
      'dateOfBirth': '21 Nov 2002'
    },
  }
};

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
      'contentHTMLURL': 'https://bewell.co.ke/',
      'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    },
    'tagNames': <String>['Recommended', 'Health', 'Fitness'],
  },
];

final List<Map<String, dynamic>> categoriesMock = <Map<String, dynamic>>[
  <String, dynamic>{
    'id': 1,
    'name': 'welcome',
    'iconUrl': 'test-image.png',
  },
  <String, dynamic>{
    'id': 2,
    'name': 'recommended',
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
  }
];

final List<Map<String, dynamic>> mockDiaryEntries = <Map<String, dynamic>>[
  <String, dynamic>{
    'active': true,
    'mood': 'HAPPY',
    'note': 'I am healthy',
    'entryType': 'HOME_PAGE_HEALTH_DIARY_ENTRY',
    'createdAt': '2021-11-30T16:17:57Z'
  },
  <String, dynamic>{
    'active': true,
    'mood': 'HAPPY',
    'note': 'I am very healthy',
    'entryType': 'HOME_PAGE_HEALTH_DIARY_ENTRY',
    'createdAt': '2021-11-30T16:17:53Z'
  },
];

final Content mockContent = Content.fromJson(contentMock.first);

final Group mockGroup = Group(
  name: 'test',
  avatar: 'https://i.postimg.cc/9XpbrC25/profile-image.png',
  members: '523',
);

final Map<String, dynamic> mockOnboardingState = <String, dynamic>{
  'createPINState': CreatePINState.initial().toJson(),
  'termsAndConditions': TermsAndConditions.initial().toJson(),
  'securityQuestions': <Map<String, dynamic>>[
    SecurityQuestion.initial().toJson(),
  ],
  'securityQuestionResponses': <Map<String, dynamic>>[
    SecurityQuestionResponse.initial().toJson(),
  ],
  'phoneLogin': PhoneLoginState.initial().toJson(),
};

final Map<String, dynamic> mockAddress = <String, dynamic>{
  'active': true,
  'addressType': 'POSTAL',
  'country': 'Kenya',
  'county': null,
  'postalCode': '00300',
  'text': 'One Padmore'
};

final Map<String, dynamic> mockAuthCredentials = <String, dynamic>{
  'expiresIn': '3600',
  'idToken': 'some id token',
  'refreshToken': 'some refresh token'
};

final Map<String, dynamic> mockPrimaryContact = <String, dynamic>{
  'active': true,
  'contact': '+254717356476',
  'contactType': 'PHONE',
  'optedIn': true
};

final Map<String, dynamic> mock401Response = <String, dynamic>{
  'errors': <Map<String, dynamic>>[
    <String, dynamic>{
      'message': '401: Unauthorized',
      'extensions': <String, dynamic>{
        'code': 'UNAUTHENTICATED',
        'response': <String, dynamic>{
          'url': 'https://mycarehub-testing.savannahghi.org/graphql',
          'status': 401,
          'statusText': 'Unauthorized',
          'body': <Map<String, dynamic>>[
            <String, dynamic>{
              'error': 'invalid auth token: ID token has expired at: 1638297478'
            }
          ]
        }
      }
    }
  ],
  'data': null
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
  'displayName': 'Kowalski',
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
  'middleName': null,
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

final Map<String, dynamic> mockEventObject = <String, dynamic>{
  'firstName': 'Kowalski',
  'lastName': 'Juha',
  'primaryPhoneNumber': '0712345678',
  'uid': 'some-id',
  'flavour': Flavour.CONSUMER.name,
  'timestamp': DateTime.now().toString(),
  'appVersion': APPVERSION,
};

final Map<String, dynamic> mockQuote = <String, dynamic>{
  'getHealthDiaryQuote': <String, dynamic>{
    'quote': 'Health at your fingerprints',
    'author': 'myAfyaHub'
  },
};
