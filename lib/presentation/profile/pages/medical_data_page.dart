// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/widgets/medical_data_item.dart';
import 'package:myafyahub/presentation/profile/widgets/medical_data_item_title.dart';

class MedicalDataPage extends StatelessWidget {
  const MedicalDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: medicalDataPageTitle),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: const <Widget>[
              // Regimen
              MedicalDataItemTitle(title: 'Regimen'),
              MedicalDataItem(data: 'First line'),
              SizedBox(height: 4),
              MedicalDataItem(data: 'Regimen'),

              SizedBox(height: 24),

              MedicalDataItemTitle(title: 'TPT status'),
              MedicalDataItem(data: 'No info', description: 'Required'),

              SizedBox(height: 24),

              MedicalDataItemTitle(title: 'Allergies'),
              MedicalDataItem(data: 'Protein', description: 'Most recent'),
              SizedBox(height: 4),
              MedicalDataItem(data: 'Peanut'),
              SizedBox(height: 4),
              MedicalDataItem(data: 'Pollen'),

              SizedBox(height: 24),

              MedicalDataItemTitle(title: 'Weight (Previous 3)'),
              MedicalDataItem(data: '66.5 kg', description: 'Most recent'),
              SizedBox(height: 4),
              MedicalDataItem(data: '66.7 kg'),
              SizedBox(height: 4),
              MedicalDataItem(data: '66.4'),

              SizedBox(height: 24),

              MedicalDataItemTitle(title: 'BMI (Previous 3)'),
              MedicalDataItem(data: '22', description: 'Most recent'),
              SizedBox(height: 4),
              MedicalDataItem(data: '25'),
              SizedBox(height: 4),
              MedicalDataItem(data: '21'),

              SizedBox(height: 24),

              MedicalDataItemTitle(title: 'Viral load (Previous 3)'),
              MedicalDataItem(data: '600/ml', description: 'Most recent'),
              SizedBox(height: 4),
              MedicalDataItem(data: '700'),
              SizedBox(height: 4),
              MedicalDataItem(data: '500'),

              SizedBox(height: 24),

              MedicalDataItemTitle(title: 'CD4 (Previous 3)'),
              MedicalDataItem(data: '25%', description: 'Most recent'),
              SizedBox(height: 4),
              MedicalDataItem(data: '30%'),
              SizedBox(height: 4),
              MedicalDataItem(data: '25%'),
            ],
          ),
        ),
      ),
    );
  }
}
