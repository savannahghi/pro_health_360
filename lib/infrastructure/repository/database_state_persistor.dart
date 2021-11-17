// // Flutter imports:
// import 'package:flutter/foundation.dart';

// // Package imports:
// import 'package:async_redux/async_redux.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:user_feed/user_feed.dart';

// // Project imports:
// import 'package:myafyahub/application/redux/states/app_state.dart';
// import 'package:myafyahub/application/redux/states/connectivity_state.dart';
// import 'package:myafyahub/application/redux/states/misc_state.dart';
// import 'package:myafyahub/application/redux/states/user_profile_state.dart';
// import 'package:myafyahub/infrastructure/repository/database_base.dart';
// import 'package:myafyahub/infrastructure/repository/database_mobile.dart';
// import 'package:myafyahub/infrastructure/repository/initialize_db.dart';

// /// [BeWellStateDatabase] is the middleware that interacts with the database on behalf
// /// of the application. From the apps perspective, it doesn't care which database
// /// its saving its state on. BeWellStateDatabase therefore offers different implementations
// /// for its method.
// class BeWellStateDatabase implements PersistorPrinterDecorator<AppState> {
//   BeWellStateDatabase({
//     Duration throttle = const Duration(seconds: 2),
//     Duration saveDuration = Duration.zero,
//     required this.dataBaseName,
//   })  : _throttle = throttle,
//         _saveDuration = saveDuration;

//   final String dataBaseName;

//   final Duration _saveDuration;
//   final Duration _throttle;

//   @override
//   Future<void> deleteState() async {
//     await BeWellDatabaseMobile<Database>(
//       initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
//     ).clearDatabase();
//   }

//   @override
//   Future<void> persistDifference({
//     AppState? lastPersistedState,
//     required AppState newState,
//   }) async {
//     await Future<dynamic>.delayed(saveDuration);

//     if (lastPersistedState == null ||
//         lastPersistedState.userProfileState != newState.userProfileState ||
//         lastPersistedState.connectivityState != newState.connectivityState ||
//         lastPersistedState.userFeedState != newState.userFeedState ||
//         lastPersistedState.miscState != newState.miscState) {
//       await persistState(
//         newState,
//         BeWellDatabaseMobile<Database>(
//           initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
//         ),
//       );
//     }
//   }

//   /// we first check whether the database is empty
//   ///
//   /// - if the database is empty, we return null
//   /// - else, we retrieve the state from the database
//   @override
//   Future<AppState> readState() async {
//     if (await BeWellDatabaseMobile<Database>(
//       initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
//     ).isDatabaseEmpty()) {
//       return AppState.initial();
//     } else {
//       return retrieveState(
//         BeWellDatabaseMobile<Database>(
//           initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
//         ),
//       );
//     }
//   }

//   @override
//   Future<void> saveInitialState(AppState state) async =>
//       persistDifference(newState: state);

//   @override
//   Duration get throttle => _throttle;

//   Duration get saveDuration => _saveDuration;

//   Future<void> init() async {
//     await BeWellDatabaseMobile<Database>(
//       initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
//     ).database;
//   }

//   /// saves app state to the database
//   @visibleForTesting
//   Future<void> persistState(
//     AppState newState,
//     BeWellDatabaseBase<dynamic> database,
//   ) async {
//     // save user state
//     await database.saveState(
//       data: newState.userProfileState!.toJson(),
//       table: Tables.userProfileState,
//     );

//     // save connectivity state
//     await database.saveState(
//       data: newState.connectivityState!.toJson(),
//       table: Tables.connectivityState,
//     );

//     // save user feed state
//     await database.saveState(
//       data: newState.userFeedState!.toJson(),
//       table: Tables.userFeedState,
//     );

//     // save misc state
//     await database.saveState(
//       data: newState.miscState!.toJson(),
//       table: Tables.miscState,
//     );
//   }

//   /// retrieves app state to the database
//   @visibleForTesting
//   Future<AppState> retrieveState(BeWellDatabaseBase<dynamic> database) async {
//     return AppState().copyWith(
//       // retrieve user state
//       userProfileState: UserProfileState.fromJson(
//         await database.retrieveState(Tables.userProfileState),
//       ),

//       // retrieve connectivity state
//       connectivityState: ConnectivityState.fromJson(
//         await database.retrieveState(Tables.connectivityState),
//       ),

//       // retrieve user feed state
//       userFeedState: FeedResponsePayload.fromJson(
//         await database.retrieveState(Tables.userFeedState),
//       ),

//       // retrieve misc state
//       miscState:
//           MiscState.fromJson(await database.retrieveState(Tables.miscState)),

//       wait: Wait(),
//     );
//   }
// }
