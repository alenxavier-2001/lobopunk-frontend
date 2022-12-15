// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postid) loadComments,
    required TResult Function(Map<String, dynamic> data) addComment,
    required TResult Function(String commentid, int index) likeComment,
    required TResult Function(String commentid, int index) dislikeComment,
    required TResult Function(String commentid, int index, int subindex)
        likeSubComment,
    required TResult Function(String commentid, int index, int subindex)
        dislikeSubComment,
    required TResult Function(Map<String, dynamic> data, int index)
        addSubComment,
    required TResult Function(String commentid, int index, int subindex)
        deleteSubComment,
    required TResult Function(String commentid, int index) deleteComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postid)? loadComments,
    TResult? Function(Map<String, dynamic> data)? addComment,
    TResult? Function(String commentid, int index)? likeComment,
    TResult? Function(String commentid, int index)? dislikeComment,
    TResult? Function(String commentid, int index, int subindex)?
        likeSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult? Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult? Function(String commentid, int index)? deleteComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postid)? loadComments,
    TResult Function(Map<String, dynamic> data)? addComment,
    TResult Function(String commentid, int index)? likeComment,
    TResult Function(String commentid, int index)? dislikeComment,
    TResult Function(String commentid, int index, int subindex)? likeSubComment,
    TResult Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult Function(String commentid, int index)? deleteComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(AddComment value) addComment,
    required TResult Function(LikeComment value) likeComment,
    required TResult Function(DislikeComment value) dislikeComment,
    required TResult Function(LikeSubComment value) likeSubComment,
    required TResult Function(DislikeSubComment value) dislikeSubComment,
    required TResult Function(AddSubComment value) addSubComment,
    required TResult Function(DeleteSubComment value) deleteSubComment,
    required TResult Function(DeleteComment value) deleteComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(LikeComment value)? likeComment,
    TResult? Function(DislikeComment value)? dislikeComment,
    TResult? Function(LikeSubComment value)? likeSubComment,
    TResult? Function(DislikeSubComment value)? dislikeSubComment,
    TResult? Function(AddSubComment value)? addSubComment,
    TResult? Function(DeleteSubComment value)? deleteSubComment,
    TResult? Function(DeleteComment value)? deleteComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(AddComment value)? addComment,
    TResult Function(LikeComment value)? likeComment,
    TResult Function(DislikeComment value)? dislikeComment,
    TResult Function(LikeSubComment value)? likeSubComment,
    TResult Function(DislikeSubComment value)? dislikeSubComment,
    TResult Function(AddSubComment value)? addSubComment,
    TResult Function(DeleteSubComment value)? deleteSubComment,
    TResult Function(DeleteComment value)? deleteComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentEventCopyWith<$Res> {
  factory $CommentEventCopyWith(
          CommentEvent value, $Res Function(CommentEvent) then) =
      _$CommentEventCopyWithImpl<$Res, CommentEvent>;
}

