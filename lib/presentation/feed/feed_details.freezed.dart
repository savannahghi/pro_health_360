// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'feed_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedDetails _$FeedDetailsFromJson(Map<String, dynamic> json) {
  return _FeedDetails.fromJson(json);
}

/// @nodoc
class _$FeedDetailsTearOff {
  const _$FeedDetailsTearOff();

  _FeedDetails call(
      {@JsonKey(name: 'coverImageUrl') required String coverImageUrl,
      @JsonKey(name: 'header') required String header,
      @JsonKey(name: 'date') required String date,
      @JsonKey(name: 'readTime') String? readTime,
      @JsonKey(name: 'isNew') bool? isNew}) {
    return _FeedDetails(
      coverImageUrl: coverImageUrl,
      header: header,
      date: date,
      readTime: readTime,
      isNew: isNew,
    );
  }

  FeedDetails fromJson(Map<String, Object> json) {
    return FeedDetails.fromJson(json);
  }
}

/// @nodoc
const $FeedDetails = _$FeedDetailsTearOff();

/// @nodoc
mixin _$FeedDetails {
  @JsonKey(name: 'coverImageUrl')
  String get coverImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'header')
  String get header => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'readTime')
  String? get readTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'isNew')
  bool? get isNew => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedDetailsCopyWith<FeedDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedDetailsCopyWith<$Res> {
  factory $FeedDetailsCopyWith(
          FeedDetails value, $Res Function(FeedDetails) then) =
      _$FeedDetailsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'coverImageUrl') String coverImageUrl,
      @JsonKey(name: 'header') String header,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'readTime') String? readTime,
      @JsonKey(name: 'isNew') bool? isNew});
}

/// @nodoc
class _$FeedDetailsCopyWithImpl<$Res> implements $FeedDetailsCopyWith<$Res> {
  _$FeedDetailsCopyWithImpl(this._value, this._then);

  final FeedDetails _value;
  // ignore: unused_field
  final $Res Function(FeedDetails) _then;

  @override
  $Res call({
    Object? coverImageUrl = freezed,
    Object? header = freezed,
    Object? date = freezed,
    Object? readTime = freezed,
    Object? isNew = freezed,
  }) {
    return _then(_value.copyWith(
      coverImageUrl: coverImageUrl == freezed
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      header: header == freezed
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      readTime: readTime == freezed
          ? _value.readTime
          : readTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isNew: isNew == freezed
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$FeedDetailsCopyWith<$Res>
    implements $FeedDetailsCopyWith<$Res> {
  factory _$FeedDetailsCopyWith(
          _FeedDetails value, $Res Function(_FeedDetails) then) =
      __$FeedDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'coverImageUrl') String coverImageUrl,
      @JsonKey(name: 'header') String header,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'readTime') String? readTime,
      @JsonKey(name: 'isNew') bool? isNew});
}

/// @nodoc
class __$FeedDetailsCopyWithImpl<$Res> extends _$FeedDetailsCopyWithImpl<$Res>
    implements _$FeedDetailsCopyWith<$Res> {
  __$FeedDetailsCopyWithImpl(
      _FeedDetails _value, $Res Function(_FeedDetails) _then)
      : super(_value, (v) => _then(v as _FeedDetails));

  @override
  _FeedDetails get _value => super._value as _FeedDetails;

  @override
  $Res call({
    Object? coverImageUrl = freezed,
    Object? header = freezed,
    Object? date = freezed,
    Object? readTime = freezed,
    Object? isNew = freezed,
  }) {
    return _then(_FeedDetails(
      coverImageUrl: coverImageUrl == freezed
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      header: header == freezed
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      readTime: readTime == freezed
          ? _value.readTime
          : readTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isNew: isNew == freezed
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeedDetails implements _FeedDetails {
  _$_FeedDetails(
      {@JsonKey(name: 'coverImageUrl') required this.coverImageUrl,
      @JsonKey(name: 'header') required this.header,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'readTime') this.readTime,
      @JsonKey(name: 'isNew') this.isNew});

  factory _$_FeedDetails.fromJson(Map<String, dynamic> json) =>
      _$_$_FeedDetailsFromJson(json);

  @override
  @JsonKey(name: 'coverImageUrl')
  final String coverImageUrl;
  @override
  @JsonKey(name: 'header')
  final String header;
  @override
  @JsonKey(name: 'date')
  final String date;
  @override
  @JsonKey(name: 'readTime')
  final String? readTime;
  @override
  @JsonKey(name: 'isNew')
  final bool? isNew;

  @override
  String toString() {
    return 'FeedDetails(coverImageUrl: $coverImageUrl, header: $header, date: $date, readTime: $readTime, isNew: $isNew)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FeedDetails &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.coverImageUrl, coverImageUrl)) &&
            (identical(other.header, header) ||
                const DeepCollectionEquality().equals(other.header, header)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.readTime, readTime) ||
                const DeepCollectionEquality()
                    .equals(other.readTime, readTime)) &&
            (identical(other.isNew, isNew) ||
                const DeepCollectionEquality().equals(other.isNew, isNew)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(coverImageUrl) ^
      const DeepCollectionEquality().hash(header) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(readTime) ^
      const DeepCollectionEquality().hash(isNew);

  @JsonKey(ignore: true)
  @override
  _$FeedDetailsCopyWith<_FeedDetails> get copyWith =>
      __$FeedDetailsCopyWithImpl<_FeedDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeedDetailsToJson(this);
  }
}

abstract class _FeedDetails implements FeedDetails {
  factory _FeedDetails(
      {@JsonKey(name: 'coverImageUrl') required String coverImageUrl,
      @JsonKey(name: 'header') required String header,
      @JsonKey(name: 'date') required String date,
      @JsonKey(name: 'readTime') String? readTime,
      @JsonKey(name: 'isNew') bool? isNew}) = _$_FeedDetails;

  factory _FeedDetails.fromJson(Map<String, dynamic> json) =
      _$_FeedDetails.fromJson;

  @override
  @JsonKey(name: 'coverImageUrl')
  String get coverImageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'header')
  String get header => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'readTime')
  String? get readTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'isNew')
  bool? get isNew => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FeedDetailsCopyWith<_FeedDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
