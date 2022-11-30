// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadUserData,
    required TResult Function(File file) changeProfileImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadUserData,
    TResult? Function(File file)? changeProfileImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUserData,
    TResult Function(File file)? changeProfileImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUserData value) loadUserData,
    required TResult Function(ChangeProfileImage value) changeProfileImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUserData value)? loadUserData,
    TResult? Function(ChangeProfileImage value)? changeProfileImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUserData value)? loadUserData,
    TResult Function(ChangeProfileImage value)? changeProfileImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountEventCopyWith<$Res> {
  factory $AccountEventCopyWith(
          AccountEvent value, $Res Function(AccountEvent) then) =
      _$AccountEventCopyWithImpl<$Res, AccountEvent>;
}

/// @nodoc
class _$AccountEventCopyWithImpl<$Res, $Val extends AccountEvent>
    implements $AccountEventCopyWith<$Res> {
  _$AccountEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadUserDataCopyWith<$Res> {
  factory _$$LoadUserDataCopyWith(
          _$LoadUserData value, $Res Function(_$LoadUserData) then) =
      __$$LoadUserDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadUserDataCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$LoadUserData>
    implements _$$LoadUserDataCopyWith<$Res> {
  __$$LoadUserDataCopyWithImpl(
      _$LoadUserData _value, $Res Function(_$LoadUserData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadUserData implements LoadUserData {
  const _$LoadUserData();

  @override
  String toString() {
    return 'AccountEvent.loadUserData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadUserData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadUserData,
    required TResult Function(File file) changeProfileImage,
  }) {
    return loadUserData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadUserData,
    TResult? Function(File file)? changeProfileImage,
  }) {
    return loadUserData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUserData,
    TResult Function(File file)? changeProfileImage,
    required TResult orElse(),
  }) {
    if (loadUserData != null) {
      return loadUserData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUserData value) loadUserData,
    required TResult Function(ChangeProfileImage value) changeProfileImage,
  }) {
    return loadUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUserData value)? loadUserData,
    TResult? Function(ChangeProfileImage value)? changeProfileImage,
  }) {
    return loadUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUserData value)? loadUserData,
    TResult Function(ChangeProfileImage value)? changeProfileImage,
    required TResult orElse(),
  }) {
    if (loadUserData != null) {
      return loadUserData(this);
    }
    return orElse();
  }
}

abstract class LoadUserData implements AccountEvent {
  const factory LoadUserData() = _$LoadUserData;
}

/// @nodoc
abstract class _$$ChangeProfileImageCopyWith<$Res> {
  factory _$$ChangeProfileImageCopyWith(_$ChangeProfileImage value,
          $Res Function(_$ChangeProfileImage) then) =
      __$$ChangeProfileImageCopyWithImpl<$Res>;
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$$ChangeProfileImageCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$ChangeProfileImage>
    implements _$$ChangeProfileImageCopyWith<$Res> {
  __$$ChangeProfileImageCopyWithImpl(
      _$ChangeProfileImage _value, $Res Function(_$ChangeProfileImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$ChangeProfileImage(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$ChangeProfileImage implements ChangeProfileImage {
  const _$ChangeProfileImage({required this.file});

  @override
  final File file;

  @override
  String toString() {
    return 'AccountEvent.changeProfileImage(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeProfileImage &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeProfileImageCopyWith<_$ChangeProfileImage> get copyWith =>
      __$$ChangeProfileImageCopyWithImpl<_$ChangeProfileImage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadUserData,
    required TResult Function(File file) changeProfileImage,
  }) {
    return changeProfileImage(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadUserData,
    TResult? Function(File file)? changeProfileImage,
  }) {
    return changeProfileImage?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUserData,
    TResult Function(File file)? changeProfileImage,
    required TResult orElse(),
  }) {
    if (changeProfileImage != null) {
      return changeProfileImage(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUserData value) loadUserData,
    required TResult Function(ChangeProfileImage value) changeProfileImage,
  }) {
    return changeProfileImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUserData value)? loadUserData,
    TResult? Function(ChangeProfileImage value)? changeProfileImage,
  }) {
    return changeProfileImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUserData value)? loadUserData,
    TResult Function(ChangeProfileImage value)? changeProfileImage,
    required TResult orElse(),
  }) {
    if (changeProfileImage != null) {
      return changeProfileImage(this);
    }
    return orElse();
  }
}

abstract class ChangeProfileImage implements AccountEvent {
  const factory ChangeProfileImage({required final File file}) =
      _$ChangeProfileImage;

  File get file;
  @JsonKey(ignore: true)
  _$$ChangeProfileImageCopyWith<_$ChangeProfileImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  UserModel get userDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountStateCopyWith<AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res, AccountState>;
  @useResult
  $Res call({bool isLoading, bool hasError, UserModel userDetails});
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? userDetails = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountStateCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$$_AccountStateCopyWith(
          _$_AccountState value, $Res Function(_$_AccountState) then) =
      __$$_AccountStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool hasError, UserModel userDetails});
}

/// @nodoc
class __$$_AccountStateCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$_AccountState>
    implements _$$_AccountStateCopyWith<$Res> {
  __$$_AccountStateCopyWithImpl(
      _$_AccountState _value, $Res Function(_$_AccountState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? userDetails = null,
  }) {
    return _then(_$_AccountState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_AccountState implements _AccountState {
  const _$_AccountState(
      {required this.isLoading,
      required this.hasError,
      required this.userDetails});

  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final UserModel userDetails;

  @override
  String toString() {
    return 'AccountState(isLoading: $isLoading, hasError: $hasError, userDetails: $userDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, hasError, userDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountStateCopyWith<_$_AccountState> get copyWith =>
      __$$_AccountStateCopyWithImpl<_$_AccountState>(this, _$identity);
}

abstract class _AccountState implements AccountState {
  const factory _AccountState(
      {required final bool isLoading,
      required final bool hasError,
      required final UserModel userDetails}) = _$_AccountState;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  UserModel get userDetails;
  @override
  @JsonKey(ignore: true)
  _$$_AccountStateCopyWith<_$_AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}