/// @nodoc
class _$CommentEventCopyWithImpl<$Res, $Val extends CommentEvent>
    implements $CommentEventCopyWith<$Res> {
  _$CommentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadCommentsCopyWith<$Res> {
  factory _$$LoadCommentsCopyWith(
          _$LoadComments value, $Res Function(_$LoadComments) then) =
      __$$LoadCommentsCopyWithImpl<$Res>;
  @useResult
  $Res call({String postid});
}

/// @nodoc
class __$$LoadCommentsCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res, _$LoadComments>
    implements _$$LoadCommentsCopyWith<$Res> {
  __$$LoadCommentsCopyWithImpl(
      _$LoadComments _value, $Res Function(_$LoadComments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postid = null,
  }) {
    return _then(_$LoadComments(
      postid: null == postid
          ? _value.postid
          : postid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadComments implements LoadComments {
  const _$LoadComments({required this.postid});

  @override
  final String postid;

  @override
  String toString() {
    return 'CommentEvent.loadComments(postid: $postid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadComments &&
            (identical(other.postid, postid) || other.postid == postid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadCommentsCopyWith<_$LoadComments> get copyWith =>
      __$$LoadCommentsCopyWithImpl<_$LoadComments>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postid) loadComments,
    required TResult Function(Map<String, dynamic> data) addComment,
    required TResult Function(String commentid, int index) likeComment,
    required TResult Function(String commentid, int index) dislikeComment,
    required TResult Function(String commentid, int index, int subindex)
        likeSubComment,
    required TResult Function(String commentid, int index, int subindex)
        dislikeSubComment,
    required TResult Function(Map<String, dynamic> data, int index)
        addSubComment,
    required TResult Function(String commentid, int index, int subindex)
        deleteSubComment,
    required TResult Function(String commentid, int index) deleteComment,
  }) {
    return loadComments(postid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postid)? loadComments,
    TResult? Function(Map<String, dynamic> data)? addComment,
    TResult? Function(String commentid, int index)? likeComment,
    TResult? Function(String commentid, int index)? dislikeComment,
    TResult? Function(String commentid, int index, int subindex)?
        likeSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult? Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult? Function(String commentid, int index)? deleteComment,
  }) {
    return loadComments?.call(postid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postid)? loadComments,
    TResult Function(Map<String, dynamic> data)? addComment,
    TResult Function(String commentid, int index)? likeComment,
    TResult Function(String commentid, int index)? dislikeComment,
    TResult Function(String commentid, int index, int subindex)? likeSubComment,
    TResult Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult Function(String commentid, int index)? deleteComment,
    required TResult orElse(),
  }) {
    if (loadComments != null) {
      return loadComments(postid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(AddComment value) addComment,
    required TResult Function(LikeComment value) likeComment,
    required TResult Function(DislikeComment value) dislikeComment,
    required TResult Function(LikeSubComment value) likeSubComment,
    required TResult Function(DislikeSubComment value) dislikeSubComment,
    required TResult Function(AddSubComment value) addSubComment,
    required TResult Function(DeleteSubComment value) deleteSubComment,
    required TResult Function(DeleteComment value) deleteComment,
  }) {
    return loadComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(LikeComment value)? likeComment,
    TResult? Function(DislikeComment value)? dislikeComment,
    TResult? Function(LikeSubComment value)? likeSubComment,
    TResult? Function(DislikeSubComment value)? dislikeSubComment,
    TResult? Function(AddSubComment value)? addSubComment,
    TResult? Function(DeleteSubComment value)? deleteSubComment,
    TResult? Function(DeleteComment value)? deleteComment,
  }) {
    return loadComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(AddComment value)? addComment,
    TResult Function(LikeComment value)? likeComment,
    TResult Function(DislikeComment value)? dislikeComment,
    TResult Function(LikeSubComment value)? likeSubComment,
    TResult Function(DislikeSubComment value)? dislikeSubComment,
    TResult Function(AddSubComment value)? addSubComment,
    TResult Function(DeleteSubComment value)? deleteSubComment,
    TResult Function(DeleteComment value)? deleteComment,
    required TResult orElse(),
  }) {
    if (loadComments != null) {
      return loadComments(this);
    }
    return orElse();
  }
}

abstract class LoadComments implements CommentEvent {
  const factory LoadComments({required final String postid}) = _$LoadComments;

  String get postid;
  @JsonKey(ignore: true)
  _$$LoadCommentsCopyWith<_$LoadComments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddCommentCopyWith<$Res> {
  factory _$$AddCommentCopyWith(
          _$AddComment value, $Res Function(_$AddComment) then) =
      __$$AddCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$AddCommentCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res, _$AddComment>
    implements _$$AddCommentCopyWith<$Res> {
  __$$AddCommentCopyWithImpl(
      _$AddComment _value, $Res Function(_$AddComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AddComment(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$AddComment implements AddComment {
  const _$AddComment({required final Map<String, dynamic> data}) : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'CommentEvent.addComment(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddComment &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCommentCopyWith<_$AddComment> get copyWith =>
      __$$AddCommentCopyWithImpl<_$AddComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postid) loadComments,
    required TResult Function(Map<String, dynamic> data) addComment,
    required TResult Function(String commentid, int index) likeComment,
    required TResult Function(String commentid, int index) dislikeComment,
    required TResult Function(String commentid, int index, int subindex)
        likeSubComment,
    required TResult Function(String commentid, int index, int subindex)
        dislikeSubComment,
    required TResult Function(Map<String, dynamic> data, int index)
        addSubComment,
    required TResult Function(String commentid, int index, int subindex)
        deleteSubComment,
    required TResult Function(String commentid, int index) deleteComment,
  }) {
    return addComment(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postid)? loadComments,
    TResult? Function(Map<String, dynamic> data)? addComment,
    TResult? Function(String commentid, int index)? likeComment,
    TResult? Function(String commentid, int index)? dislikeComment,
    TResult? Function(String commentid, int index, int subindex)?
        likeSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult? Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult? Function(String commentid, int index)? deleteComment,
  }) {
    return addComment?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postid)? loadComments,
    TResult Function(Map<String, dynamic> data)? addComment,
    TResult Function(String commentid, int index)? likeComment,
    TResult Function(String commentid, int index)? dislikeComment,
    TResult Function(String commentid, int index, int subindex)? likeSubComment,
    TResult Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult Function(String commentid, int index)? deleteComment,
    required TResult orElse(),
  }) {
    if (addComment != null) {
      return addComment(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(AddComment value) addComment,
    required TResult Function(LikeComment value) likeComment,
    required TResult Function(DislikeComment value) dislikeComment,
    required TResult Function(LikeSubComment value) likeSubComment,
    required TResult Function(DislikeSubComment value) dislikeSubComment,
    required TResult Function(AddSubComment value) addSubComment,
    required TResult Function(DeleteSubComment value) deleteSubComment,
    required TResult Function(DeleteComment value) deleteComment,
  }) {
    return addComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(LikeComment value)? likeComment,
    TResult? Function(DislikeComment value)? dislikeComment,
    TResult? Function(LikeSubComment value)? likeSubComment,
    TResult? Function(DislikeSubComment value)? dislikeSubComment,
    TResult? Function(AddSubComment value)? addSubComment,
    TResult? Function(DeleteSubComment value)? deleteSubComment,
    TResult? Function(DeleteComment value)? deleteComment,
  }) {
    return addComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(AddComment value)? addComment,
    TResult Function(LikeComment value)? likeComment,
    TResult Function(DislikeComment value)? dislikeComment,
    TResult Function(LikeSubComment value)? likeSubComment,
    TResult Function(DislikeSubComment value)? dislikeSubComment,
    TResult Function(AddSubComment value)? addSubComment,
    TResult Function(DeleteSubComment value)? deleteSubComment,
    TResult Function(DeleteComment value)? deleteComment,
    required TResult orElse(),
  }) {
    if (addComment != null) {
      return addComment(this);
    }
    return orElse();
  }
}

