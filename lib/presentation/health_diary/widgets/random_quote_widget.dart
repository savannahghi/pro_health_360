// Flutter imports:
import 'dart:async';

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/health_diary/quote.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:shared_ui_components/platform_loader.dart';

class RandomQuoteWidget extends StatefulWidget {
  const RandomQuoteWidget({Key? key}) : super(key: key);

  @override
  State<RandomQuoteWidget> createState() => _RandomQuoteWidgetState();
}

class _RandomQuoteWidgetState extends State<RandomQuoteWidget> {
  late Stream<Object> _stream;
  late StreamController<Object> _streamController;

  @override
  void initState() {
    _streamController = StreamController<Object>.broadcast();
    _stream = _streamController.stream;
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await genericFetchFunction(
        streamController: _streamController,
        context: context,
        logTitle: 'Fetch suggested groups',
        queryString: getHealthDiaryQuoteQuery,
        variables: <String, dynamic>{},
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: _stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //show the loader before the data is displayed
        if (snapshot.data is Map<String, dynamic> &&
            snapshot.data != null &&
            snapshot.data['loading'] != null &&
            snapshot.data['loading'] == true) {
          return Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            child: const SILPlatformLoader(),
          );
        }

        //error checking
        if (snapshot.hasError) {
          reportErrorToSentry(
            context,
            snapshot.error,
            hint: 'Timeout fetching recent content',
          );
          final dynamic valueHolder = snapshot.error;
          final Map<String, dynamic>? error = snapshot.error == null
              ? null
              : valueHolder as Map<String, dynamic>;

          /// check if the error is a timeout error and return an appropriate widget
          if (error == null || error['error'] == 'timeout') {
            return const GenericTimeoutWidget(
              route: BWRoutes.home,
              action: 'fetching recent content',
            );
          }

          return GenericNoData(
            key: helpNoDataWidgetKey,
            type: GenericNoDataTypes.ErrorInData,
            actionText: actionTextGenericNoData,
            recoverCallback: () async {
              await genericFetchFunction(
                streamController: _streamController,
                context: context,
                logTitle: 'Fetch suggested groups',
                queryString: getHealthDiaryQuoteQuery,
                variables: <String, dynamic>{},
              );
            },
            messageBody: messageBodyGenericNoData,
          );
        }

        if (snapshot.hasData) {
          final QuoteRelay quoteRelay =
              QuoteRelay.fromJson(snapshot.data as Map<String, dynamic>);

          if (quoteRelay.quote != null) {
            final Quote? quote = quoteRelay.quote;

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.srcOver,
                  ),
                  fit: BoxFit.cover,
                  image: const AssetImage(moodSelectionBackgroundUrl),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              margin: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SvgPicture.asset(leftQuoteSVGUrl, height: 32),
                  smallVerticalSizedBox,
                  Text(
                    quote?.quote ?? '',
                    style: TextThemes.boldSize18Text(Colors.white),
                  ),
                  smallVerticalSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        quote?.author ?? defaultQuoteAuthor,
                        style:
                            TextThemes.normalSize14Text(AppColors.greyTextColor)
                                .copyWith(fontStyle: FontStyle.italic),
                      ),
                      SvgPicture.asset(rightQuoteSVGUrl, height: 32),
                    ],
                  ),
                ],
              ),
            );
          }
        }

        return const SizedBox();
      },
    );
  }
}