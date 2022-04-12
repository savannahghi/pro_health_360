import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/entities/medical_data/medical_data_details.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/profile/medical_data/widgets/medical_data_item.dart';
import 'package:myafyahub/presentation/profile/medical_data/widgets/medical_data_item_title.dart';

class MedicalDataWidget extends StatelessWidget {
  const MedicalDataWidget({
    required this.medicalDataType,
    required this.medicalDataDetails,
  });

  final MedicalDataType medicalDataType;
  final List<MedicalDataDetails?> medicalDataDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MedicalDataItemTitle(title: medicalDataType.name),
        ...List<Widget>.generate(
          medicalDataDetails.length,
          (int index) {
            final String category =
                medicalDataDetails[index]?.category?.text ?? UNKNOWN;
            final String medicationCodeableConcept =
                medicalDataDetails[index]?.medicationCodeableConcept?.text ??
                    UNKNOWN;
            final String clinicalStatusText =
                medicalDataDetails[index]?.clinicalStatus?.text ?? UNKNOWN;
            final String valuesString =
                medicalDataDetails[index]?.valueString ?? UNKNOWN;
            return Column(
              children: <Widget>[
                if (medicalDataType == MedicalDataType.REGIMEN)
                  MedicalDataItem(
                    data: '$category - $medicationCodeableConcept',
                  ),
                if (medicalDataType == MedicalDataType.ALLERGIES)
                  MedicalDataItem(
                    data: clinicalStatusText,
                    description: index == 0 ? mostRecentString : '',
                  ),
                if (medicalDataType == MedicalDataType.WEIGHT)
                  MedicalDataItem(
                    data: '$valuesString kg',
                    description: index == 0 ? mostRecentString : '',
                  ),
                if (medicalDataType == MedicalDataType.VIRAL_LOAD ||
                    medicalDataType == MedicalDataType.BMI ||
                    medicalDataType == MedicalDataType.CD4COUNT)
                  MedicalDataItem(
                    data: valuesString,
                    description: index == 0 ? mostRecentString : '',
                  ),
              ],
            );
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
