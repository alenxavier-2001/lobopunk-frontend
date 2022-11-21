// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'addpost_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddpostEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFile value) getFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetFile value)? getFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFile value)? getFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddpostEventCopyWith<$Res> {
  factory $AddpostEventCopyWith(
          AddpostEvent value, $Res Function(AddpostEvent) then) =
      _$AddpostEventCopyWithImpl<$Res, AddpostEvent>;
}

/// @nodoc
class _$AddpostEventCopyWithImpl<$Res, $Val extends AddpostEvent>
    implements $AddpostEventCopyWith<$Res> {
  _$AddpostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetFileCopyWith<$Res> {
  factory _$$GetFileCopyWith(_$GetFile value, $Res Function(_$GetFile) then) =
      __$$GetFileCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetFileCopyWithImpl<$Res>
    extends _$AddpostEventCopyWithImpl<$Res, _$GetFile>
    implements _$$GetFileCopyWith<$Res> {
  __$$GetFileCopyWithImpl(_$GetFile _value, $Res Function(_$GetFile) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetFile implements GetFile {
  const _$GetFile();

  @override
  String toString() {
    return 'AddpostEvent.getFile()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetFile);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFile,
  }) {
    return getFile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getFile,
  }) {
    return getFile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFile,
    required TResult orElse(),
  }) {
    if (getFile != null) {
      return getFile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFile value) getFile,
  }) {
    return getFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetFile value)? getFile,
  }) {
    return getFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFile value)? getFile,
    required TResult orElse(),
  }) {
    if (getFile != null) {
      return getFile(this);
    }
    return orElse();
  }
}

abstract class GetFile implements AddpostEvent {
  const factory GetFile() = _$GetFile;
}

/// @nodoc
mixin _$AddpostState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  File get videofile => throw _privateConstructorUsedError;
  List<String> get hashtags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddpostStateCopyWith<AddpostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddpostStateCopyWith<$Res> {
  factory $AddpostStateCopyWith(
          AddpostState value, $Res Function(AddpostState) then) =
      _$AddpostStateCopyWithImpl<$Res, AddpostState>;
  @useResult
  $Res call(
      {bool isLoading, bool hasError, File videofile, List<String> hashtags});
}

/// @nodoc
class _$AddpostStateCopyWithImpl<$Res, $Val extends AddpostState>
    implements $AddpostStateCopyWith<$Res> {
  _$AddpostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? videofile = null,
    Object? hashtags = null,
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
      videofile: null == videofile
          ? _value.videofile
          : videofile // ignore: cast_nullable_to_non_nullable
              as File,
      hashtags: null == hashtags
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddpostStateCopyWith<$Res>
    implements $AddpostStateCopyWith<$Res> {
  factory _$$_AddpostStateCopyWith(
          _$_AddpostState value, $Res Function(_$_AddpostState) then) =
      __$$_AddpostStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, bool hasError, File videofile, List<String> hashtags});
}

/// @nodoc
class __$$_AddpostStateCopyWithImpl<$Res>
    extends _$AddpostStateCopyWithImpl<$Res, _$_AddpostState>
    implements _$$_AddpostStateCopyWith<$Res> {
  __$$_AddpostStateCopyWithImpl(
      _$_AddpostState _value, $Res Function(_$_AddpostState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? videofile = null,
    Object? hashtags = null,
  }) {
    return _then(_$_AddpostState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      videofile: null == videofile
          ? _value.videofile
          : videofile // ignore: cast_nullable_to_non_nullable
              as File,
      hashtags: null == hashtags
          ? _value._hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_AddpostState implements _AddpostState {
  const _$_AddpostState(
      {required this.isLoading,
      required this.hasError,
      required this.videofile,
      required final List<String> hashtags})
      : _hashtags = hashtags;

  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final File videofile;
  final List<String> _hashtags;
  @override
  List<String> get hashtags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashtags);
  }

  @override
  String toString() {
    return 'AddpostState(isLoading: $isLoading, hasError: $hasError, videofile: $videofile, hashtags: $hashtags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddpostState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.videofile, videofile) ||
                other.videofile == videofile) &&
            const DeepCollectionEquality().equals(other._hashtags, _hashtags));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, hasError, videofile,
      const DeepCollectionEquality().hash(_hashtags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddpostStateCopyWith<_$_AddpostState> get copyWith =>
      __$$_AddpostStateCopyWithImpl<_$_AddpostState>(this, _$identity);
}

abstract class _AddpostState implements AddpostState {
  const factory _AddpostState(
      {required final bool isLoading,
      required final bool hasError,
      required final File videofile,
      required final List<String> hashtags}) = _$_AddpostState;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  File get videofile;
  @override
  List<String> get hashtags;
  @override
  @JsonKey(ignore: true)
  _$$_AddpostStateCopyWith<_$_AddpostState> get copyWith =>
      throw _privateConstructorUsedError;
}
