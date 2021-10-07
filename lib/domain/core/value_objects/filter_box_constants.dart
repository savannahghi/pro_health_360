// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/auth_criteria_object.dart';
import 'package:myafyahub/presentation/core/widgets/preauth_criteria_object.dart';

AuthCriteriaObject authObj = AuthCriteriaObject();
PreAuthCriteriaObj preauthObj = PreAuthCriteriaObj();

//authorization
Map<String, bool> authCheckBoxValues = <String, bool>{
  fingerprint: authObj.isFingerPrintChecked.valueOrNull!,
  card: authObj.isCardChecked.valueOrNull!,
  otp: authObj.isOtpChecked.valueOrNull!,
  guardian: authObj.isGuardianChecked.valueOrNull!,
};

//preauthorization
Map<String, bool> preAuthCheckBoxValues = <String, bool>{
  inpatient: preauthObj.isInpatientChecked.valueOrNull!,
  maternity: preauthObj.isMaternityChecked.valueOrNull!,
  dental: preauthObj.isDentalChecked.valueOrNull!,
  optical: preauthObj.isOpticalChecked.valueOrNull!,
  prescription: preauthObj.isPrescriptionChecked.valueOrNull!,
  lab: preauthObj.isLabChecked.valueOrNull!,
  radiology: preauthObj.isRadiologyChecked.valueOrNull!,
};
