// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'tests_resources/shared_resources.dart';

Future<void> fireEvent(WidgetTester tester) async {
  await tester.pump(Duration.zero);
}

const String testPhoneNumber = '0710000000';
const String testPhoneNumber2 = '0712345678';
const String testPhoneNumber3 = '';
const String testOTP = '123456';
const String testEmail = 'bewellisawesome@bewell.com';
const String testPin = '1234';

final Map<String, dynamic> testPayload = <String, dynamic>{
  'branchID': '01',
  'branchName': 'testBenefit',
  'branchSladeCode': '200',
  'branchProfilePhoto': '',
  'branchSpecialties': 'specialties',
  'branchCoordinates': 'branchCoordinates',
  'branchAverageConsultationPrice': 200,
  'branchAverageTeleconsultationPrice': 250,
  'branchProfile': 'profile',
  'branchPhones': 'phones',
  'branchEmails': 'emails',
  'branchAverageRating': 4,
  'branchNumberOfRatings': 50,
  'isBookFutureAppointment': false,
};

final Map<String, dynamic> testPayloadWithImage = <String, dynamic>{
  'branchID': '01',
  'branchName': 'testBenefit',
  'branchSladeCode': '200',
  'branchProfilePhoto': SharedResources.base64ImageString,
  'branchSpecialties': 'specialties',
  'branchCoordinates': 'branchCoordinates',
  'branchAverageConsultationPrice': 200,
  'branchAverageTeleconsultationPrice': 250,
  'branchProfile': 'profile',
  'branchPhones': 'phones',
  'branchEmails': 'emails',
  'branchAverageRating': 4,
  'branchNumberOfRatings': 'numberOfRatings',
  'isBookFutureAppointment': false,
};

final Map<String, dynamic> authorizationMock = <String, dynamic>{
  'authorizations': <dynamic>[
    <String, dynamic>{
      'providerName': 'Kericho Outpatient Medical Centre',
      'dateAuthorized': '2021-03-29T11:57:59Z',
      'authorizationType': <dynamic>['FINGERPRINT'],
      'status': 'AUTHORIZED'
    },
    <String, dynamic>{
      'providerName': 'Kericho Outpatient Medical Centre',
      'dateAuthorized': '2021-03-17T14:46:11Z',
      'authorizationType': <dynamic>['FINGERPRINT'],
      'status': 'CLOSED'
    },
    <String, dynamic>{
      'providerName': 'Kericho Outpatient Medical Centre',
      'dateAuthorized': '2021-02-01T09:42:54Z',
      'authorizationType': <dynamic>['CARD', 'FINGERPRINT'],
      'status': 'AUTHORIZED'
    }
  ]
};

final List<dynamic> testAuthorization = <dynamic>[
  <String, dynamic>{
    'authorizationType': <dynamic>['FINGERPRINT', 'OTP'],
    'payerSladeCode': '200',
    'memberNumber': '01',
    'benefitCode': '200',
    'status': 'ATHORIZED',
    'providerName': 'My Afya Hub hospital',
    'dateAuthorized': '2020-02-13'
  },
  <String, dynamic>{
    'authorizationType': <dynamic>['OTP'],
    'payerSladeCode': '1',
    'memberNumber': '02',
    'benefitCode': '200',
    'status': 'ATHORIZED',
    'providerName': 'My Afya Hub hospital',
    'dateAuthorized': '2020-02-13'
  }
];

final Map<String, dynamic> testUtilizationCache = <String, dynamic>{
  'data': <String, dynamic>{
    'preauthorizations': <dynamic>[],
    'authorizations': <dynamic>[],
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
        ]
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
        ]
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
        ]
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
        ]
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

final List<dynamic> libListItems = <dynamic>[
  <String, dynamic>{
    'featuredImage':
        'https://images.unsplash.com/photo-1525466760727-1d8be8721154?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=2000&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ',
    'html': '<p>Exercise for a healthy life</p>',
    'publishedAt': '1969-07-20 20:18:04Z',
    'readingTime': '3',
    'tags': <dynamic>[
      <String, String>{
        'name': 'health-tip',
      }
    ]
  },
  <String, dynamic>{
    'featuredImage':
        'https://images.unsplash.com/photo-1525466760727-1d8be8721154?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=2000&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ',
    'html': '<p>Exercise for a healthy life</p>',
    'publishedAt': '1969-07-20 20:18:04Z',
    'readingTime': '3',
    'tags': <dynamic>[
      <String, String>{
        'name': 'health-tip',
      }
    ]
  },
  <String, dynamic>{
    'featuredImage':
        'https://images.unsplash.com/photo-1525466760727-1d8be8721154?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=2000&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ',
    'html': '<p>Exercise for a healthy life</p>',
    'publishedAt': '1969-07-20 20:18:04Z',
    'readingTime': '3',
    'tags': <dynamic>[
      <String, String>{
        'name': 'health-tip',
      }
    ]
  },
  <String, dynamic>{
    'featuredImage':
        'https://images.unsplash.com/photo-1525466760727-1d8be8721154?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=2000&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ',
    'html': '<p>Exercise for a healthy life</p>',
    'publishedAt': '1969-07-20 20:18:04Z',
    'readingTime': '3',
    'tags': <dynamic>[
      <String, String>{
        'name': 'health-tip',
      }
    ]
  }
];