abstract class AddComment implements CommentEvent {
  const factory AddComment({required final Map<String, dynamic> data}) =
      _$AddComment;

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$AddCommentCopyWith<_$AddComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LikeCommentCopyWith<$Res> {
  factory _$$LikeCommentCopyWith(
          _$LikeComment value, $Res Function(_$LikeComment) then) =
      __$$LikeCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({String commentid, int index});
}

/// @nodoc
class __$$LikeCommentCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res, _$LikeComment>
    implements _$$LikeCommentCopyWith<$Res> {
  __$$LikeCommentCopyWithImpl(
      _$LikeComment _value, $Res Function(_$LikeComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentid = null,
    Object? index = null,
  }) {
    return _then(_$LikeComment(
      commentid: null == commentid
          ? _value.commentid
          : commentid // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LikeComment implements LikeComment {
  const _$LikeComment({required this.commentid, required this.index});

  @override
  final String commentid;
  @override
  final int index;

  @override
  String toString() {
    return 'CommentEvent.likeComment(commentid: $commentid, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeComment &&
            (identical(other.commentid, commentid) ||
                other.commentid == commentid) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commentid, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeCommentCopyWith<_$LikeComment> get copyWith =>
      __$$LikeCommentCopyWithImpl<_$LikeComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postid) loadComments,
    required TResult Function(Map<String, dynamic> data) addComment,
    required TResult Function(String commentid, int index) likeComment,
    required TResult Function(String commentid, int index) dislikeComment,
    required TResult Function(String commentid, int index, int subindex)
        likeSubComment,
    required TResult Function(String commentid, int index, int subindex)
        dislikeSubComment,
    required TResult Function(Map<String, dynamic> data, int index)
        addSubComment,
    required TResult Function(String commentid, int index, int subindex)
        deleteSubComment,
    required TResult Function(String commentid, int index) deleteComment,
  }) {
    return likeComment(commentid, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postid)? loadComments,
    TResult? Function(Map<String, dynamic> data)? addComment,
    TResult? Function(String commentid, int index)? likeComment,
    TResult? Function(String commentid, int index)? dislikeComment,
    TResult? Function(String commentid, int index, int subindex)?
        likeSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult? Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult? Function(String commentid, int index)? deleteComment,
  }) {
    return likeComment?.call(commentid, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postid)? loadComments,
    TResult Function(Map<String, dynamic> data)? addComment,
    TResult Function(String commentid, int index)? likeComment,
    TResult Function(String commentid, int index)? dislikeComment,
    TResult Function(String commentid, int index, int subindex)? likeSubComment,
    TResult Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult Function(String commentid, int index)? deleteComment,
    required TResult orElse(),
  }) {
    if (likeComment != null) {
      return likeComment(commentid, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(AddComment value) addComment,
    required TResult Function(LikeComment value) likeComment,
    required TResult Function(DislikeComment value) dislikeComment,
    required TResult Function(LikeSubComment value) likeSubComment,
    required TResult Function(DislikeSubComment value) dislikeSubComment,
    required TResult Function(AddSubComment value) addSubComment,
    required TResult Function(DeleteSubComment value) deleteSubComment,
    required TResult Function(DeleteComment value) deleteComment,
  }) {
    return likeComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(LikeComment value)? likeComment,
    TResult? Function(DislikeComment value)? dislikeComment,
    TResult? Function(LikeSubComment value)? likeSubComment,
    TResult? Function(DislikeSubComment value)? dislikeSubComment,
    TResult? Function(AddSubComment value)? addSubComment,
    TResult? Function(DeleteSubComment value)? deleteSubComment,
    TResult? Function(DeleteComment value)? deleteComment,
  }) {
    return likeComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(AddComment value)? addComment,
    TResult Function(LikeComment value)? likeComment,
    TResult Function(DislikeComment value)? dislikeComment,
    TResult Function(LikeSubComment value)? likeSubComment,
    TResult Function(DislikeSubComment value)? dislikeSubComment,
    TResult Function(AddSubComment value)? addSubComment,
    TResult Function(DeleteSubComment value)? deleteSubComment,
    TResult Function(DeleteComment value)? deleteComment,
    required TResult orElse(),
  }) {
    if (likeComment != null) {
      return likeComment(this);
    }
    return orElse();
  }
}

abstract class LikeComment implements CommentEvent {
  const factory LikeComment(
      {required final String commentid,
      required final int index}) = _$LikeComment;

