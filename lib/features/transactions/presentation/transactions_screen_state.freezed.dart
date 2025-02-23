// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionsScreenState {
  String get searchText => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;

  /// Create a copy of TransactionsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionsScreenStateCopyWith<TransactionsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsScreenStateCopyWith<$Res> {
  factory $TransactionsScreenStateCopyWith(TransactionsScreenState value,
          $Res Function(TransactionsScreenState) then) =
      _$TransactionsScreenStateCopyWithImpl<$Res, TransactionsScreenState>;
  @useResult
  $Res call({String searchText, String? userName});
}

/// @nodoc
class _$TransactionsScreenStateCopyWithImpl<$Res,
        $Val extends TransactionsScreenState>
    implements $TransactionsScreenStateCopyWith<$Res> {
  _$TransactionsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionsScreenStateImplCopyWith<$Res>
    implements $TransactionsScreenStateCopyWith<$Res> {
  factory _$$TransactionsScreenStateImplCopyWith(
          _$TransactionsScreenStateImpl value,
          $Res Function(_$TransactionsScreenStateImpl) then) =
      __$$TransactionsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchText, String? userName});
}

/// @nodoc
class __$$TransactionsScreenStateImplCopyWithImpl<$Res>
    extends _$TransactionsScreenStateCopyWithImpl<$Res,
        _$TransactionsScreenStateImpl>
    implements _$$TransactionsScreenStateImplCopyWith<$Res> {
  __$$TransactionsScreenStateImplCopyWithImpl(
      _$TransactionsScreenStateImpl _value,
      $Res Function(_$TransactionsScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? userName = freezed,
  }) {
    return _then(_$TransactionsScreenStateImpl(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TransactionsScreenStateImpl extends _TransactionsScreenState {
  const _$TransactionsScreenStateImpl(
      {this.searchText = '', this.userName = ''})
      : super._();

  @override
  @JsonKey()
  final String searchText;
  @override
  @JsonKey()
  final String? userName;

  @override
  String toString() {
    return 'TransactionsScreenState(searchText: $searchText, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsScreenStateImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText, userName);

  /// Create a copy of TransactionsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsScreenStateImplCopyWith<_$TransactionsScreenStateImpl>
      get copyWith => __$$TransactionsScreenStateImplCopyWithImpl<
          _$TransactionsScreenStateImpl>(this, _$identity);
}

abstract class _TransactionsScreenState extends TransactionsScreenState {
  const factory _TransactionsScreenState(
      {final String searchText,
      final String? userName}) = _$TransactionsScreenStateImpl;
  const _TransactionsScreenState._() : super._();

  @override
  String get searchText;
  @override
  String? get userName;

  /// Create a copy of TransactionsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsScreenStateImplCopyWith<_$TransactionsScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
