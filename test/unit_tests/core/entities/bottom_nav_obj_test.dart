// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/home/bottom_nav_obj.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'currentBottomNavIndex': 2
  };
  test('BottomNavObj toJson', () {
    expect(
      BottomNavObj(currentBottomNavIndex: 2).toJson(),
      data,
    );
  });

  test('BottomNavObj fromJson', () {
    expect(
      BottomNavObj.fromJson(data),
      isA<BottomNavObj>(),
    );
  });
}