  String get commentid;
  int get index;
  @JsonKey(ignore: true)
  _$$LikeCommentCopyWith<_$LikeComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DislikeCommentCopyWith<$Res> {
  factory _$$DislikeCommentCopyWith(
          _$DislikeComment value, $Res Function(_$DislikeComment) then) =
      __$$DislikeCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({String commentid, int index});
}

/// @nodoc
class __$$DislikeCommentCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res, _$DislikeComment>
    implements _$$DislikeCommentCopyWith<$Res> {
  __$$DislikeCommentCopyWithImpl(
      _$DislikeComment _value, $Res Function(_$DislikeComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentid = null,
    Object? index = null,
  }) {
    return _then(_$DislikeComment(
      commentid: null == commentid
          ? _value.commentid
          : commentid // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DislikeComment implements DislikeComment {
  const _$DislikeComment({required this.commentid, required this.index});

  @override
  final String commentid;
  @override
  final int index;

  @override
  String toString() {
    return 'CommentEvent.dislikeComment(commentid: $commentid, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DislikeComment &&
            (identical(other.commentid, commentid) ||
                other.commentid == commentid) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commentid, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DislikeCommentCopyWith<_$DislikeComment> get copyWith =>
      __$$DislikeCommentCopyWithImpl<_$DislikeComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postid) loadComments,
    required TResult Function(Map<String, dynamic> data) addComment,
    required TResult Function(String commentid, int index) likeComment,
    required TResult Function(String commentid, int index) dislikeComment,
    required TResult Function(String commentid, int index, int subindex)
        likeSubComment,
    required TResult Function(String commentid, int index, int subindex)
        dislikeSubComment,
    required TResult Function(Map<String, dynamic> data, int index)
        addSubComment,
    required TResult Function(String commentid, int index, int subindex)
        deleteSubComment,
    required TResult Function(String commentid, int index) deleteComment,
  }) {
    return dislikeComment(commentid, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postid)? loadComments,
    TResult? Function(Map<String, dynamic> data)? addComment,
    TResult? Function(String commentid, int index)? likeComment,
    TResult? Function(String commentid, int index)? dislikeComment,
    TResult? Function(String commentid, int index, int subindex)?
        likeSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult? Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult? Function(String commentid, int index)? deleteComment,
  }) {
    return dislikeComment?.call(commentid, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postid)? loadComments,
    TResult Function(Map<String, dynamic> data)? addComment,
    TResult Function(String commentid, int index)? likeComment,
    TResult Function(String commentid, int index)? dislikeComment,
    TResult Function(String commentid, int index, int subindex)? likeSubComment,
    TResult Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult Function(String commentid, int index)? deleteComment,
    required TResult orElse(),
  }) {
    if (dislikeComment != null) {
      return dislikeComment(commentid, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(AddComment value) addComment,
    required TResult Function(LikeComment value) likeComment,
    required TResult Function(DislikeComment value) dislikeComment,
    required TResult Function(LikeSubComment value) likeSubComment,
    required TResult Function(DislikeSubComment value) dislikeSubComment,
    required TResult Function(AddSubComment value) addSubComment,
    required TResult Function(DeleteSubComment value) deleteSubComment,
    required TResult Function(DeleteComment value) deleteComment,
  }) {
    return dislikeComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(LikeComment value)? likeComment,
    TResult? Function(DislikeComment value)? dislikeComment,
    TResult? Function(LikeSubComment value)? likeSubComment,
    TResult? Function(DislikeSubComment value)? dislikeSubComment,
    TResult? Function(AddSubComment value)? addSubComment,
    TResult? Function(DeleteSubComment value)? deleteSubComment,
    TResult? Function(DeleteComment value)? deleteComment,
  }) {
    return dislikeComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(AddComment value)? addComment,
    TResult Function(LikeComment value)? likeComment,
    TResult Function(DislikeComment value)? dislikeComment,
    TResult Function(LikeSubComment value)? likeSubComment,
    TResult Function(DislikeSubComment value)? dislikeSubComment,
    TResult Function(AddSubComment value)? addSubComment,
    TResult Function(DeleteSubComment value)? deleteSubComment,
    TResult Function(DeleteComment value)? deleteComment,
    required TResult orElse(),
  }) {
    if (dislikeComment != null) {
      return dislikeComment(this);
    }
    return orElse();
  }
}

abstract class DislikeComment implements CommentEvent {
  const factory DislikeComment(
      {required final String commentid,
      required final int index}) = _$DislikeComment;

  String get commentid;
  int get index;
  @JsonKey(ignore: true)
  _$$DislikeCommentCopyWith<_$DislikeComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LikeSubCommentCopyWith<$Res> {
  factory _$$LikeSubCommentCopyWith(
          _$LikeSubComment value, $Res Function(_$LikeSubComment) then) =
      __$$LikeSubCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({String commentid, int index, int subindex});
}

/// @nodoc
class __$$LikeSubCommentCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res, _$LikeSubComment>
    implements _$$LikeSubCommentCopyWith<$Res> {
  __$$LikeSubCommentCopyWithImpl(
      _$LikeSubComment _value, $Res Function(_$LikeSubComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentid = null,
    Object? index = null,
    Object? subindex = null,
  }) {
    return _then(_$LikeSubComment(
      commentid: null == commentid
          ? _value.commentid
          : commentid // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      subindex: null == subindex
          ? _value.subindex
          : subindex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LikeSubComment implements LikeSubComment {
  const _$LikeSubComment(
      {required this.commentid, required this.index, required this.subindex});

  @override
  final String commentid;
  @override
  final int index;
  @override
  final int subindex;

  @override
  String toString() {
    return 'CommentEvent.likeSubComment(commentid: $commentid, index: $index, subindex: $subindex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeSubComment &&
            (identical(other.commentid, commentid) ||
                other.commentid == commentid) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.subindex, subindex) ||
                other.subindex == subindex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commentid, index, subindex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeSubCommentCopyWith<_$LikeSubComment> get copyWith =>
      __$$LikeSubCommentCopyWithImpl<_$LikeSubComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postid) loadComments,
    required TResult Function(Map<String, dynamic> data) addComment,
    required TResult Function(String commentid, int index) likeComment,
    required TResult Function(String commentid, int index) dislikeComment,
    required TResult Function(String commentid, int index, int subindex)
        likeSubComment,
    required TResult Function(String commentid, int index, int subindex)
        dislikeSubComment,
    required TResult Function(Map<String, dynamic> data, int index)
        addSubComment,
    required TResult Function(String commentid, int index, int subindex)
        deleteSubComment,
    required TResult Function(String commentid, int index) deleteComment,
  }) {
    return likeSubComment(commentid, index, subindex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postid)? loadComments,
    TResult? Function(Map<String, dynamic> data)? addComment,
    TResult? Function(String commentid, int index)? likeComment,
    TResult? Function(String commentid, int index)? dislikeComment,
    TResult? Function(String commentid, int index, int subindex)?
        likeSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult? Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult? Function(String commentid, int index)? deleteComment,
  }) {
    return likeSubComment?.call(commentid, index, subindex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postid)? loadComments,
    TResult Function(Map<String, dynamic> data)? addComment,
    TResult Function(String commentid, int index)? likeComment,
    TResult Function(String commentid, int index)? dislikeComment,
    TResult Function(String commentid, int index, int subindex)? likeSubComment,
    TResult Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult Function(String commentid, int index)? deleteComment,
    required TResult orElse(),
  }) {
    if (likeSubComment != null) {
      return likeSubComment(commentid, index, subindex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(AddComment value) addComment,
    required TResult Function(LikeComment value) likeComment,
    required TResult Function(DislikeComment value) dislikeComment,
    required TResult Function(LikeSubComment value) likeSubComment,
    required TResult Function(DislikeSubComment value) dislikeSubComment,
    required TResult Function(AddSubComment value) addSubComment,
    required TResult Function(DeleteSubComment value) deleteSubComment,
    required TResult Function(DeleteComment value) deleteComment,
  }) {
    return likeSubComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(LikeComment value)? likeComment,
    TResult? Function(DislikeComment value)? dislikeComment,
    TResult? Function(LikeSubComment value)? likeSubComment,
    TResult? Function(DislikeSubComment value)? dislikeSubComment,
    TResult? Function(AddSubComment value)? addSubComment,
    TResult? Function(DeleteSubComment value)? deleteSubComment,
    TResult? Function(DeleteComment value)? deleteComment,
  }) {
    return likeSubComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(AddComment value)? addComment,
    TResult Function(LikeComment value)? likeComment,
    TResult Function(DislikeComment value)? dislikeComment,
    TResult Function(LikeSubComment value)? likeSubComment,
    TResult Function(DislikeSubComment value)? dislikeSubComment,
    TResult Function(AddSubComment value)? addSubComment,
    TResult Function(DeleteSubComment value)? deleteSubComment,
    TResult Function(DeleteComment value)? deleteComment,
    required TResult orElse(),
  }) {
    if (likeSubComment != null) {
      return likeSubComment(this);
    }
    return orElse();
  }
}

