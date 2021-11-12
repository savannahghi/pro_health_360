import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class EditInformationPage extends StatelessWidget {
  ///[EditInformationPage] renders a form with inputs
  const EditInformationPage({
    required this.editInformationItem,
  });
  final EditInformationItem editInformationItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: editInfoTitle(editInformationItem.title),
        leadingWidget: SvgPicture.asset(
          closeIconSvg,
          color: AppColors.blueChillColor,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    editInformationItem.title,
                    style: TextThemes.boldSize16Text(
                      AppColors.secondaryColor,
                    ),
                  ),
                  verySmallVerticalSizedBox,
                  if (editInformationItem.description != null)
                    Text(
                      editInformationItem.description!,
                      style: TextThemes.normalSize14Text(
                        AppColors.greyTextColor,
                      ),
                    ),
                  smallVerticalSizedBox,
                  ...List<Widget>.generate(
                      editInformationItem.editInformationInputItem.length,
                      (int index) {
                    final EditInformationInputItem editInformationInputItem =
                        editInformationItem.editInformationInputItem
                            .elementAt(index);
                    if (editInformationInputItem.inputType ==
                        EditInformationInputType.Text) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (index > 0) smallVerticalSizedBox,
                          Text(
                            editInformationInputItem.fieldName,
                            style: TextThemes.boldSize14Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                          verySmallVerticalSizedBox,
                          CustomTextField(
                            borderColor: Colors.grey[200],
                            keyboardType: TextInputType.text,
                            controller:
                                editInformationInputItem.inputController,
                            hintText: editInformationInputItem.hintText,
                            autovalidateMode: AutovalidateMode.disabled,
                          ),

                          //Add spacing below last item to ensure it is visible with the bottom button
                          if (index ==
                              editInformationItem
                                      .editInformationInputItem.length -
                                  1)
                            const SizedBox(height: 65),
                        ],
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (index > 0) smallVerticalSizedBox,
                        Text(
                          editInformationInputItem.fieldName,
                          style: TextThemes.boldSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                        verySmallVerticalSizedBox,
                        //Todo : Extract to afyaMoja core
                        InputDecorator(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white24,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            focusColor: Theme.of(context).colorScheme.secondary,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: grey, fontSize: 16),
                              dropdownColor: white,
                              value: editInformationInputItem
                                  .dropDownOptionList!.first,
                              items: editInformationInputItem
                                  .dropDownOptionList!
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  key: ValueKey<String>(value),
                                  value: value,
                                  child: Text(
                                    titleCase(value),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {},
                              isDense: true,
                            ),
                          ),
                        ),

                        //Add spacing below last item to ensure it is visible with the bottom button
                        if (index ==
                            editInformationItem
                                    .editInformationInputItem.length -
                                1)
                          const SizedBox(height: 65),
                      ],
                    );
                  }),
                ],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: MyAfyaHubPrimaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  buttonColor: AppColors.secondaryColor,
                  borderColor: Colors.transparent,
                  text: saveString,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
