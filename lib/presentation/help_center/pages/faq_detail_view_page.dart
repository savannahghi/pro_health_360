// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/help_center/widgets/html_wrapper.dart';

class FAQDetailViewPage extends StatelessWidget {
  const FAQDetailViewPage(
      {Key? key, required this.question, required this.answer})
      : super(key: key);

  final String answer;
  final String question;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              question,
              style: TextThemes.boldSize16Text(Colors.black54),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12)),
              child: HtmlWrapper(text: answer),
            ),
          ),
        ],
      ),
    );
  }
}
