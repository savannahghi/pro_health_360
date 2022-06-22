import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/core/get_stream_token.dart';

void main() {
  test('should convert from/to json', () {
    final GetStreamToken result =
        GetStreamToken.fromJson(<String, dynamic>{'getStreamToken': '1234'});

    expect(result.getStreamToken, '1234');
  });
}
