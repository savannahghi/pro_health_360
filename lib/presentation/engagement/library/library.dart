// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:misc_utilities/misc.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/library_list_items_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/generic_empty_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/engagement/library/pages/library_page_content.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  late StreamController<Object> _libraryStreamController;
  late Stream<Object> _stream;

  @override
  void initState() {
    _libraryStreamController = StreamController<Object>.broadcast();
    _stream = _libraryStreamController.stream;

    // set the stream initial data. This will stop the retry widget from flashing before the content is loaded
    _libraryStreamController.add(<String, dynamic>{'loading': true});
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await fetchData();
    });
    MyAfyaHubFacebookEvents().logger.logEvent(name: 'view_library_page');
    super.initState();
  }

  Future<void> fetchData() async {
    await genericFetchFunction(
      streamController: _libraryStreamController,
      context: context,
      logTitle: 'Fetch library',
      queryString: getLibraryQuery,
      variables: <String, dynamic>{},
    );
  }

  bool hasLibraryItems(List<dynamic>? items) {
    if (items == null) return false;
    return items.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        final List<dynamic>? libraryListItems =
            vm.appState.miscState!.libraryListItems;

        return Scaffold(
          key: homepageContentKey,
          appBar:
              const CustomAppBar(title: libraryString, showBackButton: false),
          backgroundColor: Theme.of(context).backgroundColor,
          body: !hasLibraryItems(libraryListItems)
              ? StreamBuilder<Object>(
                  key: libraryStreamBuilderKey,
                  stream: _stream,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    //show the loader before the data is displayed
                    if (snapshot.data is Map<String, dynamic> &&
                        snapshot.data != null &&
                        snapshot.data['loading'] != null &&
                        snapshot.data['loading'] == true) {
                      return SILLoaderWithText();
                    }

                    // error checking
                    if (snapshot.hasError) {
                      reportErrorToSentry(context, snapshot.error);
                      final dynamic valueHolder = snapshot.error;
                      final Map<String, dynamic>? error = snapshot.error == null
                          ? null
                          : valueHolder as Map<String, dynamic>;

                      /// check if the error is a timeout error and return an appropriate widget
                      if (error == null || error['error'] == 'timeout') {
                        return GenericTimeoutWidget(
                          key: libraryErrorWidgetKey,
                          action: fetchingYourLibraryText,
                          recoverActionText: 'Retry',
                          recoverCallback: () async {
                            await fetchData();
                          },
                        );
                      }

                      return GenericNoData(
                        type: GenericNoDataTypes.ErrorInData,
                        actionText: 'Retry',
                        recoverCallback: () async {
                          await fetchData();
                        },
                        messageBody: libraryNoDataCopy,
                      );
                    }

                    if (snapshot.hasData) {
                      if (snapshot.data != null) {
                        // after everything checks out, we can now start processing the data
                        final dynamic content =
                            snapshot.data['getLibraryContent'];
                        final List<dynamic> libContent = content == null
                            ? <dynamic>[]
                            : content as List<dynamic>;
                        // Save the lib list of articles to state
                        StoreProvider.dispatch<AppState>(
                          context,
                          LibraryListItemsAction(libraryListItems: libContent),
                        );

                        if (libContent.isEmpty) {
                          return const GenericEmptyData(
                            item: 'library',
                            customMessage: emptyLibraryCopy,
                          );
                        }

                        return LibraryPageContent(libContent: libContent);
                      }
                    }
                    return Center(
                      heightFactor: 1.4,
                      child: GenericNoData(
                        key: libraryNullWidgetKey,
                        type: GenericNoDataTypes.ErrorInData,
                        actionText: 'Retry',
                        recoverCallback: () async {
                          await fetchData();
                        },
                        messageBody: libraryNoDataCopy,
                      ),
                    );
                  },
                )
              : LibraryPageContent(libContent: libraryListItems!),
        );
      },
    );
  }
}