abstract class LikeSubComment implements CommentEvent {
  const factory LikeSubComment(
      {required final String commentid,
      required final int index,
      required final int subindex}) = _$LikeSubComment;

  String get commentid;
  int get index;
  int get subindex;
  @JsonKey(ignore: true)
  _$$LikeSubCommentCopyWith<_$LikeSubComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DislikeSubCommentCopyWith<$Res> {
  factory _$$DislikeSubCommentCopyWith(
          _$DislikeSubComment value, $Res Function(_$DislikeSubComment) then) =
      __$$DislikeSubCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({String commentid, int index, int subindex});
}

/// @nodoc
class __$$DislikeSubCommentCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res, _$DislikeSubComment>
    implements _$$DislikeSubCommentCopyWith<$Res> {
  __$$DislikeSubCommentCopyWithImpl(
      _$DislikeSubComment _value, $Res Function(_$DislikeSubComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentid = null,
    Object? index = null,
    Object? subindex = null,
  }) {
    return _then(_$DislikeSubComment(
      commentid: null == commentid
          ? _value.commentid
          : commentid // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      subindex: null == subindex
          ? _value.subindex
          : subindex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DislikeSubComment implements DislikeSubComment {
  const _$DislikeSubComment(
      {required this.commentid, required this.index, required this.subindex});

  @override
  final String commentid;
  @override
  final int index;
  @override
  final int subindex;

  @override
  String toString() {
    return 'CommentEvent.dislikeSubComment(commentid: $commentid, index: $index, subindex: $subindex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DislikeSubComment &&
            (identical(other.commentid, commentid) ||
                other.commentid == commentid) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.subindex, subindex) ||
                other.subindex == subindex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commentid, index, subindex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DislikeSubCommentCopyWith<_$DislikeSubComment> get copyWith =>
      __$$DislikeSubCommentCopyWithImpl<_$DislikeSubComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postid) loadComments,
    required TResult Function(Map<String, dynamic> data) addComment,
    required TResult Function(String commentid, int index) likeComment,
    required TResult Function(String commentid, int index) dislikeComment,
    required TResult Function(String commentid, int index, int subindex)
        likeSubComment,
    required TResult Function(String commentid, int index, int subindex)
        dislikeSubComment,
    required TResult Function(Map<String, dynamic> data, int index)
        addSubComment,
    required TResult Function(String commentid, int index, int subindex)
        deleteSubComment,
    required TResult Function(String commentid, int index) deleteComment,
  }) {
    return dislikeSubComment(commentid, index, subindex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postid)? loadComments,
    TResult? Function(Map<String, dynamic> data)? addComment,
    TResult? Function(String commentid, int index)? likeComment,
    TResult? Function(String commentid, int index)? dislikeComment,
    TResult? Function(String commentid, int index, int subindex)?
        likeSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult? Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult? Function(String commentid, int index)? deleteComment,
  }) {
    return dislikeSubComment?.call(commentid, index, subindex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postid)? loadComments,
    TResult Function(Map<String, dynamic> data)? addComment,
    TResult Function(String commentid, int index)? likeComment,
    TResult Function(String commentid, int index)? dislikeComment,
    TResult Function(String commentid, int index, int subindex)? likeSubComment,
    TResult Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult Function(String commentid, int index)? deleteComment,
    required TResult orElse(),
  }) {
    if (dislikeSubComment != null) {
      return dislikeSubComment(commentid, index, subindex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(AddComment value) addComment,
    required TResult Function(LikeComment value) likeComment,
    required TResult Function(DislikeComment value) dislikeComment,
    required TResult Function(LikeSubComment value) likeSubComment,
    required TResult Function(DislikeSubComment value) dislikeSubComment,
    required TResult Function(AddSubComment value) addSubComment,
    required TResult Function(DeleteSubComment value) deleteSubComment,
    required TResult Function(DeleteComment value) deleteComment,
  }) {
    return dislikeSubComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(LikeComment value)? likeComment,
    TResult? Function(DislikeComment value)? dislikeComment,
    TResult? Function(LikeSubComment value)? likeSubComment,
    TResult? Function(DislikeSubComment value)? dislikeSubComment,
    TResult? Function(AddSubComment value)? addSubComment,
    TResult? Function(DeleteSubComment value)? deleteSubComment,
    TResult? Function(DeleteComment value)? deleteComment,
  }) {
    return dislikeSubComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(AddComment value)? addComment,
    TResult Function(LikeComment value)? likeComment,
    TResult Function(DislikeComment value)? dislikeComment,
    TResult Function(LikeSubComment value)? likeSubComment,
    TResult Function(DislikeSubComment value)? dislikeSubComment,
    TResult Function(AddSubComment value)? addSubComment,
    TResult Function(DeleteSubComment value)? deleteSubComment,
    TResult Function(DeleteComment value)? deleteComment,
    required TResult orElse(),
  }) {
    if (dislikeSubComment != null) {
      return dislikeSubComment(this);
    }
    return orElse();
  }
}

