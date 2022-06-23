import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool.dart';

void main() {
  test('initial values', () {
    final ScreeningTool tool = ScreeningTool.initial();
    expect(tool.title, UNKNOWN);
    expect(tool.description, UNKNOWN);
  });
}
