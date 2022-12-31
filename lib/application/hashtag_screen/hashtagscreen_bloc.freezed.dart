// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hashtagscreen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HashtagscreenEvent {
  String get hashtag => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String hashtag) loadHashtagPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String hashtag)? loadHashtagPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String hashtag)? loadHashtagPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadHashtagPosts value) loadHashtagPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadHashtagPosts value)? loadHashtagPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadHashtagPosts value)? loadHashtagPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HashtagscreenEventCopyWith<HashtagscreenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HashtagscreenEventCopyWith<$Res> {
  factory $HashtagscreenEventCopyWith(
          HashtagscreenEvent value, $Res Function(HashtagscreenEvent) then) =
      _$HashtagscreenEventCopyWithImpl<$Res, HashtagscreenEvent>;
  @useResult
  $Res call({String hashtag});
}

/// @nodoc
class _$HashtagscreenEventCopyWithImpl<$Res, $Val extends HashtagscreenEvent>
    implements $HashtagscreenEventCopyWith<$Res> {
  _$HashtagscreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hashtag = null,
  }) {
    return _then(_value.copyWith(
      hashtag: null == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadHashtagPostsCopyWith<$Res>
    implements $HashtagscreenEventCopyWith<$Res> {
  factory _$$LoadHashtagPostsCopyWith(
          _$LoadHashtagPosts value, $Res Function(_$LoadHashtagPosts) then) =
      __$$LoadHashtagPostsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hashtag});
}

/// @nodoc
class __$$LoadHashtagPostsCopyWithImpl<$Res>
    extends _$HashtagscreenEventCopyWithImpl<$Res, _$LoadHashtagPosts>
    implements _$$LoadHashtagPostsCopyWith<$Res> {
  __$$LoadHashtagPostsCopyWithImpl(
      _$LoadHashtagPosts _value, $Res Function(_$LoadHashtagPosts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hashtag = null,
  }) {
    return _then(_$LoadHashtagPosts(
      null == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadHashtagPosts implements LoadHashtagPosts {
  const _$LoadHashtagPosts(this.hashtag);

  @override
  final String hashtag;

  @override
  String toString() {
    return 'HashtagscreenEvent.loadHashtagPosts(hashtag: $hashtag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadHashtagPosts &&
            (identical(other.hashtag, hashtag) || other.hashtag == hashtag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hashtag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadHashtagPostsCopyWith<_$LoadHashtagPosts> get copyWith =>
      __$$LoadHashtagPostsCopyWithImpl<_$LoadHashtagPosts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String hashtag) loadHashtagPosts,
  }) {
    return loadHashtagPosts(hashtag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String hashtag)? loadHashtagPosts,
  }) {
    return loadHashtagPosts?.call(hashtag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String hashtag)? loadHashtagPosts,
    required TResult orElse(),
  }) {
    if (loadHashtagPosts != null) {
      return loadHashtagPosts(hashtag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadHashtagPosts value) loadHashtagPosts,
  }) {
    return loadHashtagPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadHashtagPosts value)? loadHashtagPosts,
  }) {
    return loadHashtagPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadHashtagPosts value)? loadHashtagPosts,
    required TResult orElse(),
  }) {
    if (loadHashtagPosts != null) {
      return loadHashtagPosts(this);
    }
    return orElse();
  }
}

abstract class LoadHashtagPosts implements HashtagscreenEvent {
  const factory LoadHashtagPosts(final String hashtag) = _$LoadHashtagPosts;

  @override
  String get hashtag;
  @override
  @JsonKey(ignore: true)
  _$$LoadHashtagPostsCopyWith<_$LoadHashtagPosts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HashtagscreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  PostsPageModel get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HashtagscreenStateCopyWith<HashtagscreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HashtagscreenStateCopyWith<$Res> {
  factory $HashtagscreenStateCopyWith(
          HashtagscreenState value, $Res Function(HashtagscreenState) then) =
      _$HashtagscreenStateCopyWithImpl<$Res, HashtagscreenState>;
  @useResult
  $Res call({bool isLoading, bool hasError, PostsPageModel posts});
}

/// @nodoc
class _$HashtagscreenStateCopyWithImpl<$Res, $Val extends HashtagscreenState>
    implements $HashtagscreenStateCopyWith<$Res> {
  _$HashtagscreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? posts = null,
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
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as PostsPageModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HashtagscreenStateCopyWith<$Res>
    implements $HashtagscreenStateCopyWith<$Res> {
  factory _$$_HashtagscreenStateCopyWith(_$_HashtagscreenState value,
          $Res Function(_$_HashtagscreenState) then) =
      __$$_HashtagscreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool hasError, PostsPageModel posts});
}

/// @nodoc
class __$$_HashtagscreenStateCopyWithImpl<$Res>
    extends _$HashtagscreenStateCopyWithImpl<$Res, _$_HashtagscreenState>
    implements _$$_HashtagscreenStateCopyWith<$Res> {
  __$$_HashtagscreenStateCopyWithImpl(
      _$_HashtagscreenState _value, $Res Function(_$_HashtagscreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? posts = null,
  }) {
    return _then(_$_HashtagscreenState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as PostsPageModel,
    ));
  }
}

/// @nodoc

class _$_HashtagscreenState implements _HashtagscreenState {
  const _$_HashtagscreenState(
      {required this.isLoading, required this.hasError, required this.posts});

  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final PostsPageModel posts;

  @override
  String toString() {
    return 'HashtagscreenState(isLoading: $isLoading, hasError: $hasError, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HashtagscreenState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.posts, posts) || other.posts == posts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, hasError, posts);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HashtagscreenStateCopyWith<_$_HashtagscreenState> get copyWith =>
      __$$_HashtagscreenStateCopyWithImpl<_$_HashtagscreenState>(
          this, _$identity);
}

abstract class _HashtagscreenState implements HashtagscreenState {
  const factory _HashtagscreenState(
      {required final bool isLoading,
      required final bool hasError,
      required final PostsPageModel posts}) = _$_HashtagscreenState;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  PostsPageModel get posts;
  @override
  @JsonKey(ignore: true)
  _$$_HashtagscreenStateCopyWith<_$_HashtagscreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