abstract class DislikeSubComment implements CommentEvent {
  const factory DislikeSubComment(
      {required final String commentid,
      required final int index,
      required final int subindex}) = _$DislikeSubComment;

  String get commentid;
  int get index;
  int get subindex;
  @JsonKey(ignore: true)
  _$$DislikeSubCommentCopyWith<_$DislikeSubComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddSubCommentCopyWith<$Res> {
  factory _$$AddSubCommentCopyWith(
          _$AddSubComment value, $Res Function(_$AddSubComment) then) =
      __$$AddSubCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data, int index});
}

/// @nodoc
class __$$AddSubCommentCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res, _$AddSubComment>
    implements _$$AddSubCommentCopyWith<$Res> {
  __$$AddSubCommentCopyWithImpl(
      _$AddSubComment _value, $Res Function(_$AddSubComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? index = null,
  }) {
    return _then(_$AddSubComment(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddSubComment implements AddSubComment {
  const _$AddSubComment(
      {required final Map<String, dynamic> data, required this.index})
      : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final int index;

  @override
  String toString() {
    return 'CommentEvent.addSubComment(data: $data, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSubComment &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSubCommentCopyWith<_$AddSubComment> get copyWith =>
      __$$AddSubCommentCopyWithImpl<_$AddSubComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postid) loadComments,
    required TResult Function(Map<String, dynamic> data) addComment,
    required TResult Function(String commentid, int index) likeComment,
    required TResult Function(String commentid, int index) dislikeComment,
    required TResult Function(String commentid, int index, int subindex)
        likeSubComment,
    required TResult Function(String commentid, int index, int subindex)
        dislikeSubComment,
    required TResult Function(Map<String, dynamic> data, int index)
        addSubComment,
    required TResult Function(String commentid, int index, int subindex)
        deleteSubComment,
    required TResult Function(String commentid, int index) deleteComment,
  }) {
    return addSubComment(data, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postid)? loadComments,
    TResult? Function(Map<String, dynamic> data)? addComment,
    TResult? Function(String commentid, int index)? likeComment,
    TResult? Function(String commentid, int index)? dislikeComment,
    TResult? Function(String commentid, int index, int subindex)?
        likeSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult? Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult? Function(String commentid, int index)? deleteComment,
  }) {
    return addSubComment?.call(data, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postid)? loadComments,
    TResult Function(Map<String, dynamic> data)? addComment,
    TResult Function(String commentid, int index)? likeComment,
    TResult Function(String commentid, int index)? dislikeComment,
    TResult Function(String commentid, int index, int subindex)? likeSubComment,
    TResult Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult Function(String commentid, int index)? deleteComment,
    required TResult orElse(),
  }) {
    if (addSubComment != null) {
      return addSubComment(data, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(AddComment value) addComment,
    required TResult Function(LikeComment value) likeComment,
    required TResult Function(DislikeComment value) dislikeComment,
    required TResult Function(LikeSubComment value) likeSubComment,
    required TResult Function(DislikeSubComment value) dislikeSubComment,
    required TResult Function(AddSubComment value) addSubComment,
    required TResult Function(DeleteSubComment value) deleteSubComment,
    required TResult Function(DeleteComment value) deleteComment,
  }) {
    return addSubComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(LikeComment value)? likeComment,
    TResult? Function(DislikeComment value)? dislikeComment,
    TResult? Function(LikeSubComment value)? likeSubComment,
    TResult? Function(DislikeSubComment value)? dislikeSubComment,
    TResult? Function(AddSubComment value)? addSubComment,
    TResult? Function(DeleteSubComment value)? deleteSubComment,
    TResult? Function(DeleteComment value)? deleteComment,
  }) {
    return addSubComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(AddComment value)? addComment,
    TResult Function(LikeComment value)? likeComment,
    TResult Function(DislikeComment value)? dislikeComment,
    TResult Function(LikeSubComment value)? likeSubComment,
    TResult Function(DislikeSubComment value)? dislikeSubComment,
    TResult Function(AddSubComment value)? addSubComment,
    TResult Function(DeleteSubComment value)? deleteSubComment,
    TResult Function(DeleteComment value)? deleteComment,
    required TResult orElse(),
  }) {
    if (addSubComment != null) {
      return addSubComment(this);
    }
    return orElse();
  }
}

abstract class AddSubComment implements CommentEvent {
  const factory AddSubComment(
      {required final Map<String, dynamic> data,
      required final int index}) = _$AddSubComment;

