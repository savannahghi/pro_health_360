// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
// Project imports:
import 'package:pro_health_360/application/redux/actions/fetch_health_diary_quote_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/content/health_diary_view_model.dart';
import 'package:pro_health_360/domain/core/entities/health_diary/quote.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/carousel_slider.dart';

class RandomQuoteWidget extends StatefulWidget {
  const RandomQuoteWidget({Key? key}) : super(key: key);

  @override
  State<RandomQuoteWidget> createState() => _RandomQuoteWidgetState();
}

class _RandomQuoteWidgetState extends State<RandomQuoteWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final List<Quote>? quotes = StoreProvider.state<AppState>(context)
          ?.clientState
          ?.healthDiaryState
          ?.quoteState
          ?.quotes;

      if (quotes?.isEmpty ?? true) {
        StoreProvider.dispatch(
          context,
          FetchHealthDiaryQuoteAction(
            client: AppWrapperBase.of(context)!.graphQLClient,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HealthDiaryViewModel>(
      converter: (Store<AppState> store) =>
          HealthDiaryViewModel.fromStore(store.state),
      builder: (BuildContext context, HealthDiaryViewModel vm) {
        final List<Quote> quotes = vm.quotes;
        if (vm.wait?.isWaitingFor(fetchHealthDiaryQuoteFlag) ?? false) {
          return const PlatformLoader();
        } else if (quotes.isNotEmpty) {
          return CarouselSlider(
            children: quotes.map((Quote quote) {
              return Builder(
                builder: (BuildContext context) {
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 15,
                    ),
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SvgPicture.asset(leftQuoteSVGUrl, height: 32),
                        smallVerticalSizedBox,
                        Text(
                          '${toBeginningOfSentenceCase(quote.quote?.toLowerCase())}',
                          style: boldSize18Text(Colors.white),
                        ),
                        smallVerticalSizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              quote.author ?? defaultQuoteAuthor,
                              style: normalSize14Text(AppColors.greyTextColor)
                                  .copyWith(fontStyle: FontStyle.italic),
                            ),
                            SvgPicture.asset(rightQuoteSVGUrl, height: 32),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          );
        }
        return const SizedBox();
      },
    );
  }
}
