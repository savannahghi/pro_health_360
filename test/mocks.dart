import 'dart:convert';
import 'dart:io' as io;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_remote_config_platform_interface/firebase_remote_config_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/domain/core/entities/core/connectivity_interface.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/infrastructure/repository/initialize_db.dart';
import 'package:platform/platform.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sqflite/sqflite.dart';

import 'test_helpers.dart';
import 'test_utils.dart';
import 'tests_resources/shared_resources.dart';

const String testFirstName = 'John';
const String testLastName = 'Doe';
const String testDOB = '02/02/2012';
const String testDate = '2020-03-13T17:18:21+03:00';
const String testFormatedDate = '2020-03-13';
const String inaccurateGenderValue = 'knb jk ';

class MockInitializeDB extends Mock implements InitializeDB<MockStateDB> {
  @override
  String get dbName =>
      super.noSuchMethod(Invocation.getter(#dbName), returnValue: 'testDb')
          as String;

  @override
  Future<MockStateDB> database({MockStateDB? preInitializedDB}) =>
      super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<MockStateDB>.value(MockStateDB()))
          as Future<MockStateDB>;
}

class MockGraphQlClient5 extends Mock implements GraphQlClient {}

class MockStateDB extends Mock implements Database {
  @override
  Future<List<Map<String, Object?>>> rawQuery(String sql,
          [List<Object?>? arguments]) =>
      super.noSuchMethod(
        Invocation.method(#rawQuery, <dynamic>[sql, arguments]),
        returnValue: Future<List<Map<String, Object?>>>.value(
          <Map<String, Object?>>[
            <String, Object?>{'users': 10}
          ],
        ),
      ) as Future<List<Map<String, Object?>>>;

  @override
  Future<int> rawInsert(String sql, [List<Object?>? arguments]) =>
      super.noSuchMethod(
        Invocation.method(#rawInsert, <dynamic>[sql, arguments]),
        returnValue: Future<int>.value(
          10,
        ),
      ) as Future<int>;

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
  Future<T> devInvokeSqlMethod<T>(String method, String sql,
      [List<Object?>? arguments]) {
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
  Future<int> insert(String table, Map<String, Object?> values,
      {String? nullColumnHack, ConflictAlgorithm? conflictAlgorithm}) {
    throw UnimplementedError();
  }

  @override
  bool get isOpen => true;

  @override
  String get path => 'test';

  @override
  Future<List<Map<String, Object?>>> query(String table,
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset}) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawDelete(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawUpdate(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<void> setVersion(int version) {
    throw UnimplementedError();
  }

  @override
  Future<T> transaction<T>(Future<T> Function(Transaction txn) action,
      {bool? exclusive}) {
    throw UnimplementedError();
  }

  @override
  Future<int> update(String table, Map<String, Object?> values,
      {String? where,
      List<Object?>? whereArgs,
      ConflictAlgorithm? conflictAlgorithm}) {
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

// ignore: subtype_of_sealed_class
class MockShortGraphQlClient extends Mock implements GraphQlClient {}

class MockBuildContext extends Mock implements BuildContext {}

class MockTextEditingController extends Mock implements TextEditingController {}

String mockPayersResponse = '''
  {  'data':  {
    'payers':[
        {
          'id':'9a18f31d-4142-407f-ac10-9f4027e501f9',
          'name':'UAP OLDMUTUAL',
          'slade_code':0
        },
        {
          'id':'b6473943-21ec-45ee-998e-2f7cb88ee0e7',
          'name':'Jubilee Insurance Kenya',
          'slade_code':0
        },
        {
          'id':'47ae7a2f-f9e2-498d-94eb-2084166b5911',
          'name':'Resolution Insurance',
          'slade_code':0
        },
        {
          'id':'7da595cd-eebc-409a-ad69-5afde62e01de',
          'name':'AAR',
          'slade_code':0
        },
        {
          'id':'5beecfaf-e948-4c85-9142-164b4c5d441a',
          'name':'GENERAL ACCIDENT',
          'slade_code':0
        },
        {
          'id':'ecadbf2b-dd94-4146-9668-3c693b177e4c',
          'name':'First Assurance',
          'slade_code':0
        }
      ]
   }
}
''';

void availableCamerasMock() {
  const MethodChannel('plugins.flutter.io/camera')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'availableCameras') {
      return <Map<dynamic, dynamic>>[
        <dynamic, dynamic>{
          'name': 'front',
          'lensFacing': 'front',
          'sensorOrientation': 0,
        },
        <dynamic, dynamic>{
          'name': 'back',
          'lensFacing': 'back',
          'sensorOrientation': 0,
        }
      ];
    } else if (methodCall.method == 'initialize') {
      return Future<dynamic>.delayed(
          const Duration(microseconds: 1),
          () => <String, dynamic>{
                'textureId': 2,
                'previewWidth': 100,
                'previewHeight': 100,
              });
    }
    return null;
  });
}

Map<String, dynamic> reservedAmountMetadataMock = <String, dynamic>{
  'payerName': 'Caring Insurance',
  'payerSladeCode': 2001,
  'memberNumber': '123456',
  'benefitCode': 'INPATIENT',
  'spentAmount': 2000.00,
  'reservedAmount': 200.00,
  'isDependant': true,
  'isSharedLimit': false,
};

Map<String, dynamic> emptyReservedAmountMetadataMock = <String, dynamic>{
  'payerName': 'Caring Insurance',
  'payerSladeCode': 2001,
  'memberNumber': '123456',
  'benefitCode': 'INPATIENT',
  'spentAmount': 2000,
  'reservedAmount': 0,
  'isDependant': true
};

Map<String, dynamic> balanceReservationsMock = <String, dynamic>{
  'balanceReservations': <dynamic>[
    <String, dynamic>{
      'providerName': 'Caring healthcare',
      'amount': '0',
      'dateReleased': '2020-09-30T18:15:30+03:00',
      'dateReserved': '2020-09-30T18:15:30+03:00',
      'invoiceNumber': 'INV-001'
    },
    <String, dynamic>{
      'providerName': 'Caring healthcare',
      'amount': '2000',
      'dateReleased': '2020-09-31T18:15:30+03:00',
      'dateReserved': '2020-09-31T18:15:30+03:00',
      'invoiceNumber': 'INV-002'
    },
    <String, dynamic>{
      'providerName': 'Caring healthcare',
      'amount': '2000',
      'dateReserved': '2020-09-31T18:15:30+03:00',
      'invoiceNumber': 'INV-002'
    }
  ]
};

Map<String, dynamic> preauthorizationsMock = <String, dynamic>{
  'preauthorizations': <dynamic>[
    <String, dynamic>{
      'status': 'FINALISED',
      'benefitType': 'OUTPATIENT',
      'preauthType': 'OTHER',
      'providerName': 'The Nairobi Womens Hospital',
      'serviceStart': '2021-01-26T18:21:08+03:00',
      'serviceEnd': '2021-01-26T18:24:49+03:00',
      'finalApprovedAmount': 8000
    },
    <String, dynamic>{
      'status': 'FINALISED',
      'benefitType': 'OUTPATIENT',
      'preauthType': 'OTHER',
      'providerName': 'Menelik Medical Centre',
      'serviceStart': '2020-12-03T12:28:39+03:00',
      'serviceEnd': '2020-12-03T12:28:38+03:00',
      'finalApprovedAmount': 8750
    },
    <String, dynamic>{
      'status': 'FINALISED',
      'benefitType': 'OUTPATIENT',
      'preauthType': 'PRESCRIPTION',
      'providerName': 'The Karen Hospital Ltd',
      'serviceStart': '2020-11-17T13:47:54+03:00',
      'serviceEnd': '2020-11-17T13:47:46+03:00',
      'finalApprovedAmount': 13000
    }
  ],
};

Map<String, dynamic> preauthorizationsEmptyMock = <String, dynamic>{
  'preauthorizations': <dynamic>[],
};

Map<String, dynamic> invoicesMock = <String, dynamic>{
  'invoices': <dynamic>[
    <String, dynamic>{
      'proposedValueLessCopays': 9570,
      'totalCopayValue': 0,
      'providerClaimNo': 'EH.641979',
      'billFrom': '2021-03-29T10:49:03+03:00',
      'provider': <String, dynamic>{'name': 'Eldoret Hospital'},
      'claimLines': <dynamic>[
        <String, dynamic>{
          'claimLineTotal': 7000,
          'name': 'Ultrasound',
          'quantity': '2.0000',
          'unitPrice': '3500.00'
        },
        <String, dynamic>{
          'claimLineTotal': 320,
          'name': 'Buscopan 20mgml injection',
          'quantity': '2.0000',
          'unitPrice': '160.00'
        },
        <String, dynamic>{
          'claimLineTotal': 1500,
          'name': 'Emitino  4mg Injection',
          'quantity': '2.0000',
          'unitPrice': '750.00'
        },
        <String, dynamic>{
          'claimLineTotal': 750,
          'name': 'Perfalgan 1g100ml injection',
          'quantity': '1.0000',
          'unitPrice': '750.00'
        }
      ],
      'diagnoses': <dynamic>[
        <String, dynamic>{
          'name': 'Typhoid and malaria',
        },
        <String, dynamic>{
          'name': 'Kidney stones',
        },
      ],
    }
  ]
};

Map<String, dynamic> invoicesEmptyMock = <String, dynamic>{
  'invoices': <dynamic>[]
};

// ignore: subtype_of_sealed_class
class MockGraphQlClientForFailures extends Mock implements GraphQlClient {
  @override
  Future<http.Response> callRESTAPI(
      {required String endpoint,
      required String method,
      Map<String, dynamic>? variables}) {
    if (endpoint.contains('upload')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{},
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
  Future<http.Response> query(
      String queryString, Map<String, dynamic> variables,
      [ContentType contentType = ContentType.json]) {
    if (queryString.contains('createMemberProfileRequest')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'errors': <dynamic>[
                <String, dynamic>{'message': 'An error occurred'}
              ],
              'data': <String, dynamic>{
                'createMemberProfileRequest': <String, dynamic>{
                  'stateFake': 'DRAFT'
                }
              }
            }),
            201),
      );
    }

    return Future<http.Response>.value();
  }
}

// ignore: subtype_of_sealed_class
class MockGraphQlClientForFailures2 extends Mock implements GraphQlClient {
  @override
  Future<http.Response> query(
      String queryString, Map<String, dynamic> variables,
      [ContentType contentType = ContentType.json]) {
    if (queryString.contains('createMemberProfileRequest')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'errors': <dynamic>[
                <String, dynamic>{'message': duplicateRequestString}
              ],
              'data': <String, dynamic>{}
            }),
            201),
      );
    }
    return Future<http.Response>.value();
  }
}