  Map<String, dynamic> get data;
  int get index;
  @JsonKey(ignore: true)
  _$$AddSubCommentCopyWith<_$AddSubComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteSubCommentCopyWith<$Res> {
  factory _$$DeleteSubCommentCopyWith(
          _$DeleteSubComment value, $Res Function(_$DeleteSubComment) then) =
      __$$DeleteSubCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({String commentid, int index, int subindex});
}

/// @nodoc
class __$$DeleteSubCommentCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res, _$DeleteSubComment>
    implements _$$DeleteSubCommentCopyWith<$Res> {
  __$$DeleteSubCommentCopyWithImpl(
      _$DeleteSubComment _value, $Res Function(_$DeleteSubComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentid = null,
    Object? index = null,
    Object? subindex = null,
  }) {
    return _then(_$DeleteSubComment(
      commentid: null == commentid
          ? _value.commentid
          : commentid // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      subindex: null == subindex
          ? _value.subindex
          : subindex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteSubComment implements DeleteSubComment {
  const _$DeleteSubComment(
      {required this.commentid, required this.index, required this.subindex});

  @override
  final String commentid;
  @override
  final int index;
  @override
  final int subindex;

  @override
  String toString() {
    return 'CommentEvent.deleteSubComment(commentid: $commentid, index: $index, subindex: $subindex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSubComment &&
            (identical(other.commentid, commentid) ||
                other.commentid == commentid) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.subindex, subindex) ||
                other.subindex == subindex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commentid, index, subindex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSubCommentCopyWith<_$DeleteSubComment> get copyWith =>
      __$$DeleteSubCommentCopyWithImpl<_$DeleteSubComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postid) loadComments,
    required TResult Function(Map<String, dynamic> data) addComment,
    required TResult Function(String commentid, int index) likeComment,
    required TResult Function(String commentid, int index) dislikeComment,
    required TResult Function(String commentid, int index, int subindex)
        likeSubComment,
    required TResult Function(String commentid, int index, int subindex)
        dislikeSubComment,
    required TResult Function(Map<String, dynamic> data, int index)
        addSubComment,
    required TResult Function(String commentid, int index, int subindex)
        deleteSubComment,
    required TResult Function(String commentid, int index) deleteComment,
  }) {
    return deleteSubComment(commentid, index, subindex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postid)? loadComments,
    TResult? Function(Map<String, dynamic> data)? addComment,
    TResult? Function(String commentid, int index)? likeComment,
    TResult? Function(String commentid, int index)? dislikeComment,
    TResult? Function(String commentid, int index, int subindex)?
        likeSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult? Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult? Function(String commentid, int index)? deleteComment,
  }) {
    return deleteSubComment?.call(commentid, index, subindex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postid)? loadComments,
    TResult Function(Map<String, dynamic> data)? addComment,
    TResult Function(String commentid, int index)? likeComment,
    TResult Function(String commentid, int index)? dislikeComment,
    TResult Function(String commentid, int index, int subindex)? likeSubComment,
    TResult Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult Function(String commentid, int index)? deleteComment,
    required TResult orElse(),
  }) {
    if (deleteSubComment != null) {
      return deleteSubComment(commentid, index, subindex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(AddComment value) addComment,
    required TResult Function(LikeComment value) likeComment,
    required TResult Function(DislikeComment value) dislikeComment,
    required TResult Function(LikeSubComment value) likeSubComment,
    required TResult Function(DislikeSubComment value) dislikeSubComment,
    required TResult Function(AddSubComment value) addSubComment,
    required TResult Function(DeleteSubComment value) deleteSubComment,
    required TResult Function(DeleteComment value) deleteComment,
  }) {
    return deleteSubComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(LikeComment value)? likeComment,
    TResult? Function(DislikeComment value)? dislikeComment,
    TResult? Function(LikeSubComment value)? likeSubComment,
    TResult? Function(DislikeSubComment value)? dislikeSubComment,
    TResult? Function(AddSubComment value)? addSubComment,
    TResult? Function(DeleteSubComment value)? deleteSubComment,
    TResult? Function(DeleteComment value)? deleteComment,
  }) {
    return deleteSubComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(AddComment value)? addComment,
    TResult Function(LikeComment value)? likeComment,
    TResult Function(DislikeComment value)? dislikeComment,
    TResult Function(LikeSubComment value)? likeSubComment,
    TResult Function(DislikeSubComment value)? dislikeSubComment,
    TResult Function(AddSubComment value)? addSubComment,
    TResult Function(DeleteSubComment value)? deleteSubComment,
    TResult Function(DeleteComment value)? deleteComment,
    required TResult orElse(),
  }) {
    if (deleteSubComment != null) {
      return deleteSubComment(this);
    }
    return orElse();
  }
}

abstract class DeleteSubComment implements CommentEvent {
  const factory DeleteSubComment(
      {required final String commentid,
      required final int index,
      required final int subindex}) = _$DeleteSubComment;

