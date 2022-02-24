// Mocks generated by Mockito 5.0.15 from annotations
// in myafyahub/test/widgets_tests/shared/widgets/app_entry_point_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i11;

import 'package:dio/dio.dart' as _i20;
import 'package:logging/logging.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:stream_chat/src/client/channel.dart' as _i8;
import 'package:stream_chat/src/client/client.dart' as _i2;
import 'package:stream_chat/src/client/retry_policy.dart' as _i4;
import 'package:stream_chat/src/core/api/requests.dart' as _i17;
import 'package:stream_chat/src/core/api/responses.dart' as _i6;
import 'package:stream_chat/src/core/api/stream_chat_api.dart' as _i22;
import 'package:stream_chat/src/core/http/token.dart' as _i7;
import 'package:stream_chat/src/core/http/token_manager.dart' as _i15;
import 'package:stream_chat/src/core/models/attachment_file.dart' as _i19;
import 'package:stream_chat/src/core/models/channel_model.dart' as _i18;
import 'package:stream_chat/src/core/models/channel_state.dart' as _i9;
import 'package:stream_chat/src/core/models/event.dart' as _i12;
import 'package:stream_chat/src/core/models/filter.dart' as _i16;
import 'package:stream_chat/src/core/models/member.dart' as _i23;
import 'package:stream_chat/src/core/models/message.dart' as _i21;
import 'package:stream_chat/src/core/models/own_user.dart' as _i5;
import 'package:stream_chat/src/core/models/user.dart' as _i14;
import 'package:stream_chat/src/db/chat_persistence_client.dart' as _i10;
import 'package:stream_chat/src/ws/connection_status.dart' as _i13;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeClientState_0 extends _i1.Fake implements _i2.ClientState {}

class _FakeLevel_1 extends _i1.Fake implements _i3.Level {}

class _FakeLogger_2 extends _i1.Fake implements _i3.Logger {}

class _FakeRetryPolicy_3 extends _i1.Fake implements _i4.RetryPolicy {}

class _FakeOwnUser_4 extends _i1.Fake implements _i5.OwnUser {}

class _FakeQueryUsersResponse_5 extends _i1.Fake
    implements _i6.QueryUsersResponse {}

class _FakeSearchMessagesResponse_6 extends _i1.Fake
    implements _i6.SearchMessagesResponse {}

class _FakeSendFileResponse_7 extends _i1.Fake implements _i6.SendFileResponse {
}

class _FakeSendImageResponse_8 extends _i1.Fake
    implements _i6.SendImageResponse {}

class _FakeEmptyResponse_9 extends _i1.Fake implements _i6.EmptyResponse {}

class _FakeUpdateChannelResponse_10 extends _i1.Fake
    implements _i6.UpdateChannelResponse {}

class _FakePartialUpdateChannelResponse_11 extends _i1.Fake
    implements _i6.PartialUpdateChannelResponse {}

class _FakeListDevicesResponse_12 extends _i1.Fake
    implements _i6.ListDevicesResponse {}

class _FakeToken_13 extends _i1.Fake implements _i7.Token {}

class _FakeChannel_14 extends _i1.Fake implements _i8.Channel {}

class _FakeChannelState_15 extends _i1.Fake implements _i9.ChannelState {}

class _FakeQueryMembersResponse_16 extends _i1.Fake
    implements _i6.QueryMembersResponse {}

class _FakeAcceptInviteResponse_17 extends _i1.Fake
    implements _i6.AcceptInviteResponse {}

class _FakeRejectInviteResponse_18 extends _i1.Fake
    implements _i6.RejectInviteResponse {}

class _FakeAddMembersResponse_19 extends _i1.Fake
    implements _i6.AddMembersResponse {}

class _FakeRemoveMembersResponse_20 extends _i1.Fake
    implements _i6.RemoveMembersResponse {}

class _FakeInviteMembersResponse_21 extends _i1.Fake
    implements _i6.InviteMembersResponse {}

class _FakeSendActionResponse_22 extends _i1.Fake
    implements _i6.SendActionResponse {}

class _FakeUpdateUsersResponse_23 extends _i1.Fake
    implements _i6.UpdateUsersResponse {}

class _FakeSendReactionResponse_24 extends _i1.Fake
    implements _i6.SendReactionResponse {}

