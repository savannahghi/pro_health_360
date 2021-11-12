import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

class EditInformationItem {
  EditInformationItem({
    required this.title,
    this.description,
    required this.editInformationInputItem,
  });

  final String title;
  final String? description;
  final List<EditInformationInputItem> editInformationInputItem;
}

class EditInformationInputItem {
  EditInformationInputItem({
    required this.fieldName,
    required this.hintText,
    required this.inputType,
    required this.inputController,
    this.dropDownOptionList,
  }) // Asserts that the dropDown cannot be null if it is a dropdown
  : assert(inputType == EditInformationInputType.DropDown
            ? dropDownOptionList != null && dropDownOptionList.isNotEmpty
            : dropDownOptionList == null);

  final String fieldName;
  final String hintText;
  final EditInformationInputType inputType;
  final TextEditingController inputController;
  final List<String>? dropDownOptionList;
}