  String get commentid;
  int get index;
  int get subindex;
  @JsonKey(ignore: true)
  _$$DeleteSubCommentCopyWith<_$DeleteSubComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCommentCopyWith<$Res> {
  factory _$$DeleteCommentCopyWith(
          _$DeleteComment value, $Res Function(_$DeleteComment) then) =
      __$$DeleteCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({String commentid, int index});
}

/// @nodoc
class __$$DeleteCommentCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res, _$DeleteComment>
    implements _$$DeleteCommentCopyWith<$Res> {
  __$$DeleteCommentCopyWithImpl(
      _$DeleteComment _value, $Res Function(_$DeleteComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentid = null,
    Object? index = null,
  }) {
    return _then(_$DeleteComment(
      commentid: null == commentid
          ? _value.commentid
          : commentid // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteComment implements DeleteComment {
  const _$DeleteComment({required this.commentid, required this.index});

  @override
  final String commentid;
  @override
  final int index;

  @override
  String toString() {
    return 'CommentEvent.deleteComment(commentid: $commentid, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteComment &&
            (identical(other.commentid, commentid) ||
                other.commentid == commentid) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commentid, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCommentCopyWith<_$DeleteComment> get copyWith =>
      __$$DeleteCommentCopyWithImpl<_$DeleteComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postid) loadComments,
    required TResult Function(Map<String, dynamic> data) addComment,
    required TResult Function(String commentid, int index) likeComment,
    required TResult Function(String commentid, int index) dislikeComment,
    required TResult Function(String commentid, int index, int subindex)
        likeSubComment,
    required TResult Function(String commentid, int index, int subindex)
        dislikeSubComment,
    required TResult Function(Map<String, dynamic> data, int index)
        addSubComment,
    required TResult Function(String commentid, int index, int subindex)
        deleteSubComment,
    required TResult Function(String commentid, int index) deleteComment,
  }) {
    return deleteComment(commentid, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postid)? loadComments,
    TResult? Function(Map<String, dynamic> data)? addComment,
    TResult? Function(String commentid, int index)? likeComment,
    TResult? Function(String commentid, int index)? dislikeComment,
    TResult? Function(String commentid, int index, int subindex)?
        likeSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult? Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult? Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult? Function(String commentid, int index)? deleteComment,
  }) {
    return deleteComment?.call(commentid, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postid)? loadComments,
    TResult Function(Map<String, dynamic> data)? addComment,
    TResult Function(String commentid, int index)? likeComment,
    TResult Function(String commentid, int index)? dislikeComment,
    TResult Function(String commentid, int index, int subindex)? likeSubComment,
    TResult Function(String commentid, int index, int subindex)?
        dislikeSubComment,
    TResult Function(Map<String, dynamic> data, int index)? addSubComment,
    TResult Function(String commentid, int index, int subindex)?
        deleteSubComment,
    TResult Function(String commentid, int index)? deleteComment,
    required TResult orElse(),
  }) {
    if (deleteComment != null) {
      return deleteComment(commentid, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(AddComment value) addComment,
    required TResult Function(LikeComment value) likeComment,
    required TResult Function(DislikeComment value) dislikeComment,
    required TResult Function(LikeSubComment value) likeSubComment,
    required TResult Function(DislikeSubComment value) dislikeSubComment,
    required TResult Function(AddSubComment value) addSubComment,
    required TResult Function(DeleteSubComment value) deleteSubComment,
    required TResult Function(DeleteComment value) deleteComment,
  }) {
    return deleteComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(LikeComment value)? likeComment,
    TResult? Function(DislikeComment value)? dislikeComment,
    TResult? Function(LikeSubComment value)? likeSubComment,
    TResult? Function(DislikeSubComment value)? dislikeSubComment,
    TResult? Function(AddSubComment value)? addSubComment,
    TResult? Function(DeleteSubComment value)? deleteSubComment,
    TResult? Function(DeleteComment value)? deleteComment,
  }) {
    return deleteComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(AddComment value)? addComment,
    TResult Function(LikeComment value)? likeComment,
    TResult Function(DislikeComment value)? dislikeComment,
    TResult Function(LikeSubComment value)? likeSubComment,
    TResult Function(DislikeSubComment value)? dislikeSubComment,
    TResult Function(AddSubComment value)? addSubComment,
    TResult Function(DeleteSubComment value)? deleteSubComment,
    TResult Function(DeleteComment value)? deleteComment,
    required TResult orElse(),
  }) {
    if (deleteComment != null) {
      return deleteComment(this);
    }
    return orElse();
  }
}

abstract class DeleteComment implements CommentEvent {
  const factory DeleteComment(
      {required final String commentid,
      required final int index}) = _$DeleteComment;

  String get commentid;
  int get index;
  @JsonKey(ignore: true)
  _$$DeleteCommentCopyWith<_$DeleteComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CommentState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  List<CommentModel> get commentsList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentStateCopyWith<CommentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentStateCopyWith<$Res> {
  factory $CommentStateCopyWith(
          CommentState value, $Res Function(CommentState) then) =
      _$CommentStateCopyWithImpl<$Res, CommentState>;
  @useResult
  $Res call({bool isLoading, bool hasError, List<CommentModel> commentsList});
}

/// @nodoc
class _$CommentStateCopyWithImpl<$Res, $Val extends CommentState>
    implements $CommentStateCopyWith<$Res> {
  _$CommentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? commentsList = null,
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
      commentsList: null == commentsList
          ? _value.commentsList
          : commentsList // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentStateCopyWith<$Res>
    implements $CommentStateCopyWith<$Res> {
  factory _$$_CommentStateCopyWith(
          _$_CommentState value, $Res Function(_$_CommentState) then) =
      __$$_CommentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool hasError, List<CommentModel> commentsList});
}

/// @nodoc
class __$$_CommentStateCopyWithImpl<$Res>
    extends _$CommentStateCopyWithImpl<$Res, _$_CommentState>
    implements _$$_CommentStateCopyWith<$Res> {
  __$$_CommentStateCopyWithImpl(
      _$_CommentState _value, $Res Function(_$_CommentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? commentsList = null,
  }) {
    return _then(_$_CommentState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      commentsList: null == commentsList
          ? _value._commentsList
          : commentsList // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
    ));
  }
}

/// @nodoc

class _$_CommentState implements _CommentState {
  const _$_CommentState(
      {required this.isLoading,
      required this.hasError,
      required final List<CommentModel> commentsList})
      : _commentsList = commentsList;

  @override
  final bool isLoading;
  @override
  final bool hasError;
  final List<CommentModel> _commentsList;
  @override
  List<CommentModel> get commentsList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentsList);
  }

  @override
  String toString() {
    return 'CommentState(isLoading: $isLoading, hasError: $hasError, commentsList: $commentsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            const DeepCollectionEquality()
                .equals(other._commentsList, _commentsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, hasError,
      const DeepCollectionEquality().hash(_commentsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentStateCopyWith<_$_CommentState> get copyWith =>
      __$$_CommentStateCopyWithImpl<_$_CommentState>(this, _$identity);
}

abstract class _CommentState implements CommentState {
  const factory _CommentState(
      {required final bool isLoading,
      required final bool hasError,
      required final List<CommentModel> commentsList}) = _$_CommentState;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  List<CommentModel> get commentsList;
  @override
  @JsonKey(ignore: true)
  _$$_CommentStateCopyWith<_$_CommentState> get copyWith =>
      throw _privateConstructorUsedError;
}