// ignore: subtype_of_sealed_class
class MockGraphQlClient extends Mock implements GraphQlClient {
  String setupUserAsExperimenterVariables =
      json.encode(<String, dynamic>{'participate': true});
  String removeUserAsExperimenterVariables =
      json.encode(<String, dynamic>{'participate': false});

  String sendOTPTesterVariables =
      json.encode(<String, dynamic>{'phone': testPhoneNumber});

  @override
  Future<http.Response> callRESTAPI(
      {required String endpoint,
      required String method,
      Map<String, dynamic>? variables}) {
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

    if (endpoint.contains('login_anonymous')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'can_experiment': false,
              'customToken': 'o4S8p5ym60T5ZTVZDt9Gaw',
              'expires_in': '3600',
              'id_token': 'o4S8p5ym60T5ZTVZDt9GawU9IWFkdy1r_g',
              'is_admin': false,
              'is_anonymous': true,
              'refresh_token': 'o4S8p5ym60T5ZTVZDt9GawlIpc0VEQ9p1',
              'uid': 'BkOpHPj9hLRnhYcmglIpc0VEQ9p1'
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
  Future<http.Response> query(
      String queryString, Map<String, dynamic> variables,
      [ContentType contentType = ContentType.json]) {
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
            200),
      );
    }

    if (queryString == getFAQQuery) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(json.encode(helpCenterFAQMock), 201),
      );
    }

    if (queryString.contains('UpdateProfile')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'updateProfile': true}
            }),
            201),
      );
    }

    if (queryString.contains('unreadPersistentItems')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'unreadPersistentItems': 3}
            }),
            201),
      );
    }

    if (queryString.contains('panelLocations')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'panelLocations': <dynamic>[
                  <String, dynamic>{
                    'freeBusy': <String, dynamic>{
                      'timeMin': '2020-06-15T10:43:04Z',
                      'timeMax': '2020-06-16T10:43:04Z',
                      'busySlots': <dynamic>[]
                    },
                    'branchProfile': <String, dynamic>{
                      'id': 'b827f240-b423-4ee8-87b6-49f78533e032',
                      'branchSladeCode': 'BRA-PRO-3739-1',
                      'branchName': 'Dr. Musima and Associates - Main Office',
                      'organizationSladeCode': 'PRO-3739',
                      'coordinates': '-1.295541, 36.806474',
                      'geoHash': 'kzf0ts1svj8h',
                      'hasTelehealth': false,
                      'averageRating': 20,
                      'providerCategory': 'DENTAL_PRACTICE',
                      'practiceTypes': <dynamic>[
                        'DENTAL_GENERAL_DENTAL_PRACTICE'
                      ],
                      'sortPriority': 0,
                      'profile':
                          'Dr. Musima & Associates is an experienced group of dentist, dental surgeons, and orthodontists.',
                      'license': '-',
                      'averageConsultationPrice': 1000,
                      'averageTeleconsultationPrice': 500,
                      'phones': <dynamic>['+254790360360'],
                      'emails': <dynamic>['info@savannahinformatics.com'],
                      'profilePages': <dynamic>[
                        'http://www.savannahinformatics.com'
                      ],
                      'calendarID':
                          'healthcloud.co.ke_6jm2ffq7ninov3o1evgs8n0r3o@group.calendar.google.com',
                      'photoContentType': 'JPG',
                      'photoBase64data': SharedResources.base64ImageString,
                      'active': true,
                      'fhirReference': null
                    }
                  }
                ]
              }
            }),
            201),
      );
    }

    if (queryString.contains('covers')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'covers': <dynamic>[
                  <String, dynamic>{
                    'benefits': <dynamic>[
                      <String, dynamic>{
                        'status': 'AVAILABLE',
                        'benefitLimit': 2000000,
                        'benefitType': 'INPATIENT',
                        'benefitCode': '33657',
                        'availableBalance': 2000000,
                        'spentAmount': 0,
                        'benefit':
                            'SAVANNAH INFORMATICS CORPORATE 2M SHARED 2016',
                        'visitLimit': 5000,
                        'reservedAmount': 0,
                        'thresholdAmount': 0
                      },
                      <String, dynamic>{
                        'status': 'AVAILABLE',
                        'benefitLimit': 100000,
                        'benefitType': 'OUTPATIENT',
                        'benefitCode': '33656',
                        'availableBalance': 100000,
                        'spentAmount': 0,
                        'benefit': 'SAVANNAH INFORMATICS OP C100 SH COPAY 2016',
                        'visitLimit': 5000,
                        'reservedAmount': 0,
                        'thresholdAmount': 0
                      },
                      <String, dynamic>{
                        'status': 'AVAILABLE',
                        'benefitLimit': 100000,
                        'benefitType': 'OTHER',
                        'benefitCode': '22701',
                        'availableBalance': 100000,
                        'spentAmount': 0,
                        'benefit':
                            'Corporate 2M and above Inbuilt Riders (2016)',
                        'visitLimit': 5000,
                        'reservedAmount': 0,
                        'thresholdAmount': 0
                      }
                    ],
                    'cover': <String, dynamic>{
                      'group': 'SAVANNAH INFORMATICS LIMITED',
                      'category': 'SAVANNAH INFORMATICS LIMITED',
                      'validFrom': '2020-08-15T00:00:00+03:00',
                      'validTo': '2021-08-15T00:00:00+03:00'
                    },
                    'payerDetails': <String, dynamic>{
                      'name': 'Resolution Insurance',
                      'sladeCode': 458
                    },
                    'member': <String, dynamic>{
                      'membershipNumber': '1464449',
                      'title': 'Mr',
                      'names': 'KEVIN KIPCHIRCHIR MAIYO',
                      'firstName': 'KEVIN KIPCHIRCHIR',
                      'lastName': 'MAIYO',
                      'hasSladeCard': <dynamic>[true, 'PHYSICAL']
                    },
                    'dependants': <dynamic>[]
                  }
                ]
              }
            }),
            201),
      );
    }

    if (queryString.contains('consumerTermsAndConditions')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'consumerTermsAndConditions':
                    'Thine test coverage shall reacheth a percentage of 100'
              }
            }),
            201),
      );
    }

    if (queryString.contains('generateOTP')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'generateOTP': '1234'}
            }),
            201),
      );
    }

    if (queryString.contains('emailVerificationOTP')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'emailVerificationOTP': '1234'}
            }),
            201),
      );
    }
    if (queryString.contains('verifyMSISDNandPIN')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'verifyMSISDNandPIN': true}
            }),
            201),
      );
    }

    if (queryString.contains('updateUserPIN')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'updateUserPIN': true},
            }),
            201),
      );
    }

    if (queryString.contains('generateRetryOTP')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'generateRetryOTP': '1234'},
            }),
            201),
      );
    }

    if (queryString.contains('completeSignup')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'completeSignup': true},
            }),
            201),
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
            201),
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
            201),
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
            201),
      );
    }

    if (queryString.contains('filterProviderPanel')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'filterProviderPanel': <dynamic>[
                  <String, dynamic>{
                    'providerName': 'Prime City Clinics & Laboratories',
                    'providerType': 'PROVIDER',
                    'providerSladeCode': 3088,
                    'providerRestriction': <String, dynamic>{
                      'copayType': 'NO_COPAY',
                      'copayValue': 0
                    }
                  },
                  <String, dynamic>{
                    'providerName': 'Kiambu Pharmacy',
                    'providerType': 'PROVIDER',
                    'providerSladeCode': 3089,
                    'providerRestriction': <String, dynamic>{
                      'copayType': 'NO_COPAY',
                      'copayValue': 0
                    }
                  },
                  <String, dynamic>{
                    'providerName': 'Madaraka Health Services',
                    'providerType': 'PROVIDER',
                    'providerSladeCode': 3090,
                    'providerRestriction': <String, dynamic>{
                      'copayType': 'NO_COPAY',
                      'copayValue': 0
                    }
                  },
                  <String, dynamic>{
                    'providerName': 'Tower Chemist Ltd',
                    'providerType': 'PROVIDER',
                    'providerSladeCode': 3091,
                    'providerRestriction': <String, dynamic>{
                      'copayType': 'NO_COPAY',
                      'copayValue': 0
                    }
                  },
                  <String, dynamic>{
                    'providerName': 'Green House Chemists',
                    'providerType': 'PROVIDER',
                    'providerSladeCode': 3092,
                    'providerRestriction': <String, dynamic>{
                      'copayType': 'NO_COPAY',
                      'copayValue': 0
                    }
                  },
                  <String, dynamic>{
                    'providerName': 'Mansion Chemist Ltd',
                    'providerType': 'PROVIDER',
                    'providerSladeCode': 3093,
                    'providerRestriction': <String, dynamic>{
                      'copayType': 'NO_COPAY',
                      'copayValue': 0
                    }
                  },
                  <String, dynamic>{
                    'providerName': 'Nila Pharmacy',
                    'providerType': 'PROVIDER',
                    'providerSladeCode': 3094,
                    'providerRestriction': <String, dynamic>{
                      'copayType': 'NO_COPAY',
                      'copayValue': 0
                    }
                  },
                  <String, dynamic>{
                    'providerName': 'Githurai Chemist',
                    'providerType': 'PROVIDER',
                    'providerSladeCode': 3095,
                    'providerRestriction': <String, dynamic>{
                      'copayType': 'NO_COPAY',
                      'copayValue': 0
                    }
                  },
                  <String, dynamic>{
                    'providerName': 'Rika Chemists',
                    'providerType': 'PROVIDER',
                    'providerSladeCode': 3096,
                    'providerRestriction': <String, dynamic>{
                      'copayType': 'NO_COPAY',
                      'copayValue': 0
                    }
                  },
                  <String, dynamic>{
                    'providerName': 'Omaera Pharmaceuticals Ltd',
                    'providerType': 'PROVIDER',
                    'providerSladeCode': 3097,
                    'providerRestriction': <String, dynamic>{
                      'copayType': 'NO_COPAY',
                      'copayValue': 0
                    }
                  }
                ]
              }
            }),
            201),
      );
    }

    if (queryString.contains(getFeedQuery)) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'error': <String, dynamic>{'error': 'some error'}
            }),
            201),
      );
    }

