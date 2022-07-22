// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  @JsonKey(name: 'addressType')
  AddressType? get addressType => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'postalCode')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'county')
  String? get county => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'addressType') AddressType? addressType,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'postalCode') String? postalCode,
      @JsonKey(name: 'county') String? county,
      @JsonKey(name: 'active', defaultValue: false) bool? active});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  final Address _value;
  // ignore: unused_field
  final $Res Function(Address) _then;

  @override
  $Res call({
    Object? addressType = freezed,
    Object? text = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? county = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      addressType: addressType == freezed
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as AddressType?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      county: county == freezed
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$_AddressCopyWith(
          _$_Address value, $Res Function(_$_Address) then) =
      __$$_AddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'addressType') AddressType? addressType,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'postalCode') String? postalCode,
      @JsonKey(name: 'county') String? county,
      @JsonKey(name: 'active', defaultValue: false) bool? active});
}

/// @nodoc
class __$$_AddressCopyWithImpl<$Res> extends _$AddressCopyWithImpl<$Res>
    implements _$$_AddressCopyWith<$Res> {
  __$$_AddressCopyWithImpl(_$_Address _value, $Res Function(_$_Address) _then)
      : super(_value, (v) => _then(v as _$_Address));

  @override
  _$_Address get _value => super._value as _$_Address;

  @override
  $Res call({
    Object? addressType = freezed,
    Object? text = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? county = freezed,
    Object? active = freezed,
  }) {
    return _then(_$_Address(
      addressType: addressType == freezed
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as AddressType?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      county: county == freezed
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Address implements _Address {
  _$_Address(
      {@JsonKey(name: 'addressType') this.addressType,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'country') this.country,
      @JsonKey(name: 'postalCode') this.postalCode,
      @JsonKey(name: 'county') this.county,
      @JsonKey(name: 'active', defaultValue: false) this.active});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$$_AddressFromJson(json);

  @override
  @JsonKey(name: 'addressType')
  final AddressType? addressType;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'country')
  final String? country;
  @override
  @JsonKey(name: 'postalCode')
  final String? postalCode;
  @override
  @JsonKey(name: 'county')
  final String? county;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;

  @override
  String toString() {
    return 'Address(addressType: $addressType, text: $text, country: $country, postalCode: $postalCode, county: $county, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Address &&
            const DeepCollectionEquality()
                .equals(other.addressType, addressType) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality()
                .equals(other.postalCode, postalCode) &&
            const DeepCollectionEquality().equals(other.county, county) &&
            const DeepCollectionEquality().equals(other.active, active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(addressType),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(postalCode),
      const DeepCollectionEquality().hash(county),
      const DeepCollectionEquality().hash(active));

  @JsonKey(ignore: true)
  @override
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      __$$_AddressCopyWithImpl<_$_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressToJson(this);
  }
}

abstract class _Address implements Address {
  factory _Address(
          {@JsonKey(name: 'addressType') final AddressType? addressType,
          @JsonKey(name: 'text') final String? text,
          @JsonKey(name: 'country') final String? country,
          @JsonKey(name: 'postalCode') final String? postalCode,
          @JsonKey(name: 'county') final String? county,
          @JsonKey(name: 'active', defaultValue: false) final bool? active}) =
      _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  @JsonKey(name: 'addressType')
  AddressType? get addressType;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'country')
  String? get country;
  @override
  @JsonKey(name: 'postalCode')
  String? get postalCode;
  @override
  @JsonKey(name: 'county')
  String? get county;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(ignore: true)
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      throw _privateConstructorUsedError;
}
