// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuoteRelay _$QuoteRelayFromJson(Map<String, dynamic> json) {
  return _QuoteRelay.fromJson(json);
}

/// @nodoc
class _$QuoteRelayTearOff {
  const _$QuoteRelayTearOff();

  _QuoteRelay call({@JsonKey(name: 'getHealthDiaryQuote') Quote? quote}) {
    return _QuoteRelay(
      quote: quote,
    );
  }

  QuoteRelay fromJson(Map<String, Object> json) {
    return QuoteRelay.fromJson(json);
  }
}

/// @nodoc
const $QuoteRelay = _$QuoteRelayTearOff();

/// @nodoc
mixin _$QuoteRelay {
  @JsonKey(name: 'getHealthDiaryQuote')
  Quote? get quote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteRelayCopyWith<QuoteRelay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteRelayCopyWith<$Res> {
  factory $QuoteRelayCopyWith(
          QuoteRelay value, $Res Function(QuoteRelay) then) =
      _$QuoteRelayCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'getHealthDiaryQuote') Quote? quote});

  $QuoteCopyWith<$Res>? get quote;
}

/// @nodoc
class _$QuoteRelayCopyWithImpl<$Res> implements $QuoteRelayCopyWith<$Res> {
  _$QuoteRelayCopyWithImpl(this._value, this._then);

  final QuoteRelay _value;
  // ignore: unused_field
  final $Res Function(QuoteRelay) _then;

  @override
  $Res call({
    Object? quote = freezed,
  }) {
    return _then(_value.copyWith(
      quote: quote == freezed
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as Quote?,
    ));
  }

  @override
  $QuoteCopyWith<$Res>? get quote {
    if (_value.quote == null) {
      return null;
    }

    return $QuoteCopyWith<$Res>(_value.quote!, (value) {
      return _then(_value.copyWith(quote: value));
    });
  }
}

/// @nodoc
abstract class _$QuoteRelayCopyWith<$Res> implements $QuoteRelayCopyWith<$Res> {
  factory _$QuoteRelayCopyWith(
          _QuoteRelay value, $Res Function(_QuoteRelay) then) =
      __$QuoteRelayCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'getHealthDiaryQuote') Quote? quote});

  @override
  $QuoteCopyWith<$Res>? get quote;
}

/// @nodoc
class __$QuoteRelayCopyWithImpl<$Res> extends _$QuoteRelayCopyWithImpl<$Res>
    implements _$QuoteRelayCopyWith<$Res> {
  __$QuoteRelayCopyWithImpl(
      _QuoteRelay _value, $Res Function(_QuoteRelay) _then)
      : super(_value, (v) => _then(v as _QuoteRelay));

  @override
  _QuoteRelay get _value => super._value as _QuoteRelay;

  @override
  $Res call({
    Object? quote = freezed,
  }) {
    return _then(_QuoteRelay(
      quote: quote == freezed
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as Quote?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuoteRelay implements _QuoteRelay {
  _$_QuoteRelay({@JsonKey(name: 'getHealthDiaryQuote') this.quote});

  factory _$_QuoteRelay.fromJson(Map<String, dynamic> json) =>
      _$_$_QuoteRelayFromJson(json);

  @override
  @JsonKey(name: 'getHealthDiaryQuote')
  final Quote? quote;

  @override
  String toString() {
    return 'QuoteRelay(quote: $quote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuoteRelay &&
            (identical(other.quote, quote) ||
                const DeepCollectionEquality().equals(other.quote, quote)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(quote);

  @JsonKey(ignore: true)
  @override
  _$QuoteRelayCopyWith<_QuoteRelay> get copyWith =>
      __$QuoteRelayCopyWithImpl<_QuoteRelay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuoteRelayToJson(this);
  }
}

abstract class _QuoteRelay implements QuoteRelay {
  factory _QuoteRelay({@JsonKey(name: 'getHealthDiaryQuote') Quote? quote}) =
      _$_QuoteRelay;

  factory _QuoteRelay.fromJson(Map<String, dynamic> json) =
      _$_QuoteRelay.fromJson;

  @override
  @JsonKey(name: 'getHealthDiaryQuote')
  Quote? get quote => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuoteRelayCopyWith<_QuoteRelay> get copyWith =>
      throw _privateConstructorUsedError;
}

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return _Quote.fromJson(json);
}

/// @nodoc
class _$QuoteTearOff {
  const _$QuoteTearOff();

  _Quote call(
      {@JsonKey(name: 'author') String? author,
      @JsonKey(name: 'quote') String? quote}) {
    return _Quote(
      author: author,
      quote: quote,
    );
  }

  Quote fromJson(Map<String, Object> json) {
    return Quote.fromJson(json);
  }
}

/// @nodoc
const $Quote = _$QuoteTearOff();

/// @nodoc
mixin _$Quote {
  @JsonKey(name: 'author')
  String? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'quote')
  String? get quote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteCopyWith<Quote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteCopyWith<$Res> {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) then) =
      _$QuoteCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'author') String? author,
      @JsonKey(name: 'quote') String? quote});
}

/// @nodoc
class _$QuoteCopyWithImpl<$Res> implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._value, this._then);

  final Quote _value;
  // ignore: unused_field
  final $Res Function(Quote) _then;

  @override
  $Res call({
    Object? author = freezed,
    Object? quote = freezed,
  }) {
    return _then(_value.copyWith(
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      quote: quote == freezed
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$QuoteCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$QuoteCopyWith(_Quote value, $Res Function(_Quote) then) =
      __$QuoteCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'author') String? author,
      @JsonKey(name: 'quote') String? quote});
}

/// @nodoc
class __$QuoteCopyWithImpl<$Res> extends _$QuoteCopyWithImpl<$Res>
    implements _$QuoteCopyWith<$Res> {
  __$QuoteCopyWithImpl(_Quote _value, $Res Function(_Quote) _then)
      : super(_value, (v) => _then(v as _Quote));

  @override
  _Quote get _value => super._value as _Quote;

  @override
  $Res call({
    Object? author = freezed,
    Object? quote = freezed,
  }) {
    return _then(_Quote(
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      quote: quote == freezed
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quote implements _Quote {
  _$_Quote(
      {@JsonKey(name: 'author') this.author,
      @JsonKey(name: 'quote') this.quote});

  factory _$_Quote.fromJson(Map<String, dynamic> json) =>
      _$_$_QuoteFromJson(json);

  @override
  @JsonKey(name: 'author')
  final String? author;
  @override
  @JsonKey(name: 'quote')
  final String? quote;

  @override
  String toString() {
    return 'Quote(author: $author, quote: $quote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Quote &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.quote, quote) ||
                const DeepCollectionEquality().equals(other.quote, quote)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(quote);

  @JsonKey(ignore: true)
  @override
  _$QuoteCopyWith<_Quote> get copyWith =>
      __$QuoteCopyWithImpl<_Quote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuoteToJson(this);
  }
}

abstract class _Quote implements Quote {
  factory _Quote(
      {@JsonKey(name: 'author') String? author,
      @JsonKey(name: 'quote') String? quote}) = _$_Quote;

  factory _Quote.fromJson(Map<String, dynamic> json) = _$_Quote.fromJson;

  @override
  @JsonKey(name: 'author')
  String? get author => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'quote')
  String? get quote => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuoteCopyWith<_Quote> get copyWith => throw _privateConstructorUsedError;
}
