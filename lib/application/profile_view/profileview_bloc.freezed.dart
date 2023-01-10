// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profileview_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileviewEvent {
  String get userid => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userid) loadProfileData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userid)? loadProfileData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userid)? loadProfileData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfileData value) loadProfileData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfileData value)? loadProfileData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfileData value)? loadProfileData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileviewEventCopyWith<ProfileviewEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileviewEventCopyWith<$Res> {
  factory $ProfileviewEventCopyWith(
          ProfileviewEvent value, $Res Function(ProfileviewEvent) then) =
      _$ProfileviewEventCopyWithImpl<$Res, ProfileviewEvent>;
  @useResult
  $Res call({String userid});
}

/// @nodoc
class _$ProfileviewEventCopyWithImpl<$Res, $Val extends ProfileviewEvent>
    implements $ProfileviewEventCopyWith<$Res> {
  _$ProfileviewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userid = null,
  }) {
    return _then(_value.copyWith(
      userid: null == userid
          ? _value.userid
          : userid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadProfileDataCopyWith<$Res>
    implements $ProfileviewEventCopyWith<$Res> {
  factory _$$LoadProfileDataCopyWith(
          _$LoadProfileData value, $Res Function(_$LoadProfileData) then) =
      __$$LoadProfileDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userid});
}

/// @nodoc
class __$$LoadProfileDataCopyWithImpl<$Res>
    extends _$ProfileviewEventCopyWithImpl<$Res, _$LoadProfileData>
    implements _$$LoadProfileDataCopyWith<$Res> {
  __$$LoadProfileDataCopyWithImpl(
      _$LoadProfileData _value, $Res Function(_$LoadProfileData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userid = null,
  }) {
    return _then(_$LoadProfileData(
      userid: null == userid
          ? _value.userid
          : userid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadProfileData implements LoadProfileData {
  const _$LoadProfileData({required this.userid});

  @override
  final String userid;

  @override
  String toString() {
    return 'ProfileviewEvent.loadProfileData(userid: $userid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProfileData &&
            (identical(other.userid, userid) || other.userid == userid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProfileDataCopyWith<_$LoadProfileData> get copyWith =>
      __$$LoadProfileDataCopyWithImpl<_$LoadProfileData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userid) loadProfileData,
  }) {
    return loadProfileData(userid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userid)? loadProfileData,
  }) {
    return loadProfileData?.call(userid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userid)? loadProfileData,
    required TResult orElse(),
  }) {
    if (loadProfileData != null) {
      return loadProfileData(userid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfileData value) loadProfileData,
  }) {
    return loadProfileData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfileData value)? loadProfileData,
  }) {
    return loadProfileData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfileData value)? loadProfileData,
    required TResult orElse(),
  }) {
    if (loadProfileData != null) {
      return loadProfileData(this);
    }
    return orElse();
  }
}

abstract class LoadProfileData implements ProfileviewEvent {
  const factory LoadProfileData({required final String userid}) =
      _$LoadProfileData;

  @override
  String get userid;
  @override
  @JsonKey(ignore: true)
  _$$LoadProfileDataCopyWith<_$LoadProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileviewState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  UserModel get userDetails => throw _privateConstructorUsedError;
  List<PostModel> get userposts => throw _privateConstructorUsedError;
  List<PostModel> get splitposts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileviewStateCopyWith<ProfileviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileviewStateCopyWith<$Res> {
  factory $ProfileviewStateCopyWith(
          ProfileviewState value, $Res Function(ProfileviewState) then) =
      _$ProfileviewStateCopyWithImpl<$Res, ProfileviewState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      UserModel userDetails,
      List<PostModel> userposts,
      List<PostModel> splitposts});
}

/// @nodoc
class _$ProfileviewStateCopyWithImpl<$Res, $Val extends ProfileviewState>
    implements $ProfileviewStateCopyWith<$Res> {
  _$ProfileviewStateCopyWithImpl(this._value, this._then);

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
    Object? userposts = null,
    Object? splitposts = null,
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
      userposts: null == userposts
          ? _value.userposts
          : userposts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
      splitposts: null == splitposts
          ? _value.splitposts
          : splitposts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileviewStateCopyWith<$Res>
    implements $ProfileviewStateCopyWith<$Res> {
  factory _$$_ProfileviewStateCopyWith(
          _$_ProfileviewState value, $Res Function(_$_ProfileviewState) then) =
      __$$_ProfileviewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      UserModel userDetails,
      List<PostModel> userposts,
      List<PostModel> splitposts});
}

/// @nodoc
class __$$_ProfileviewStateCopyWithImpl<$Res>
    extends _$ProfileviewStateCopyWithImpl<$Res, _$_ProfileviewState>
    implements _$$_ProfileviewStateCopyWith<$Res> {
  __$$_ProfileviewStateCopyWithImpl(
      _$_ProfileviewState _value, $Res Function(_$_ProfileviewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? userDetails = null,
    Object? userposts = null,
    Object? splitposts = null,
  }) {
    return _then(_$_ProfileviewState(
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
      userposts: null == userposts
          ? _value._userposts
          : userposts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
      splitposts: null == splitposts
          ? _value._splitposts
          : splitposts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
    ));
  }
}

/// @nodoc

class _$_ProfileviewState implements _ProfileviewState {
  const _$_ProfileviewState(
      {required this.isLoading,
      required this.hasError,
      required this.userDetails,
      required final List<PostModel> userposts,
      required final List<PostModel> splitposts})
      : _userposts = userposts,
        _splitposts = splitposts;

  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final UserModel userDetails;
  final List<PostModel> _userposts;
  @override
  List<PostModel> get userposts {
    if (_userposts is EqualUnmodifiableListView) return _userposts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userposts);
  }

  final List<PostModel> _splitposts;
  @override
  List<PostModel> get splitposts {
    if (_splitposts is EqualUnmodifiableListView) return _splitposts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_splitposts);
  }

  @override
  String toString() {
    return 'ProfileviewState(isLoading: $isLoading, hasError: $hasError, userDetails: $userDetails, userposts: $userposts, splitposts: $splitposts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileviewState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            const DeepCollectionEquality()
                .equals(other._userposts, _userposts) &&
            const DeepCollectionEquality()
                .equals(other._splitposts, _splitposts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      userDetails,
      const DeepCollectionEquality().hash(_userposts),
      const DeepCollectionEquality().hash(_splitposts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileviewStateCopyWith<_$_ProfileviewState> get copyWith =>
      __$$_ProfileviewStateCopyWithImpl<_$_ProfileviewState>(this, _$identity);
}

abstract class _ProfileviewState implements ProfileviewState {
  const factory _ProfileviewState(
      {required final bool isLoading,
      required final bool hasError,
      required final UserModel userDetails,
      required final List<PostModel> userposts,
      required final List<PostModel> splitposts}) = _$_ProfileviewState;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  UserModel get userDetails;
  @override
  List<PostModel> get userposts;
  @override
  List<PostModel> get splitposts;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileviewStateCopyWith<_$_ProfileviewState> get copyWith =>
      throw _privateConstructorUsedError;
}
