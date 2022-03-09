// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/health_diary/quote.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

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
    super.initState();

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
            child: const PlatformLoader(),
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
              route: AppRoutes.home,
              action: 'fetching recent content',
            );
          }

          return GenericErrorWidget(
            actionKey: helpNoDataWidgetKey,
            recoverCallback: () async {
              await genericFetchFunction(
                streamController: _streamController,
                context: context,
                logTitle: 'Fetch suggested groups',
                queryString: getHealthDiaryQuoteQuery,
                variables: <String, dynamic>{},
              );
            },
            messageBody: const <TextSpan>[
              TextSpan(text: messageBodyGenericErrorWidget)
            ],
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
                    '${toBeginningOfSentenceCase(quote?.quote?.toLowerCase())}',
                    style: boldSize18Text(Colors.white),
                  ),
                  smallVerticalSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        quote?.author ?? defaultQuoteAuthor,
                        style: normalSize14Text(AppColors.greyTextColor)
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
