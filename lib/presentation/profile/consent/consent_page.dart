// Flutter imports:
// Package imports:
import 'package:afya_moja_core/information_list_card.dart';
import 'package:afya_moja_core/text_themes.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:unicons/unicons.dart';

class ConsentPage extends StatefulWidget {
  const ConsentPage({Key? key, this.onChanged}) : super(key: key);

  final void Function(bool)? onChanged;

  @override
  State<ConsentPage> createState() => _ConsentPageState();
}

class _ConsentPageState extends State<ConsentPage> {
  bool groupsSwitchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: consentText,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                key: termsAndConditionsKey,
                onTap: () => Navigator.of(context)
                    .pushNamed(BWRoutes.termsAndConditions),
                child: InformationListCard(
                  leadingIcon: const Icon(
                    UniconsLine.file_lock_alt,
                    size: 32,
                    color: AppColors.secondaryColor,
                  ),
                  title: Text(
                    portalTermsText,
                    style: normalSize16Text(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  body: Text(
                    viewTermsText,
                    style: normalSize14Text(
                      Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              InformationListCard(
                leadingIcon: const Icon(
                  UniconsLine.file_lock_alt,
                  size: 32,
                  color: AppColors.secondaryColor,
                ),
                title: Text(
                  groupsText,
                  style: normalSize16Text(
                    Theme.of(context).primaryColor,
                  ),
                ),
                body: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 8,
                      child: Text(
                        consentConfirmationText,
                        style: normalSize14Text(Colors.grey),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Switch(
                        activeColor: AppColors.primaryColor,
                        value: groupsSwitchValue,
                        onChanged: (bool value) {
                          setState(() {
                            widget.onChanged?.call(value);
                            groupsSwitchValue = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