// getFAQQuery
    if (queryString == getFAQQuery) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
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
                  }
                ]
              }
            }),
            201),
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
            201),
      );
    }

    if (queryString.contains('getErrorFAQ')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{'error': 'no FAQ'}), 201),
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
                'createMemberProfileRequest': <String, dynamic>{
                  'state': 'DRAFT'
                }
              }
            }),
            201),
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
            201),
      );
    }

    // getLibraryQuery
    if (queryString == getLibraryQuery) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getLibraryContent': <dynamic>[
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
            }),
            201),
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
            201),
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
            201),
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
            201),
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
            201),
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
            201),
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
}

class MockGraphQlClient2 extends IGraphQlClient {
  MockGraphQlClient2.withResponse(
      String idToken, String endpoint, this.response) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  late final Response response;

  @override
  Future<Response> query(String queryString, Map<String, dynamic> variables,
          [ContentType contentType = ContentType.json]) async =>
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

const Map<String, dynamic> testPanelLocation = <String, dynamic>{
  'branchProfile': <String, dynamic>{
    'id': '1235',
    'branchName': 'BeWell',
    'branchSladeCode': '123',
    'photoBase64data': '',
    'specialties': <dynamic>[],
    'coordinates': '123',
    'averageConsultationPrice': 1500,
    'averageTeleconsultationPrice': 800,
    'branchAverageRating': 20,
    'averageRating': 22,
    'numberOfRatings': 50,
    'profile': 'My Afya Hub profile',
    'phones': <dynamic>['+25471234578'],
    'emails': <dynamic>['test@coverage.bewell']
  }
};

List<dynamic> providerPanelsMock() {
  return <dynamic>[
    <String, dynamic>{
      'providerName': 'Wellness Hosi',
      'providerRestriction': <String, dynamic>{
        'copayType': '1200',
        'copayValue': 1200
      }
    },
    <String, dynamic>{
      'providerName': 'Wellness Hospitals',
      'providerRestriction': <String, dynamic>{
        'copayType': '1200',
        'copayValue': 1200
      }
    },
    <String, dynamic>{
      'providerName': 'Kindness Hosi',
      'providerRestriction': <String, dynamic>{
        'copayType': '1200',
        'copayValue': 1200
      }
    },
    <String, dynamic>{
      'providerName': 'Joyful Hosi',
      'providerRestriction': <String, dynamic>{
        'copayType': '1200',
        'copayValue': 1200
      }
    }
  ];
}

List<dynamic> returnCoversMock(
    {List<dynamic>? dependants,
    List<dynamic>? benefits,
    List<dynamic>? hasSladeCard,
    bool? singleCover}) {
  return <dynamic>[
    <String, dynamic>{
      'member': <String, dynamic>{
        'membershipNumber': '1464443',
        'title': 'Mr',
        'names': 'JOHN DOE',
        'firstName': 'JOHN DEER',
        'lastName': 'DOE',
        'hasCard': true,
        'hasSladeCard': hasSladeCard ?? <dynamic>[true, 'PHYSICAL']
      },
      'benefits': benefits ??
          <dynamic>[
            <String, dynamic>{
              'status': 'AVAILABLE',
              'benefitLimit': 2000000,
              'benefitType': 'INPATIENT',
              'benefitCode': '33657',
              'availableBalance': 2000000,
              'spentAmount': 0,
              'benefit': 'SAVANNAH INFORMATICS CORPORATE 2M SHARED 2016',
              'visitLimit': 5000,
              'reservedAmount': 0,
              'thresholdAmount': 0
            },
            <String, dynamic>{
              'status': 'AVAILABLE',
              'benefitLimit': 100000,
              'benefitType': 'OUTPATIENT',
              'benefitCode': '33656',
              'availableBalance': 100000,
              'spentAmount': 0,
              'benefit': 'SAVANNAH INFORMATICS OP C100 SH COPAY 2016',
              'visitLimit': 5000,
              'reservedAmount': 0,
              'thresholdAmount': 0
            },
            <String, dynamic>{
              'status': 'AVAILABLE',
              'benefitLimit': 100000,
              'benefitType': 'OTHER',
              'benefitCode': '22701',
              'availableBalance': 100000,
              'spentAmount': 0,
              'benefit': 'Corporate 2M and above Inbuilt Riders (2016)',
              'visitLimit': 5000,
              'reservedAmount': 0,
              'thresholdAmount': 0
            }
          ],
      'payerDetails': <String, dynamic>{
        'sladeCode': 457,
        'bpType': 'PAYER',
        'name': 'Jubilee',
        'contacts': <String, dynamic>{
          'EMA': <dynamic>['info@jubileekenya.com'],
          'FAX': <dynamic>['254 (0) 20 328 1150'],
          'PHO': <dynamic>['+254709949000']
        }
      },
      'cover': <String, dynamic>{
        'group': 'SAVANNAH INFORMATICS LIMITED',
        'category': 'SAVANNAH INFORMATICS LIMITED',
        'validFrom': '2020-08-15T00:00:00+03:00',
        'validTo': '2021-08-15T00:00:00+03:00'
      },
      'dependants': dependants ??
          <dynamic>[
            <String, dynamic>{
              'name': 'Happy User',
              'initials': 'HU',
              'memberNumber': '3786392',
              'relationship': 'CHILD',
              'patientID': '89327',
              'dateOfBirth': '2019-12-10T00:00:00+03:00'
            }
          ]
    },
    if (singleCover == false || singleCover == null)
      <String, dynamic>{
        'member': <String, dynamic>{
          'membershipNumber': '1464444',
          'title': 'Mrs',
          'names': 'JANE DOE',
          'firstName': 'JANE DEER',
          'lastName': 'DOE',
          'hasCard': true,
          'hasSladeCard': hasSladeCard ?? <dynamic>[true, 'PHYSICAL']
        },
        'benefits': benefits ??
            <dynamic>[
              <String, dynamic>{
                'status': 'AVAILABLE',
                'benefitLimit': 2000000,
                'benefitType': 'INPATIENT',
                'benefitCode': '33657',
                'availableBalance': 2000000,
                'spentAmount': 0,
                'benefit': 'SAVANNAH INFORMATICS CORPORATE 2M SHARED 2016',
                'visitLimit': 5000,
                'reservedAmount': 0,
                'thresholdAmount': 0
              },
              <String, dynamic>{
                'status': 'AVAILABLE',
                'benefitLimit': 100000,
                'benefitType': 'OUTPATIENT',
                'benefitCode': '33656',
                'availableBalance': 100000,
                'spentAmount': 0,
                'benefit': 'SAVANNAH INFORMATICS OP C100 SH COPAY 2016',
                'visitLimit': 5000,
                'reservedAmount': 0,
                'thresholdAmount': 0
              },
              <String, dynamic>{
                'status': 'AVAILABLE',
                'benefitLimit': 100000,
                'benefitType': 'OTHER',
                'benefitCode': '22701',
                'availableBalance': 100000,
                'spentAmount': 0,
                'benefit': 'Corporate 2M and above Inbuilt Riders (2016)',
                'visitLimit': 5000,
                'reservedAmount': 0,
                'thresholdAmount': 0
              }
            ],
        'payerDetails': <String, dynamic>{
          'sladeCode': 457,
          'bpType': 'PAYER',
          'name': 'Jubilee',
          'contacts': <String, dynamic>{
            'EMA': <dynamic>['info@jubileekenya.com'],
            'FAX': <dynamic>['254 (0) 20 328 1150'],
            'PHO': <dynamic>['+254709949000']
          }
        },
        'cover': <String, dynamic>{
          'group': 'SAVANNAH INFORMATICS LIMITED',
          'category': 'SAVANNAH INFORMATICS LIMITED',
          'validFrom': '2020-08-15T00:00:00+03:00',
          'validTo': '2021-08-15T00:00:00+03:00'
        },
        'dependants': dependants ??
            <dynamic>[
              <String, dynamic>{
                'name': 'Happy User',
                'initials': 'HU',
                'memberNumber': '3786392',
                'relationship': 'CHILD',
                'patientID': '89327',
                'dateOfBirth': '2019-12-10T00:00:00+03:00'
              }
            ]
      }
  ];
}

List<dynamic> coversMockIncomplete = <dynamic>[
  <String, dynamic>{
    'member': <String, dynamic>{
      'membershipNumber': '1464443',
      'title': 'Mr',
      'names': 'JOHN DOE',
      'firstName': 'JOHN DEER',
      'lastName': 'DOE',
      'hasCard': true,
      'hasSladeCard': <dynamic>[true, 'PHYSICAL']
    },
    'benefits': <dynamic>[
      <String, dynamic>{
        'status': 'AVAILABLE',
        'benefitType': 'INPATIENT',
        'benefitCode': '33657',
        'benefit': 'SAVANNAH INFORMATICS CORPORATE 2M SHARED 2016',
      },
    ],
    'payerDetails': <String, dynamic>{
      'sladeCode': 457,
      'bpType': 'PAYER',
      'name': 'Jubilee',
      'contacts': <String, dynamic>{
        'EMA': <dynamic>['info@jubileekenya.com'],
        'FAX': <dynamic>['254 (0) 20 328 1150'],
        'PHO': <dynamic>['+254709949000']
      }
    },
    'cover': <String, dynamic>{
      'group': 'SAVANNAH INFORMATICS LIMITED',
      'category': 'SAVANNAH INFORMATICS LIMITED',
      'validFrom': '2020-08-15T00:00:00+03:00',
      'validTo': '2021-08-15T00:00:00+03:00'
    }
  }
];

List<dynamic> returnPayersMock() {
  return <dynamic>[
    <String, dynamic>{'name': 'MADISON Insurance Company', 'slade_code': 2011},
    <String, dynamic>{'name': 'APA Insurance Company', 'slade_code': 2001},
    <String, dynamic>{'name': 'BRITAM General Insurance', 'slade_code': 2002},
    <String, dynamic>{'name': 'My Afya Hub Virtual Payer', 'slade_code': 2019},
    <String, dynamic>{'name': 'Jubilee Insurance Kenya', 'slade_code': 457},
    <String, dynamic>{'name': 'Resolution Insurance', 'slade_code': 458}
  ];
}

Map<String, dynamic> singleMemberEligibility() {
  return <String, dynamic>{
    'benefits': <dynamic>[
      <String, dynamic>{
        'status': 'AVAILABLE',
        'benefitLimit': 50000,
        'benefitType': 'INPATIENT',
        'benefitCode': '338',
        'availableBalance': 2000000,
        'spentAmount': -1950000,
        'benefit': 'Temporary Inpatient benefit for immediate cover members',
        'visitLimit': 15000,
        'reservedAmount': 0,
        'thresholdAmount': 0
      },
      <String, dynamic>{
        'status': 'AVAILABLE',
        'benefitLimit': 50000,
        'benefitType': 'OUTPATIENT',
        'benefitCode': '340',
        'availableBalance': 137500,
        'spentAmount': -100000,
        'benefit': 'Temporary Outpatient benefit for immediate cover members',
        'visitLimit': 15000,
        'reservedAmount': 0,
        'thresholdAmount': 12500
      }
    ],
    'cover': <String, dynamic>{
      'group': 'Pembe Flour Mills Limited',
      'category': 'Category B',
      'validFrom': '2021-04-01T00:00:00+03:00',
      'validTo': '2022-04-01T00:00:00+03:00'
    },
    'payerDetails': <String, dynamic>{
      'name': 'Jubilee Insurance Kenya',
      'sladeCode': 457
    },
    'member': <String, dynamic>{
      'membershipNumber': '11928024',
      'dateOfBirth': '1999-08-17T21:00:00Z',
      'title': 'Miss',
      'names': 'Maisah Ali Mbarak',
      'firstName': 'Maisah Ali',
      'lastName': 'Mbarak',
      'hasSladeCard': <dynamic>[true, 'PHYSICAL']
    }
  };
}

Map<String, dynamic> coversMock(
    {List<dynamic>? dependants,
    List<dynamic>? benefits,
    List<dynamic>? hasSladeCard}) {
  return <String, dynamic>{
    'member': <String, dynamic>{
      'membershipNumber': '1464443',
      'title': 'Mr',
      'names': 'JOHN DOE',
      'firstName': 'JOHN DEER',
      'lastName': 'DOE',
      'hasCard': true,
      'hasSladeCard': hasSladeCard ?? <dynamic>[true, 'PHYSICAL']
    },
    'benefits': benefits ??
        <dynamic>[
          <String, dynamic>{
            'status': 'AVAILABLE',
            'benefitLimit': 2000000,
            'benefitType': 'INPATIENT',
            'benefitCode': '33657',
            'availableBalance': 2000000,
            'spentAmount': 0,
            'benefit': 'SAVANNAH INFORMATICS CORPORATE 2M SHARED 2016',
            'visitLimit': 5000,
            'reservedAmount': 0,
            'thresholdAmount': 0
          },
          <String, dynamic>{
            'status': 'AVAILABLE',
            'benefitLimit': 100000,
            'benefitType': 'OUTPATIENT',
            'benefitCode': '33656',
            'availableBalance': 100000,
            'spentAmount': 0,
            'benefit': 'SAVANNAH INFORMATICS OP C100 SH COPAY 2016',
            'visitLimit': 5000,
            'reservedAmount': 0,
            'thresholdAmount': 0
          },
          <String, dynamic>{
            'status': 'AVAILABLE',
            'benefitLimit': 100000,
            'benefitType': 'OTHER',
            'benefitCode': '22701',
            'availableBalance': 100000,
            'spentAmount': 0,
            'benefit': 'Corporate 2M and above Inbuilt Riders (2016)',
            'visitLimit': 5000,
            'reservedAmount': 0,
            'thresholdAmount': 0
          }
        ],
    'payerDetails': <String, dynamic>{
      'sladeCode': 457,
      'bpType': 'PAYER',
      'name': 'Jubilee',
      'contacts': <String, dynamic>{
        'EMA': <dynamic>['info@jubileekenya.com'],
        'FAX': <dynamic>['254 (0) 20 328 1150'],
        'PHO': <dynamic>['+254709949000']
      }
    },
    'cover': <String, dynamic>{
      'group': 'SAVANNAH INFORMATICS LIMITED',
      'category': 'SAVANNAH INFORMATICS LIMITED',
      'validFrom': '2020-08-15T00:00:00+03:00',
      'validTo': '2021-08-15T00:00:00+03:00'
    },
    'dependants': dependants ??
        <dynamic>[
          <String, dynamic>{
            'name': 'Happy User',
            'initials': 'HU',
            'memberNumber': '3786392',
            'relationship': 'CHILD',
            'patientID': '89327',
            'dateOfBirth': '2019-12-10T00:00:00+03:00'
          }
        ]
  };
}

Map<String, dynamic> noDependantsCoversMock() {
  return <String, dynamic>{
    'member': <String, dynamic>{
      'membershipNumber': '1464443',
      'title': 'Mr',
      'names': 'JOHN DOE',
      'firstName': 'JOHN DEER',
      'lastName': 'DOE',
      'hasCard': true,
      'hasSladeCard': <dynamic>[true, 'PHYSICAL']
    },
    'benefits': <dynamic>[
      <String, dynamic>{
        'status': 'AVAILABLE',
        'benefitLimit': 2000000,
        'benefitType': 'INPATIENT',
        'benefitCode': '33657',
        'availableBalance': 2000000,
        'spentAmount': 0,
        'benefit': 'SAVANNAH INFORMATICS CORPORATE 2M SHARED 2016',
        'visitLimit': 5000,
        'reservedAmount': 0,
        'thresholdAmount': 0
      },
      <String, dynamic>{
        'status': 'AVAILABLE',
        'benefitLimit': 100000,
        'benefitType': 'OUTPATIENT',
        'benefitCode': '33656',
        'availableBalance': 100000,
        'spentAmount': 0,
        'benefit': 'SAVANNAH INFORMATICS OP C100 SH COPAY 2016',
        'visitLimit': 5000,
        'reservedAmount': 0,
        'thresholdAmount': 0
      },
      <String, dynamic>{
        'status': 'AVAILABLE',
        'benefitLimit': 100000,
        'benefitType': 'OTHER',
        'benefitCode': '22701',
        'availableBalance': 100000,
        'spentAmount': 0,
        'benefit': 'Corporate 2M and above Inbuilt Riders (2016)',
        'visitLimit': 5000,
        'reservedAmount': 0,
        'thresholdAmount': 0
      }
    ],
    'payerDetails': <String, dynamic>{
      'sladeCode': 457,
      'bpType': 'PAYER',
      'name': 'Jubilee',
      'contacts': <String, dynamic>{
        'EMA': <dynamic>['info@jubileekenya.com'],
        'FAX': <dynamic>['254 (0) 20 328 1150'],
        'PHO': <dynamic>['+254709949000']
      }
    },
    'cover': <String, dynamic>{
      'group': 'SAVANNAH INFORMATICS LIMITED',
      'category': 'SAVANNAH INFORMATICS LIMITED',
      'validFrom': '2020-08-15T00:00:00+03:00',
      'validTo': '2021-08-15T00:00:00+03:00'
    }
  };
}

Map<String, dynamic> createUserMock() {
  return <String, dynamic>{
    'profile': <String, dynamic>{
      'id': 'fdf221cd-fa7f-43f9-b688-83472cc4e146',
      'userName': '@objective_lichterman16124254',
      'primaryPhone': '+254710000000',
      'userBioData': <String, dynamic>{
        'firstName': null,
        'lastName': null,
        'dateOfBirth': null,
        'gender': '',
      }
    },
    'auth': <String, dynamic>{
      'customToken':
          'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI4NDE5NDc3NTQ4NDctY29tcHV0ZUBkZXZlbG9wZXIuZ3NlcnZpY2VhY2NvdW50LmNvbSIsImF1ZCI6Imh0dHBzOi8vaWRlbnRpdHl0b29sa2l0Lmdvb2dsZWFwaXMuY29tL2dvb2dsZS5pZGVudGl0eS5pZGVudGl0eXRvb2xraXQudjEuSWRlbnRpdHlUb29sa2l0IiwiZXhwIjoxNjE0MDgzNjYzLCJpYXQiOjE2MTQwODAwNjMsInN1YiI6Ijg0MTk0Nzc1NDg0Ny1jb21wdXRlQGRldmVsb3Blci5nc2VydmljZWFjY291bnQuY29tIiwidWlkIjoiMG9PZ0hqemtFUldjUUJzeXFYSG94elBBSDMyMyJ9.crVJKL1azlG-gT_e_tGYDYfjvfWsTdXoQBAnFQOF91doeUJiMAMnfk3u0Y1Qm13v1AwPtJEQBzore50y4-6HM84ltBAHa1VEuYTMHiDkwa92xD7nKv2m4JKdXNGwEfdgUIAr0TSBv8TqU4j3tDZpCsRX2cpPrImNLFsO60187QwrD6_2-1UCRElo9S-bsZMAEAu13iAW4WzEUyIP3CdS6WV7MIe7u5gEvMR7iU6XsXz1cTMZHFIxT2ksP3BL2HZCJFvB_HwIuIMnbfmc7JXs1sqPrMVRtWbVaLdwUZwIxIjFfim7OF8OntzeMdUG0DYr7DodP-wAb3JjoxAQIYjRYA',
      'id_token':
          'eyJhbGciOiJSUzI1NiIsImtpZCI6IjBlYmMyZmI5N2QyNWE1MmQ5MjJhOGRkNTRiZmQ4MzhhOTk4MjE2MmIiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYmV3ZWxsLWFwcCIsImF1ZCI6ImJld2VsbC1hcHAiLCJhdXRoX3RpbWUiOjE2MTQwODAwNjMsInVzZXJfaWQiOiIwb09nSGp6a0VSV2NRQnN5cVhIb3h6UEFIMzIzIiwic3ViIjoiMG9PZ0hqemtFUldjUUJzeXFYSG94elBBSDMyMyIsImlhdCI6MTYxNDA4MDA2MywiZXhwIjoxNjE0MDgzNjYzLCJwaG9uZV9udW1iZXIiOiIrMjU0NzI0ODg4MTg0IiwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJwaG9uZSI6WyIrMjU0NzI0ODg4MTg0Il19LCJzaWduX2luX3Byb3ZpZGVyIjoiY3VzdG9tIn19.sgssg6lOMhYyhcFdBcEBxM-fTyolporU9g6aSEUeg9g3eXCBox1k4GJOho3aeunikNd7JWMMGU_PQeHOHPSHQzayGo31ttr_SHnAD6EGMrCCGBl9ulTlFhCGGVjcpxm-yl3IY7q30eVu3klEY07KOliuhnPBFAJEKAaT1aN0fGmm6FPjNBd98K-XoC8Xbp3VtU9zeu8dzPtcHmIZp2w3VmWaEGXSmYVW9h1LxZjjKknK0aqXqpnA1jeBE1QVblEYIofeCUhSQi06lUQzwK9YNF2CUXIvrL-vnhZBNiECpBtX_pDEk2GjYcueLSFIz4GgoSTuwDmDqcOhrjHF3FzNNQ',
      'expires_in': '1200',
      'refresh_token':
          'AOvuKvRTbMrPuynnYIdNdZrEId4WBOnwpy1lLIMgDOUZeO7r70qptXhB1CHmyNf5yXpuZA1oXTGC1JMwSMNJ4p9lua0ipjWAuIeJ4lY5H7fcDm23yRDmuqnI9h9RgHmhl36ej5_ILKXlFcsfTvijlun7E7ejSkOOHA1b7iKcpg8FhJvNqefQOZ4',
      'uid': '0oOgHjzkERWcQBsyqXHoxzPAH323',
      'is_admin': false,
      'is_anonymous': false,
      'can_experiment': false,
      'change_pin': false,
    },
    'communicationSettings': <String, dynamic>{
      'id': 'b6eb286c-8183-4c67-a4f4-ebb5efc3672a',
      'profileID': 'fdf221cd-fa7f-43f9-b688-83472cc4e146',
      'allowWhatsApp': true,
      'allowTextSMS': true,
      'allowPush': true,
      'allowEmail': true
    },
  };
}

Map<String, dynamic> loginUserMock() {
  return <String, dynamic>{
    'phoneNumber': '+254710000000',
    'pin': '1234',
    'flavour': 'CONSUMER',
    'auth': <String, dynamic>{
      'customToken':
          'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI4NDE5NDc3NTQ4NDctY29tcHV0ZUBkZXZlbG9wZXIuZ3NlcnZpY2VhY2NvdW50LmNvbSIsImF1ZCI6Imh0dHBzOi8vaWRlbnRpdHl0b29sa2l0Lmdvb2dsZWFwaXMuY29tL2dvb2dsZS5pZGVudGl0eS5pZGVudGl0eXRvb2xraXQudjEuSWRlbnRpdHlUb29sa2l0IiwiZXhwIjoxNjE0MDgzNjYzLCJpYXQiOjE2MTQwODAwNjMsInN1YiI6Ijg0MTk0Nzc1NDg0Ny1jb21wdXRlQGRldmVsb3Blci5nc2VydmljZWFjY291bnQuY29tIiwidWlkIjoiMG9PZ0hqemtFUldjUUJzeXFYSG94elBBSDMyMyJ9.crVJKL1azlG-gT_e_tGYDYfjvfWsTdXoQBAnFQOF91doeUJiMAMnfk3u0Y1Qm13v1AwPtJEQBzore50y4-6HM84ltBAHa1VEuYTMHiDkwa92xD7nKv2m4JKdXNGwEfdgUIAr0TSBv8TqU4j3tDZpCsRX2cpPrImNLFsO60187QwrD6_2-1UCRElo9S-bsZMAEAu13iAW4WzEUyIP3CdS6WV7MIe7u5gEvMR7iU6XsXz1cTMZHFIxT2ksP3BL2HZCJFvB_HwIuIMnbfmc7JXs1sqPrMVRtWbVaLdwUZwIxIjFfim7OF8OntzeMdUG0DYr7DodP-wAb3JjoxAQIYjRYA',
      'id_token':
          'eyJhbGciOiJSUzI1NiIsImtpZCI6IjBlYmMyZmI5N2QyNWE1MmQ5MjJhOGRkNTRiZmQ4MzhhOTk4MjE2MmIiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYmV3ZWxsLWFwcCIsImF1ZCI6ImJld2VsbC1hcHAiLCJhdXRoX3RpbWUiOjE2MTQwODAwNjMsInVzZXJfaWQiOiIwb09nSGp6a0VSV2NRQnN5cVhIb3h6UEFIMzIzIiwic3ViIjoiMG9PZ0hqemtFUldjUUJzeXFYSG94elBBSDMyMyIsImlhdCI6MTYxNDA4MDA2MywiZXhwIjoxNjE0MDgzNjYzLCJwaG9uZV9udW1iZXIiOiIrMjU0NzI0ODg4MTg0IiwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJwaG9uZSI6WyIrMjU0NzI0ODg4MTg0Il19LCJzaWduX2luX3Byb3ZpZGVyIjoiY3VzdG9tIn19.sgssg6lOMhYyhcFdBcEBxM-fTyolporU9g6aSEUeg9g3eXCBox1k4GJOho3aeunikNd7JWMMGU_PQeHOHPSHQzayGo31ttr_SHnAD6EGMrCCGBl9ulTlFhCGGVjcpxm-yl3IY7q30eVu3klEY07KOliuhnPBFAJEKAaT1aN0fGmm6FPjNBd98K-XoC8Xbp3VtU9zeu8dzPtcHmIZp2w3VmWaEGXSmYVW9h1LxZjjKknK0aqXqpnA1jeBE1QVblEYIofeCUhSQi06lUQzwK9YNF2CUXIvrL-vnhZBNiECpBtX_pDEk2GjYcueLSFIz4GgoSTuwDmDqcOhrjHF3FzNNQ',
      'expires_in': '3600',
      'refresh_token':
          'AOvuKvRTbMrPuynnYIdNdZrEId4WBOnwpy1lLIMgDOUZeO7r70qptXhB1CHmyNf5yXpuZA1oXTGC1JMwSMNJ4p9lua0ipjWAuIeJ4lY5H7fcDm23yRDmuqnI9h9RgHmhl36ej5_ILKXlFcsfTvijlun7E7ejSkOOHA1b7iKcpg8FhJvNqefQOZ4',
      'uid': '0oOgHjzkERWcQBsyqXHoxzPAH323',
      'is_admin': false,
      'is_anonymous': false,
      'can_experiment': false,
      'change_pin': false,
    },
  };
}

Map<String, dynamic> changePINloginMock() {
  return <String, dynamic>{
    'phoneNumber': '+254710000000',
    'pin': '1234',
    'flavour': 'CONSUMER',
    'profile': <String, dynamic>{
      'id': 'fdf221cd-fa7f-43f9-b688-83472cc4e146',
      'userName': '@objective_lichterman16124254',
      'primaryPhone': '+254710000000',
      'userBioData': <String, dynamic>{
        'firstName': null,
        'lastName': null,
        'dateOfBirth': null,
        'gender': '',
      }
    },
    'auth': <String, dynamic>{
      'customToken': 'someCustomToken',
      'id_token': 'someIdToken',
      'expires_in': '1200',
      'refresh_token': 'someRefreshToken',
      'uid': '0oOgHjzkERWcQBsyqXHoxzPAH323',
      'is_admin': false,
      'is_anonymous': false,
      'can_experiment': true,
      'change_pin': true,
    },
  };
}

Map<String, dynamic> changePINMock() {
  return <String, dynamic>{
    'data': <String, dynamic>{'updateUserPIN': true}
  };
}

Map<String, dynamic> resetPINMock() {
  return <String, dynamic>{'otp': '856839'};
}

Map<String, dynamic> getLibraryMock() {
  return <String, dynamic>{
    'data': <String, dynamic>{
      'getLibraryContent': <dynamic>[
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
        }
      ]
    }
  };
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

Map<String, dynamic> getFeedMock() {
  return <String, dynamic>{
    'data': <String, dynamic>{
      'getFeed': <String, dynamic>{
        'uid': 'LMqDCyyciFMWHfOsvYa76L6dya73',
        'isAnonymous': false,
        'flavour': 'CONSUMER',
        'persistent': 'BOTH',
        'actions': <dynamic>[
          <String, dynamic>{
            'id': '1nO8hIc8ZXThjaqmQFL1XHVXgCp',
            'sequenceNumber': 1,
            'name': 'SEARCH_PATIENT',
            'actionType': 'SECONDARY',
            'handling': 'FULL_PAGE',
            'allowAnonymous': false
          }
        ],
        'nudges': <dynamic>[
          <String, dynamic>{
            'id': '1608729954',
            'sequenceNumber': 1608729964,
            'visibility': 'SHOW',
            'status': 'PENDING',
            'title': 'Complete your rider KYC',
            'text':
                'Fill in your My Afya Hub business KYC in order to start transacting',
            'actions': <dynamic>[
              <String, dynamic>{
                'id': '1608647889',
                'sequenceNumber': 1608647899,
                'name': 'COMPLETE_INDIVIDUAL_RIDER_KYC',
                'actionType': 'PRIMARY',
                'handling': 'FULL_PAGE',
                'allowAnonymous': false
              }
            ],
            'groups': <String>['hOcaUv8dqqgmWYf9HEhjdudgf0b2'],
            'users': <String>['hOcaUv8dqqgmWYf9HEhjdudgf0b2'],
            'links': <dynamic>[
              <String, dynamic>{
                'id': '1608729974',
                'url': 'https://assets.healthcloud.co.ke/bewell_logo.png',
                'linkType': 'PNG_IMAGE'
              }
            ],
            'notificationChannels': <String>['EMAIL', 'FCM'],
          },
        ],
        'items': <dynamic>[]
      },
    }
  };
}

Map<String, dynamic> resumeWithPINMock() {
  return <String, dynamic>{
    'data': <String, dynamic>{'resumeWithPIN': true}
  };
}

Map<String, dynamic> addCoverMock() {
  return <String, dynamic>{
    'data': <String, dynamic>{
      'addCover': <String, dynamic>{
        'message': 'cover is LIVE',
        'status': 'VALID_COVER',
        'eligibilityTime': '2021-01-26T10:43:46Z'
      }
    }
  };
}

Map<String, dynamic> coverVerificationRequestsMock() {
  return <String, dynamic>{
    'data': <String, dynamic>{
      'getMemberRequestByPhoneNumber': <dynamic>[
        <String, dynamic>{
          'timeStamp': '2021-05-01T19:01:51+03:00',
          'payerSladeCode': '1234',
          'memberNumber': '123456',
          'idNo': '123456',
          'state': 'PENDING',
          'payerName': 'BeWell Test'
        }
      ]
    },
  };
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

final http.Response coverRequestsResponse = http.Response(
  json.encode(coverVerificationRequestsMock()),
  201,
);

final http.Response coverRequestsResponseEmpty = http.Response(
  json.encode(coverVerificationRequestsMockEmpty()),
  201,
);

Map<String, dynamic> getMemberInfoMock() {
  return <String, dynamic>{
    'data': <String, dynamic>{
      'preauthorizations': <dynamic>[
        <String, dynamic>{
          'status': 'FINALISED',
          'benefitType': 'OUTPATIENT',
          'preauthType': 'OTHER',
          'providerName': 'The Nairobi Womens Hospital',
          'serviceStart': '2021-01-26T18:21:08+03:00',
          'serviceEnd': '2021-01-26T18:24:49+03:00',
          'finalApprovedAmount': 8000
        },
        <String, dynamic>{
          'status': 'FINALISED',
          'benefitType': 'OUTPATIENT',
          'preauthType': 'OTHER',
          'providerName': 'Menelik Medical Centre',
          'serviceStart': '2020-12-03T12:28:39+03:00',
          'serviceEnd': '2020-12-03T12:28:38+03:00',
          'finalApprovedAmount': 8750
        },
        <String, dynamic>{
          'status': 'FINALISED',
          'benefitType': 'OUTPATIENT',
          'preauthType': 'PRESCRIPTION',
          'providerName': 'The Karen Hospital Ltd',
          'serviceStart': '2020-11-17T13:47:54+03:00',
          'serviceEnd': '2020-11-17T13:47:46+03:00',
          'finalApprovedAmount': 13000
        }
      ],
      'authorizations': <dynamic>[
        <String, dynamic>{
          'providerName': 'Menelik Medical Centre',
          'dateAuthorized': '2021-01-29T07:55:20Z',
          'authorizationType': <dynamic>['OTP'],
          'status': 'AUTHORIZED'
        },
        <String, dynamic>{
          'providerName': 'The Nairobi Womens Hospital',
          'dateAuthorized': '2021-01-26T15:16:51Z',
          'authorizationType': <dynamic>['OTP'],
          'status': 'AUTHORIZED'
        },
      ],
      'invoices': <dynamic>[
        <String, dynamic>{
          'proposedValueLessCopays': 7200,
          'totalCopayValue': 0,
          'providerClaimNo': '2021-0292',
          'billFrom': '2021-01-29T10:55:20+03:00',
          'provider': <String, dynamic>{'name': 'Menelik Medical Centre'},
          'claimLines': <dynamic>[
            <String, dynamic>{
              'claimLineTotal': 2250,
              'name': 'xray of the pelvic',
              'quantity': '1.0000',
              'unitPrice': '2250.00'
            },
            <String, dynamic>{
              'claimLineTotal': 2700,
              'name':
                  'X-Ray of the  Lumbar Spine, Combined Anteroposterior and Lateral',
              'quantity': '1.0000',
              'unitPrice': '2700.00'
            },
            <String, dynamic>{
              'claimLineTotal': 2250,
              'name': 'x ray of the knee',
              'quantity': '1.0000',
              'unitPrice': '2250.00'
            }
          ],
          'diagnoses': <dynamic>[
            <String, dynamic>{
              'name': 'Typhoid and malaria',
            },
            <String, dynamic>{
              'name': 'Kidney stones',
            },
          ],
        },
        <String, dynamic>{
          'proposedValueLessCopays': 886.6,
          'totalCopayValue': 0,
          'providerClaimNo': 'OIAD2000006944',
          'billFrom': '2021-01-26T18:43:27+03:00',
          'provider': <String, dynamic>{'name': 'The Nairobi Womens Hospital'},
          'claimLines': <dynamic>[
            <String, dynamic>{
              'claimLineTotal': 886.6,
              'name': 'NEUROCARE FORTE TABS',
              'quantity': '10.0000',
              'unitPrice': '88.66'
            }
          ],
          'diagnoses': <dynamic>[
            <String, dynamic>{
              'name': 'Typhoid and malaria',
            },
            <String, dynamic>{
              'name': 'Kidney stones',
            },
          ],
        },
        <String, dynamic>{
          'proposedValueLessCopays': 10000,
          'totalCopayValue': 0,
          'providerClaimNo': 'OIAD2000006943',
          'billFrom': '2021-01-26T16:54:24+03:00',
          'provider': <String, dynamic>{'name': 'The Nairobi Womens Hospital'},
          'claimLines': <dynamic>[
            <String, dynamic>{
              'claimLineTotal': 2000,
              'name': 'SPECIALIZED CLINICS CONSULTATION',
              'quantity': '1.0000',
              'unitPrice': '2000.00'
            },
            <String, dynamic>{
              'claimLineTotal': 8000,
              'name': 'CT HEAD',
              'quantity': '1.0000',
              'unitPrice': '8000.00'
            }
          ],
          'diagnoses': <dynamic>[
            <String, dynamic>{
              'name': 'Typhoid and malaria',
            },
            <String, dynamic>{
              'name': 'Kidney stones',
            },
          ],
        },
        <String, dynamic>{
          'proposedValueLessCopays': 2500,
          'totalCopayValue': 0,
          'providerClaimNo': '2021-0181P',
          'billFrom': '2021-01-26T13:51:16+03:00',
          'provider': <String, dynamic>{'name': 'Prof. GAKUU LAWRENCE NDEGWA'},
          'claimLines': <dynamic>[
            <String, dynamic>{
              'claimLineTotal': 2500,
              'name': 'Specialist Consultation',
              'quantity': '1.0000',
              'unitPrice': '2500.00'
            }
          ],
          'diagnoses': <dynamic>[
            <String, dynamic>{
              'name': 'Typhoid and malaria',
            },
            <String, dynamic>{
              'name': 'Kidney stones',
            },
          ],
        },
      ],
      'balanceReservations': <dynamic>[
        <String, dynamic>{
          'invoiceNumber': '2021-0292',
          'providerName': 'Menelik Medical Centre',
          'dateReserved': '2021-01-29T10:59:10+03:00',
          'amount': '7200.00',
          'dateReleased': '2021-01-29T18:30:46+03:00'
        },
        <String, dynamic>{
          'invoiceNumber': '2021-0292',
          'providerName': 'Menelik Medical Centre',
          'dateReserved': '2021-01-29T18:30:46+03:00',
          'amount': '7200.00',
          'dateReleased': null
        },
        <String, dynamic>{
          'invoiceNumber': '2021-0292',
          'providerName': 'Menelik Medical Centre',
          'dateReserved': '2021-01-26T16:11:35+03:00',
          'amount': '0.00',
          'dateReleased': null
        },
        <String, dynamic>{
          'invoiceNumber': 'OIAD2000006943',
          'providerName': 'The Nairobi Womens Hospital',
          'dateReserved': '2021-01-27T03:31:17+03:00',
          'amount': '10000.00',
          'dateReleased': null
        },
        <String, dynamic>{
          'invoiceNumber': 'OIAD2000006944',
          'providerName': 'The Nairobi Womens Hospital',
          'dateReserved': '2021-01-27T03:31:14+03:00',
          'amount': '886.60',
          'dateReleased': null
        },
        <String, dynamic>{
          'invoiceNumber': '0',
          'providerName': 'The Nairobi Womens Hospital',
          'dateReserved': '2021-01-26T18:20:12+03:00',
          'amount': '0.00',
          'dateReleased': '2021-01-27T03:31:14+03:00'
        },
        <String, dynamic>{
          'invoiceNumber': 'OIAD2000006943',
          'providerName': 'The Nairobi Womens Hospital',
          'dateReserved': '2021-01-26T18:51:11+03:00',
          'amount': '10000.00',
          'dateReleased': '2021-01-27T03:31:14+03:00'
        },
        <String, dynamic>{
          'invoiceNumber': 'OIAD2000006944',
          'providerName': 'The Nairobi Womens Hospital',
          'dateReserved': '2021-01-26T18:51:48+03:00',
          'amount': '886.60',
          'dateReleased': '2021-01-27T03:31:14+03:00'
        },
        <String, dynamic>{
          'invoiceNumber': 'INV/25665/748317',
          'providerName': 'Prof. GAKUU LAWRENCE NDEGWA',
          'dateReserved': '2021-01-26T15:09:35+03:00',
          'amount': '2500.00',
          'dateReleased': '2021-01-26T21:30:25+03:00'
        },
        <String, dynamic>{
          'invoiceNumber': '2021-0181P',
          'providerName': 'Prof. GAKUU LAWRENCE NDEGWA',
          'dateReserved': '2021-01-26T21:30:25+03:00',
          'amount': '2500.00',
          'dateReleased': null
        }
      ]
    }
  };
}

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
    builder: (BuildContext context) => const Placeholder());

final Map<String, Map<String, dynamic>?> loginResponse =
    <String, Map<String, Object?>?>{
  'auth': <String, dynamic>{
    'can_experiment': true,
    'customToken':
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI4NDE5NDc3NTQ4NDctY29tcHV0ZUBkZXZlbG9wZXIuZ3NlcnZpY2VhY2NvdW50LmNvbSIsImF1ZCI6Imh0dHBzOi8vaWRlbnRpdHl0b29sa2l0Lmdvb2dsZWFwaXMuY29tL2dvb2dsZS5pZGVudGl0eS5pZGVudGl0eXRvb2xraXQudjEuSWRlbnRpdHlUb29sa2l0IiwiZXhwIjoxNjE2MTc0OTE1LCJpYXQiOjE2MTYxNzEzMTUsInN1YiI6Ijg0MTk0Nzc1NDg0Ny1jb21wdXRlQGRldmVsb3Blci5nc2VydmljZWFjY291bnQuY29tIiwidWlkIjoidEdlb0ZEYWNWeE9hWE5vQlpocXFoYlhJTlpyMSJ9.XqmWnN1zeGag5MVRzQUO-o9i-Ef3zMQ6qJWl7yPLjaArMhhPOTx7IBV8MtAtb3z-j5Qg5OzUq5kD0invwzN6jH5FNPALcVptf2DVi0cglHhT5gnaHf9EhHd_HfR0fNiLiGIgsS4xkGbaoL5FXuHhkuvOAddlg8QjsITgeVpNVKvYZrbLgMoz2m-AQPvQeOVQOYRH_6G6v9EHwkOFF2pjtZ3P7OJE3M9S6LRCLd04Pdb3WsiCCby3nUKo6eK8f_0K5SzaicOFlG97tHOpMsbcLKh52h8W-XP-Q-zxz3YtmJzo_FJ8GS65FJleuPH0m2K6aM2Yohnhl5T14SadKkTluA',
    'expires_in': '3600',
    'id_token':
        'eyJhbGciOiJSUzI1NiIsImtpZCI6IjRlMDBlOGZlNWYyYzg4Y2YwYzcwNDRmMzA3ZjdlNzM5Nzg4ZTRmMWUiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYmV3ZWxsLWFwcCIsImF1ZCI6ImJld2VsbC1hcHAiLCJhdXRoX3RpbWUiOjE2MTYxNzEzMTYsInVzZXJfaWQiOiJ0R2VvRkRhY1Z4T2FYTm9CWmhxcWhiWElOWnIxIiwic3ViIjoidEdlb0ZEYWNWeE9hWE5vQlpocXFoYlhJTlpyMSIsImlhdCI6MTYxNjE3MTMxNiwiZXhwIjoxNjE2MTc0OTE2LCJwaG9uZV9udW1iZXIiOiIrMjU0NzE4Mzc2MTYzIiwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJwaG9uZSI6WyIrMjU0NzE4Mzc2MTYzIl19LCJzaWduX2luX3Byb3ZpZGVyIjoiY3VzdG9tIn19.Jbmb1K5kXciP5AiO4Q4siZldmqGj0zL374BLlsqjyN0W7CigadsFtAm8zeORT958uBatRt9URGchmii45YQCurwt1v31DsnQTV0Zy0NUwkZx0CNUwIBqOmASDJX63qK79h3-dR9dMeRGQy3TntUnKEWUJ4U9JKuSpq7XFtn0O75ReC_PUgOjicuaWEJEb0GtK0TGEAPiGsDjNDkUcfZxa9rMGyxyQo_B0bR3sznOquuYAk9-iD2_to7m9ORhpziGNFq6nGqYtjMBAc1Px44_g7kZIKy6IjSB_VRFeKJ8WAXm_JKd1GlRvheDKNSjrlCsh9tIJF1vNHZU4x6DDMCLHw',
    'is_admin': false,
    'is_anonymous': false,
    'refresh_token':
        'AOvuKvSUUOtClp53pQ3x0Jf31cV4nUtXf2G6eUZ9de2_QJ3nTYPhfjGwQV7mwdyjLCMEjylQCwALrOXr9J45qI7-11ZUHtyIGR3l2sxCB88lIkSc5uddNb_MGBqyY6-t8AGR027ZQ-GuJfqvkJfOayXhjLubPtpGoB2UVFKopBINzEoKCpTyNJg',
    'uid': 'tGeoFDacVxOaXNoBZhqqhbXINZr1'
  },
  'communicationSettings': <String, dynamic>{
    'allowEmail': true,
    'allowPush': false,
    'allowTextSMS': true,
    'allowWhatsApp': false,
    'id': 'c185150b-7422-4b3f-a16d-248a8cbe7aed',
    'profileID': 'ff83b587-d78a-498f-b0df-4d8cc9d4eb04'
  },
  'customerProfile': <String, dynamic>{
    'active': false,
    'customerID': '54673a93-afff-4d02-b950-167023ab9ce3',
    'profileID': 'ff83b587-d78a-498f-b0df-4d8cc9d4eb04',
    'receivables_account': <String, dynamic>{
      'description': '',
      'id': '',
      'is_active': false,
      'name': '',
      'number': '',
      'tag': ''
    }
  },
  'profile': <String, dynamic>{
    'id': 'ff83b587-d78a-498f-b0df-4d8cc9d4eb04',
    'primaryEmailAddress': null,
    'primaryPhone': '+254718376163',
    'pushTokens': <String>[
      'cYk02pveSheo5QiEvmoyZ6:APA91bFdBqBJSbhbaTlG5Nylpz9LiMpzFbLLKvfOi6JuwfGt_vRHlLTC8UV9NczbqcV5YR4MTh4Awok8ssKRRpGOQDJK2yeVhaZjCBRHGmR8_AqBdUNBOJXFnGvdiPwWh1vjFt-FkcIe'
    ],
    'covers': <Map<String, dynamic>>[
      <String, dynamic>{
        'payer_name': 'JICK',
        'payer_slade_code': 123,
        'member_number': '123255',
        'member_name': 'Bewell Test'
      }
    ],
    'secondaryEmailAddresses': null,
    'secondaryPhoneNumbers': <String>['+254712654897', '+254723369852'],
    'suspended': false,
    'terms_accepted': true,
    'userBioData': <String, dynamic>{
      'dateOfBirth': '1996-02-07',
      'firstName': 'Dex',
      'gender': 'unknown',
      'lastName': 'ter'
    },
    'userName': '@suspicious_ishizaka8254254',
    'verifiedIdentifiers': <Map<String, dynamic>>[
      <String, dynamic>{
        'loginProvider': 'PHONE',
        'timeStamp': '2021-02-19T10:04:39.795501Z',
        'uid': 'tGeoFDacVxOaXNoBZhqqhbXINZr1'
      }
    ],
    'verifiedUIDS': <String>['tGeoFDacVxOaXNoBZhqqhbXINZr1']
  },
  'supplierProfile': <String, dynamic>{
    'accountType': '',
    'active': false,
    'ediuserprofile': null,
    'id': '',
    'isOrganizationVerified': false,
    'kycSubmitted': false,
    'organizationName': '',
    'parentOrganizationID': '',
    'partnerSetupComplete': true,
    'partnerType': 'PROVIDER',
    'payables_account': null,
    'profileID': '7c837f99-d96d-4f86-8b59-d0aae57a0434',
    'sladeCode': '',
    'supplierID': '787901cd-44de-4500-8a37-63e84187de0b',
    'supplierKYC': null,
    'supplierName': 'Abiud Orina',
    'underOrganization': false
  }
};

void setUpMocks() {
  final http.Response response = http.Response(
    json.encode(<String, dynamic>{
      'data': <String, dynamic>{'covers': returnCoversMock()}
    }),
    201,
  );

  when(baseGraphQlClientMock.toMap(coverRequestsErrorResponse)).thenReturn(
      json.decode(coverRequestsErrorResponse.body) as Map<String, dynamic>);

  when(baseGraphQlClientMock.parseError(
    <String, dynamic>{
      'errors': 'An error occurred',
    },
  )).thenReturn(null);

  when(baseGraphQlClientMock.toMap(response))
      .thenReturn(json.decode(response.body) as Map<String, dynamic>);
}

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
  FirebaseRemoteConfigPlatform delegateFor({FirebaseApp? app}) {
    return super.noSuchMethod(
      Invocation.method(
          #delegateFor, <dynamic>[], <Symbol, Object?>{#app: app}),
      returnValue: TestFirebaseRemoteConfigPlatform(),
      returnValueForMissingStub: TestFirebaseRemoteConfigPlatform(),
    ) as FirebaseRemoteConfigPlatform;
  }

  @override
  FirebaseRemoteConfigPlatform setInitialValues(
      {Map<dynamic, dynamic>? remoteConfigValues}) {
    return super.noSuchMethod(
      Invocation.method(#setInitialValues, <dynamic>[],
          <Symbol, Object?>{#remoteConfigValues: remoteConfigValues}),
      returnValue: TestFirebaseRemoteConfigPlatform(),
      returnValueForMissingStub: TestFirebaseRemoteConfigPlatform(),
    ) as FirebaseRemoteConfigPlatform;
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
  double getDouble(String key) {
    return super.noSuchMethod(
      Invocation.method(#getDouble, <dynamic>[key]),
      returnValue: 8.8,
      returnValueForMissingStub: 8.8,
    ) as double;
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

  void instanceFor({
    FirebaseApp? app,
    Map<dynamic, dynamic>? pluginConstants,
  }) {}

  @override
  FirebaseRemoteConfigPlatform delegateFor({FirebaseApp? app}) {
    return this;
  }

  @override
  FirebaseRemoteConfigPlatform setInitialValues(
      {Map<dynamic, dynamic>? remoteConfigValues}) {
    return this;
  }
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

  when(mockRemoteConfigPlatform.instanceFor(
          app: anyNamed('app'), pluginConstants: anyNamed('pluginConstants')))
      .thenAnswer((_) => mockRemoteConfigPlatform);

  when(mockRemoteConfigPlatform.delegateFor(
    app: anyNamed('app'),
  )).thenAnswer((_) => mockRemoteConfigPlatform);

  when(mockRemoteConfigPlatform.setInitialValues(
          remoteConfigValues: anyNamed('remoteConfigValues')))
      .thenAnswer((_) => mockRemoteConfigPlatform);

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
    'iconUrl': 'https://wallpaperaccess.com/full/2213426.jpg',
    'title': 'Kilimani',
    'totalMembers': '1.3k Members',
  },
  <String, dynamic>{
    'iconUrl': 'https://wallpaperaccess.com/full/2213426.jpg',
    'title': 'Ruaraka',
    'totalMembers': '1.3k Members',
  },
  <String, dynamic>{
    'iconUrl': 'https://wallpaperaccess.com/full/2213426.jpg',
    'title': 'Ruaraka',
    'totalMembers': '1.3k Members',
  },
  <String, dynamic>{
    'iconUrl': 'https://wallpaperaccess.com/full/2213426.jpg',
    'title': 'Ruaraka',
    'totalMembers': '1.3k Members',
  }
];

List<Map<String, dynamic>> mockFeed = <Map<String, dynamic>>[
  <String, dynamic>{
    'coverImageUrl': contentItemImageUrl,
    'header': feedHeader,
    'date': '',
    'isNew': true
  },
  <String, dynamic>{
    'coverImageUrl': contentItemImageUrl,
    'header': feedHeader,
    'date': '',
    'readTime': feedReadTime
  },
  <String, dynamic>{
    'coverImageUrl': contentItemImageUrl,
    'header': feedHeader,
    'date': '',
  },
  <String, dynamic>{
    'coverImageUrl': contentItemImageUrl,
    'header': feedHeader,
    'date': '',
  },
];
