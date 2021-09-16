import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/core/services/app_setup_data.dart';

void main() {
  test('AppSetupData creates a valid object', () {
    final AppSetupData appSetup = AppSetupData(
      appContexts: <AppContext>[AppContext.AppDemo],
      sentryDsn: 'some sentryDNS',
    );

    expect(appSetup.sentryDsn, 'some sentryDNS');
    expect(appSetup.appContexts.first, AppContext.AppDemo);

    final AppSetupData sameSetup = AppSetupData(
      appContexts: <AppContext>[AppContext.AppDemo],
      sentryDsn: 'some sentryDNS',
    );

    expect(appSetup, sameSetup);
    expect(appSetup.hashCode, sameSetup.hashCode);
  });
}