class _FakeSendMessageResponse_25 extends _i1.Fake
    implements _i6.SendMessageResponse {}

class _FakeQueryRepliesResponse_26 extends _i1.Fake
    implements _i6.QueryRepliesResponse {}

class _FakeQueryReactionsResponse_27 extends _i1.Fake
    implements _i6.QueryReactionsResponse {}

class _FakeUpdateMessageResponse_28 extends _i1.Fake
    implements _i6.UpdateMessageResponse {}

class _FakeGetMessageResponse_29 extends _i1.Fake
    implements _i6.GetMessageResponse {}

class _FakeGetMessagesByIdResponse_30 extends _i1.Fake
    implements _i6.GetMessagesByIdResponse {}

class _FakeTranslateMessageResponse_31 extends _i1.Fake
    implements _i6.TranslateMessageResponse {}

/// A class which mocks [StreamChatClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockStreamChatClient extends _i1.Mock implements _i2.StreamChatClient {
  MockStreamChatClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ClientState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeClientState_0()) as _i2.ClientState);
  @override
  set state(_i2.ClientState? _state) =>
      super.noSuchMethod(Invocation.setter(#state, _state),
          returnValueForMissingStub: null);
  @override
  _i3.Level get logLevel => (super.noSuchMethod(Invocation.getter(#logLevel),
      returnValue: _FakeLevel_1()) as _i3.Level);
  @override
  _i3.Logger get logger => (super.noSuchMethod(Invocation.getter(#logger),
      returnValue: _FakeLogger_2()) as _i3.Logger);
  @override
  _i2.LogHandlerFunction get logHandlerFunction =>
      (super.noSuchMethod(Invocation.getter(#logHandlerFunction),
          returnValue: (_i3.LogRecord record) {}) as _i2.LogHandlerFunction);
  @override
  set logHandlerFunction(_i2.LogHandlerFunction? _logHandlerFunction) => super
      .noSuchMethod(Invocation.setter(#logHandlerFunction, _logHandlerFunction),
          returnValueForMissingStub: null);
  @override
  set chatPersistenceClient(_i10.ChatPersistenceClient? value) =>
      super.noSuchMethod(Invocation.setter(#chatPersistenceClient, value),
          returnValueForMissingStub: null);
  @override
  bool get persistenceEnabled =>
      (super.noSuchMethod(Invocation.getter(#persistenceEnabled),
          returnValue: false) as bool);
  @override
  _i4.RetryPolicy get retryPolicy =>
      (super.noSuchMethod(Invocation.getter(#retryPolicy),
          returnValue: _FakeRetryPolicy_3()) as _i4.RetryPolicy);
  @override
  _i11.Stream<_i12.Event> get eventStream =>
      (super.noSuchMethod(Invocation.getter(#eventStream),
          returnValue: Stream<_i12.Event>.empty()) as _i11.Stream<_i12.Event>);
  @override
  _i13.ConnectionStatus get wsConnectionStatus => (super.noSuchMethod(
      Invocation.getter(#wsConnectionStatus),
      returnValue: _i13.ConnectionStatus.connected) as _i13.ConnectionStatus);
  @override
  _i11.Stream<_i13.ConnectionStatus> get wsConnectionStatusStream =>
      (super.noSuchMethod(Invocation.getter(#wsConnectionStatusStream),
              returnValue: Stream<_i13.ConnectionStatus>.empty())
          as _i11.Stream<_i13.ConnectionStatus>);
  @override
  _i3.Logger detachedLogger(String? name) =>
      (super.noSuchMethod(Invocation.method(#detachedLogger, [name]),
          returnValue: _FakeLogger_2()) as _i3.Logger);
  @override
  _i11.Future<_i5.OwnUser> connectUser(_i14.User? user, String? token,
          {bool? connectWebSocket = true}) =>
      (super.noSuchMethod(
              Invocation.method(#connectUser, [user, token],
                  {#connectWebSocket: connectWebSocket}),
              returnValue: Future<_i5.OwnUser>.value(_FakeOwnUser_4()))
          as _i11.Future<_i5.OwnUser>);
  @override
  _i11.Future<_i5.OwnUser> connectUserWithProvider(
          _i14.User? user, _i15.TokenProvider? tokenProvider,
          {bool? connectWebSocket = true}) =>
      (super.noSuchMethod(
              Invocation.method(#connectUserWithProvider, [user, tokenProvider],
                  {#connectWebSocket: connectWebSocket}),
              returnValue: Future<_i5.OwnUser>.value(_FakeOwnUser_4()))
          as _i11.Future<_i5.OwnUser>);
  @override
  _i11.Future<_i5.OwnUser> connectAnonymousUser(
          {bool? connectWebSocket = true}) =>
      (super.noSuchMethod(
              Invocation.method(#connectAnonymousUser, [],
                  {#connectWebSocket: connectWebSocket}),
              returnValue: Future<_i5.OwnUser>.value(_FakeOwnUser_4()))
          as _i11.Future<_i5.OwnUser>);
  @override
  _i11.Future<_i5.OwnUser> connectGuestUser(_i14.User? user,
          {bool? connectWebSocket = true}) =>
      (super.noSuchMethod(
              Invocation.method(#connectGuestUser, [user],
                  {#connectWebSocket: connectWebSocket}),
              returnValue: Future<_i5.OwnUser>.value(_FakeOwnUser_4()))
          as _i11.Future<_i5.OwnUser>);
  @override
  _i11.Future<_i5.OwnUser> openConnection() =>
      (super.noSuchMethod(Invocation.method(#openConnection, []),
              returnValue: Future<_i5.OwnUser>.value(_FakeOwnUser_4()))
          as _i11.Future<_i5.OwnUser>);
  @override
  void closeConnection() =>
      super.noSuchMethod(Invocation.method(#closeConnection, []),
          returnValueForMissingStub: null);
  @override
  void handleEvent(_i12.Event? event) =>
      super.noSuchMethod(Invocation.method(#handleEvent, [event]),
          returnValueForMissingStub: null);
  @override
  _i11.Stream<_i12.Event> on(
          [String? eventType,
          String? eventType2,
          String? eventType3,
          String? eventType4]) =>
      (super.noSuchMethod(
          Invocation.method(
              #on, [eventType, eventType2, eventType3, eventType4]),
          returnValue: Stream<_i12.Event>.empty()) as _i11.Stream<_i12.Event>);
  @override
  _i11.Future<void> sync({List<String>? cids, DateTime? lastSyncAt}) =>
      (super.noSuchMethod(
          Invocation.method(#sync, [], {#cids: cids, #lastSyncAt: lastSyncAt}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub:
              Future<void>.value()) as _i11.Future<void>);
  @override
  _i11.Stream<List<_i8.Channel>> queryChannels(
          {_i16.Filter? filter,
          List<_i17.SortOption<_i18.ChannelModel>>? sort,
          bool? state = true,
          bool? watch = true,
          bool? presence = false,
          int? memberLimit,
          int? messageLimit,
          _i17.PaginationParams? paginationParams =
              const _i17.PaginationParams(),
          bool? waitForConnect = true}) =>
      (super.noSuchMethod(
              Invocation.method(#queryChannels, [], {
                #filter: filter,
                #sort: sort,
                #state: state,
                #watch: watch,
                #presence: presence,
                #memberLimit: memberLimit,
                #messageLimit: messageLimit,
                #paginationParams: paginationParams,
                #waitForConnect: waitForConnect
              }),
              returnValue: Stream<List<_i8.Channel>>.empty())
          as _i11.Stream<List<_i8.Channel>>);
  @override
  _i11.Future<List<_i8.Channel>> queryChannelsOnline(
          {_i16.Filter? filter,
          List<_i17.SortOption<_i18.ChannelModel>>? sort,
          bool? state = true,
          bool? watch = true,
          bool? presence = false,
          int? memberLimit,
          int? messageLimit,
          bool? waitForConnect = true,
          _i17.PaginationParams? paginationParams =
              const _i17.PaginationParams()}) =>
      (super.noSuchMethod(
              Invocation.method(#queryChannelsOnline, [], {
                #filter: filter,
                #sort: sort,
                #state: state,
                #watch: watch,
                #presence: presence,
                #memberLimit: memberLimit,
                #messageLimit: messageLimit,
                #waitForConnect: waitForConnect,
                #paginationParams: paginationParams
              }),
              returnValue: Future<List<_i8.Channel>>.value(<_i8.Channel>[]))
          as _i11.Future<List<_i8.Channel>>);
  @override
  _i11.Future<List<_i8.Channel>> queryChannelsOffline(
          {_i16.Filter? filter,
          List<_i17.SortOption<_i18.ChannelModel>>? sort,
          _i17.PaginationParams? paginationParams =
              const _i17.PaginationParams()}) =>
      (super.noSuchMethod(
              Invocation.method(#queryChannelsOffline, [], {
                #filter: filter,
                #sort: sort,
                #paginationParams: paginationParams
              }),
              returnValue: Future<List<_i8.Channel>>.value(<_i8.Channel>[]))
          as _i11.Future<List<_i8.Channel>>);
  @override
  _i11.Future<_i6.QueryUsersResponse> queryUsers(
          {bool? presence,
          _i16.Filter? filter,
          List<_i17.SortOption<dynamic>>? sort,
          _i17.PaginationParams? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#queryUsers, [], {
                #presence: presence,
                #filter: filter,
                #sort: sort,
                #pagination: pagination
              }),
              returnValue: Future<_i6.QueryUsersResponse>.value(
                  _FakeQueryUsersResponse_5()))
          as _i11.Future<_i6.QueryUsersResponse>);
  @override
  _i11.Future<_i6.SearchMessagesResponse> search(_i16.Filter? filter,
          {String? query,
          List<_i17.SortOption<dynamic>>? sort,
          _i17.PaginationParams? paginationParams,
          _i16.Filter? messageFilters}) =>
      (super.noSuchMethod(
              Invocation.method(#search, [
                filter
              ], {
                #query: query,
                #sort: sort,
                #paginationParams: paginationParams,
                #messageFilters: messageFilters
              }),
              returnValue: Future<_i6.SearchMessagesResponse>.value(
                  _FakeSearchMessagesResponse_6()))
          as _i11.Future<_i6.SearchMessagesResponse>);
  @override
  _i11.Future<_i6.SendFileResponse> sendFile(
          _i19.AttachmentFile? file, String? channelId, String? channelType,
          {_i20.ProgressCallback? onSendProgress,
          _i20.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#sendFile, [file, channelId, channelType],
                  {#onSendProgress: onSendProgress, #cancelToken: cancelToken}),
              returnValue:
                  Future<_i6.SendFileResponse>.value(_FakeSendFileResponse_7()))
          as _i11.Future<_i6.SendFileResponse>);
  @override
  _i11.Future<_i6.SendImageResponse> sendImage(
          _i19.AttachmentFile? image, String? channelId, String? channelType,
          {_i20.ProgressCallback? onSendProgress,
          _i20.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#sendImage, [image, channelId, channelType],
                  {#onSendProgress: onSendProgress, #cancelToken: cancelToken}),
              returnValue: Future<_i6.SendImageResponse>.value(
                  _FakeSendImageResponse_8()))
          as _i11.Future<_i6.SendImageResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> deleteFile(
          String? url, String? channelId, String? channelType,
          {_i20.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#deleteFile, [url, channelId, channelType],
                  {#cancelToken: cancelToken}),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> deleteImage(
          String? url, String? channelId, String? channelType,
          {_i20.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#deleteImage, [url, channelId, channelType],
                  {#cancelToken: cancelToken}),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.UpdateChannelResponse> updateChannel(
          String? channelId, String? channelType, Map<String, Object?>? data,
          {_i21.Message? message}) =>
      (super.noSuchMethod(
              Invocation.method(#updateChannel, [channelId, channelType, data],
                  {#message: message}),
              returnValue: Future<_i6.UpdateChannelResponse>.value(
                  _FakeUpdateChannelResponse_10()))
          as _i11.Future<_i6.UpdateChannelResponse>);
  @override
  _i11.Future<_i6.PartialUpdateChannelResponse> updateChannelPartial(
          String? channelId, String? channelType,
          {Map<String, Object?>? set, List<String>? unset}) =>
      (super.noSuchMethod(
              Invocation.method(#updateChannelPartial, [channelId, channelType],
                  {#set: set, #unset: unset}),
              returnValue: Future<_i6.PartialUpdateChannelResponse>.value(
                  _FakePartialUpdateChannelResponse_11()))
          as _i11.Future<_i6.PartialUpdateChannelResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> addDevice(
          String? id, _i22.PushProvider? pushProvider) =>
      (super.noSuchMethod(Invocation.method(#addDevice, [id, pushProvider]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.ListDevicesResponse> getDevices() =>
      (super.noSuchMethod(Invocation.method(#getDevices, []),
              returnValue: Future<_i6.ListDevicesResponse>.value(
                  _FakeListDevicesResponse_12()))
          as _i11.Future<_i6.ListDevicesResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> removeDevice(String? id) =>
      (super.noSuchMethod(Invocation.method(#removeDevice, [id]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i7.Token devToken(String? userId) =>
      (super.noSuchMethod(Invocation.method(#devToken, [userId]),
          returnValue: _FakeToken_13()) as _i7.Token);
  @override
  _i8.Channel channel(String? type,
          {String? id, Map<String, Object?>? extraData}) =>
      (super.noSuchMethod(
          Invocation.method(#channel, [type], {#id: id, #extraData: extraData}),
          returnValue: _FakeChannel_14()) as _i8.Channel);
  @override
  _i11.Future<_i9.ChannelState> createChannel(String? channelType,
          {String? channelId, Map<String, Object?>? channelData}) =>
      (super.noSuchMethod(
              Invocation.method(#createChannel, [channelType],
                  {#channelId: channelId, #channelData: channelData}),
              returnValue:
                  Future<_i9.ChannelState>.value(_FakeChannelState_15()))
          as _i11.Future<_i9.ChannelState>);
  @override
  _i11.Future<_i9.ChannelState> watchChannel(String? channelType,
          {String? channelId, Map<String, Object?>? channelData}) =>
      (super.noSuchMethod(
              Invocation.method(#watchChannel, [channelType],
                  {#channelId: channelId, #channelData: channelData}),
              returnValue:
                  Future<_i9.ChannelState>.value(_FakeChannelState_15()))
          as _i11.Future<_i9.ChannelState>);
  @override
  _i11.Future<_i9.ChannelState> queryChannel(String? channelType,
          {bool? state = true,
          bool? watch = false,
          bool? presence = false,
          String? channelId,
          Map<String, Object?>? channelData,
          _i17.PaginationParams? messagesPagination,
          _i17.PaginationParams? membersPagination,
          _i17.PaginationParams? watchersPagination}) =>
      (super.noSuchMethod(
              Invocation.method(#queryChannel, [
                channelType
              ], {
                #state: state,
                #watch: watch,
                #presence: presence,
                #channelId: channelId,
                #channelData: channelData,
                #messagesPagination: messagesPagination,
                #membersPagination: membersPagination,
                #watchersPagination: watchersPagination
              }),
              returnValue:
                  Future<_i9.ChannelState>.value(_FakeChannelState_15()))
          as _i11.Future<_i9.ChannelState>);
  @override
  _i11.Future<_i6.QueryMembersResponse> queryMembers(String? channelType,
          {_i16.Filter? filter,
          String? channelId,
          List<_i23.Member>? members,
          List<_i17.SortOption<dynamic>>? sort,
          _i17.PaginationParams? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#queryMembers, [
                channelType
              ], {
                #filter: filter,
                #channelId: channelId,
                #members: members,
                #sort: sort,
                #pagination: pagination
              }),
              returnValue: Future<_i6.QueryMembersResponse>.value(
                  _FakeQueryMembersResponse_16()))
          as _i11.Future<_i6.QueryMembersResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> hideChannel(
          String? channelId, String? channelType,
          {bool? clearHistory = false}) =>
      (super.noSuchMethod(
              Invocation.method(#hideChannel, [channelId, channelType],
                  {#clearHistory: clearHistory}),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> showChannel(
          String? channelId, String? channelType) =>
      (super.noSuchMethod(
              Invocation.method(#showChannel, [channelId, channelType]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> deleteChannel(
          String? channelId, String? channelType) =>
      (super.noSuchMethod(
              Invocation.method(#deleteChannel, [channelId, channelType]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> truncateChannel(
          String? channelId, String? channelType) =>
      (super.noSuchMethod(
              Invocation.method(#truncateChannel, [channelId, channelType]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> muteChannel(String? channelCid,
          {Duration? expiration}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #muteChannel, [channelCid], {#expiration: expiration}),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> unmuteChannel(String? channelCid) =>
      (super.noSuchMethod(Invocation.method(#unmuteChannel, [channelCid]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.AcceptInviteResponse> acceptChannelInvite(
          String? channelId, String? channelType, {_i21.Message? message}) =>
      (super.noSuchMethod(
              Invocation.method(#acceptChannelInvite, [channelId, channelType],
                  {#message: message}),
              returnValue: Future<_i6.AcceptInviteResponse>.value(
                  _FakeAcceptInviteResponse_17()))
          as _i11.Future<_i6.AcceptInviteResponse>);
  @override
  _i11.Future<_i6.RejectInviteResponse> rejectChannelInvite(
          String? channelId, String? channelType, {_i21.Message? message}) =>
      (super.noSuchMethod(
              Invocation.method(#rejectChannelInvite, [channelId, channelType],
                  {#message: message}),
              returnValue: Future<_i6.RejectInviteResponse>.value(
                  _FakeRejectInviteResponse_18()))
          as _i11.Future<_i6.RejectInviteResponse>);
  @override
  _i11.Future<_i6.AddMembersResponse> addChannelMembers(
          String? channelId, String? channelType, List<String>? memberIds,
          {_i21.Message? message}) =>
      (super.noSuchMethod(
              Invocation.method(#addChannelMembers,
                  [channelId, channelType, memberIds], {#message: message}),
              returnValue: Future<_i6.AddMembersResponse>.value(
                  _FakeAddMembersResponse_19()))
          as _i11.Future<_i6.AddMembersResponse>);
  @override
  _i11.Future<_i6.RemoveMembersResponse> removeChannelMembers(
          String? channelId, String? channelType, List<String>? memberIds,
          {_i21.Message? message}) =>
      (super.noSuchMethod(
              Invocation.method(#removeChannelMembers,
                  [channelId, channelType, memberIds], {#message: message}),
              returnValue: Future<_i6.RemoveMembersResponse>.value(
                  _FakeRemoveMembersResponse_20()))
          as _i11.Future<_i6.RemoveMembersResponse>);
  @override
  _i11.Future<_i6.InviteMembersResponse> inviteChannelMembers(
          String? channelId, String? channelType, List<String>? memberIds,
          {_i21.Message? message}) =>
      (super.noSuchMethod(
              Invocation.method(#inviteChannelMembers,
                  [channelId, channelType, memberIds], {#message: message}),
              returnValue: Future<_i6.InviteMembersResponse>.value(
                  _FakeInviteMembersResponse_21()))
          as _i11.Future<_i6.InviteMembersResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> stopChannelWatching(
          String? channelId, String? channelType) =>
      (super.noSuchMethod(
              Invocation.method(#stopChannelWatching, [channelId, channelType]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.SendActionResponse> sendAction(
          String? channelId,
          String? channelType,
          String? messageId,
          Map<String, Object?>? formData) =>
      (super.noSuchMethod(
              Invocation.method(
                  #sendAction, [channelId, channelType, messageId, formData]),
              returnValue: Future<_i6.SendActionResponse>.value(
                  _FakeSendActionResponse_22()))
          as _i11.Future<_i6.SendActionResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> markChannelRead(
          String? channelId, String? channelType, {String? messageId}) =>
      (super.noSuchMethod(
              Invocation.method(#markChannelRead, [channelId, channelType],
                  {#messageId: messageId}),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.UpdateUsersResponse> updateUser(_i14.User? user) =>
      (super.noSuchMethod(Invocation.method(#updateUser, [user]),
              returnValue: Future<_i6.UpdateUsersResponse>.value(
                  _FakeUpdateUsersResponse_23()))
          as _i11.Future<_i6.UpdateUsersResponse>);
  @override
  _i11.Future<_i6.UpdateUsersResponse> updateUsers(List<_i14.User>? users) =>
      (super.noSuchMethod(Invocation.method(#updateUsers, [users]),
              returnValue: Future<_i6.UpdateUsersResponse>.value(
                  _FakeUpdateUsersResponse_23()))
          as _i11.Future<_i6.UpdateUsersResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> banUser(String? targetUserId,
          [Map<String, dynamic>? options = const {}]) =>
      (super.noSuchMethod(Invocation.method(#banUser, [targetUserId, options]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> unbanUser(String? targetUserId,
          [Map<String, dynamic>? options = const {}]) =>
      (super.noSuchMethod(
              Invocation.method(#unbanUser, [targetUserId, options]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> shadowBan(String? targetID,
          [Map<String, dynamic>? options = const {}]) =>
      (super.noSuchMethod(Invocation.method(#shadowBan, [targetID, options]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> removeShadowBan(String? targetID,
          [Map<String, dynamic>? options = const {}]) =>
      (super.noSuchMethod(
              Invocation.method(#removeShadowBan, [targetID, options]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> muteUser(String? userId) =>
      (super.noSuchMethod(Invocation.method(#muteUser, [userId]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> unmuteUser(String? userId) =>
      (super.noSuchMethod(Invocation.method(#unmuteUser, [userId]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> flagMessage(String? messageId) =>
      (super.noSuchMethod(Invocation.method(#flagMessage, [messageId]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> unflagMessage(String? messageId) =>
      (super.noSuchMethod(Invocation.method(#unflagMessage, [messageId]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> flagUser(String? userId) =>
      (super.noSuchMethod(Invocation.method(#flagUser, [userId]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> unflagUser(String? userId) =>
      (super.noSuchMethod(Invocation.method(#unflagUser, [userId]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> markAllRead() => (super.noSuchMethod(
          Invocation.method(#markAllRead, []),
          returnValue: Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
      as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> sendEvent(
          String? channelId, String? channelType, _i12.Event? event) =>
      (super.noSuchMethod(
              Invocation.method(#sendEvent, [channelId, channelType, event]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.SendReactionResponse> sendReaction(
          String? messageId, String? reactionType,
          {Map<String, Object?>? extraData = const {},
          bool? enforceUnique = false}) =>
      (super.noSuchMethod(
              Invocation.method(#sendReaction, [messageId, reactionType],
                  {#extraData: extraData, #enforceUnique: enforceUnique}),
              returnValue: Future<_i6.SendReactionResponse>.value(
                  _FakeSendReactionResponse_24()))
          as _i11.Future<_i6.SendReactionResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> deleteReaction(
          String? messageId, String? reactionType) =>
      (super.noSuchMethod(
              Invocation.method(#deleteReaction, [messageId, reactionType]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.SendMessageResponse> sendMessage(
          _i21.Message? message, String? channelId, String? channelType,
          {bool? skipPush = false}) =>
      (super.noSuchMethod(
              Invocation.method(#sendMessage, [message, channelId, channelType],
                  {#skipPush: skipPush}),
              returnValue: Future<_i6.SendMessageResponse>.value(
                  _FakeSendMessageResponse_25()))
          as _i11.Future<_i6.SendMessageResponse>);
  @override
  _i11.Future<_i6.QueryRepliesResponse> getReplies(String? parentId,
          {_i17.PaginationParams? options}) =>
      (super.noSuchMethod(
              Invocation.method(#getReplies, [parentId], {#options: options}),
              returnValue: Future<_i6.QueryRepliesResponse>.value(
                  _FakeQueryRepliesResponse_26()))
          as _i11.Future<_i6.QueryRepliesResponse>);
  @override
  _i11.Future<_i6.QueryReactionsResponse> getReactions(String? messageId,
          {_i17.PaginationParams? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getReactions, [messageId], {#pagination: pagination}),
              returnValue: Future<_i6.QueryReactionsResponse>.value(
                  _FakeQueryReactionsResponse_27()))
          as _i11.Future<_i6.QueryReactionsResponse>);
  @override
  _i11.Future<_i6.UpdateMessageResponse> updateMessage(_i21.Message? message) =>
      (super.noSuchMethod(Invocation.method(#updateMessage, [message]),
              returnValue: Future<_i6.UpdateMessageResponse>.value(
                  _FakeUpdateMessageResponse_28()))
          as _i11.Future<_i6.UpdateMessageResponse>);
  @override
  _i11.Future<_i6.UpdateMessageResponse> partialUpdateMessage(String? messageId,
          {Map<String, Object?>? set, List<String>? unset}) =>
      (super.noSuchMethod(
          Invocation.method(
              #partialUpdateMessage, [messageId], {#set: set, #unset: unset}),
          returnValue: Future<_i6.UpdateMessageResponse>.value(
              _FakeUpdateMessageResponse_28())) as _i11
          .Future<_i6.UpdateMessageResponse>);
  @override
  _i11.Future<_i6.EmptyResponse> deleteMessage(String? messageId) =>
      (super.noSuchMethod(Invocation.method(#deleteMessage, [messageId]),
              returnValue:
                  Future<_i6.EmptyResponse>.value(_FakeEmptyResponse_9()))
          as _i11.Future<_i6.EmptyResponse>);
  @override
  _i11.Future<_i6.GetMessageResponse> getMessage(String? messageId) =>
      (super.noSuchMethod(Invocation.method(#getMessage, [messageId]),
              returnValue: Future<_i6.GetMessageResponse>.value(
                  _FakeGetMessageResponse_29()))
          as _i11.Future<_i6.GetMessageResponse>);
  @override
  _i11.Future<_i6.GetMessagesByIdResponse> getMessagesById(
          String? channelId, String? channelType, List<String>? messageIDs) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getMessagesById, [channelId, channelType, messageIDs]),
              returnValue: Future<_i6.GetMessagesByIdResponse>.value(
                  _FakeGetMessagesByIdResponse_30()))
          as _i11.Future<_i6.GetMessagesByIdResponse>);
  @override
  _i11.Future<_i6.TranslateMessageResponse> translateMessage(
          String? messageId, String? language) =>
      (super.noSuchMethod(
              Invocation.method(#translateMessage, [messageId, language]),
              returnValue: Future<_i6.TranslateMessageResponse>.value(
                  _FakeTranslateMessageResponse_31()))
          as _i11.Future<_i6.TranslateMessageResponse>);
  @override
  _i11.Future<_i6.PartialUpdateChannelResponse> enableSlowdown(
          String? channelId, String? channelType, int? cooldown) =>
      (super.noSuchMethod(
              Invocation.method(
                  #enableSlowdown, [channelId, channelType, cooldown]),
              returnValue: Future<_i6.PartialUpdateChannelResponse>.value(
                  _FakePartialUpdateChannelResponse_11()))
          as _i11.Future<_i6.PartialUpdateChannelResponse>);
  @override
  _i11.Future<_i6.PartialUpdateChannelResponse> disableSlowdown(
          String? channelId, String? channelType) =>
      (super.noSuchMethod(
              Invocation.method(#disableSlowdown, [channelId, channelType]),
              returnValue: Future<_i6.PartialUpdateChannelResponse>.value(
                  _FakePartialUpdateChannelResponse_11()))
          as _i11.Future<_i6.PartialUpdateChannelResponse>);
  @override
  _i11.Future<_i6.UpdateMessageResponse> pinMessage(String? messageId,
          {Object? timeoutOrExpirationDate}) =>
      (super.noSuchMethod(
              Invocation.method(#pinMessage, [messageId],
                  {#timeoutOrExpirationDate: timeoutOrExpirationDate}),
              returnValue: Future<_i6.UpdateMessageResponse>.value(
                  _FakeUpdateMessageResponse_28()))
          as _i11.Future<_i6.UpdateMessageResponse>);
  @override
  _i11.Future<_i6.UpdateMessageResponse> unpinMessage(String? messageId) =>
      (super.noSuchMethod(Invocation.method(#unpinMessage, [messageId]),
              returnValue: Future<_i6.UpdateMessageResponse>.value(
                  _FakeUpdateMessageResponse_28()))
          as _i11.Future<_i6.UpdateMessageResponse>);
  @override
  _i11.Future<void> disconnectUser({bool? flushChatPersistence = false}) =>
      (super.noSuchMethod(
              Invocation.method(#disconnectUser, [],
                  {#flushChatPersistence: flushChatPersistence}),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as _i11.Future<void>);
  @override
  _i11.Future<void> dispose() => (super.noSuchMethod(
      Invocation.method(#dispose, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i11.Future<void>);
  @override
  String toString() => super.toString();
}
