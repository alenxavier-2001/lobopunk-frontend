// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(String id, int index) approveRqst,
    required TResult Function(String id, int index) deleteRqst,
    required TResult Function(String id, int index) rejectRqst,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(String id, int index)? approveRqst,
    TResult? Function(String id, int index)? deleteRqst,
    TResult? Function(String id, int index)? rejectRqst,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(String id, int index)? approveRqst,
    TResult Function(String id, int index)? deleteRqst,
    TResult Function(String id, int index)? rejectRqst,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(ApproveRqst value) approveRqst,
    required TResult Function(DeleteRqst value) deleteRqst,
    required TResult Function(RejectRqst value) rejectRqst,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(ApproveRqst value)? approveRqst,
    TResult? Function(DeleteRqst value)? deleteRqst,
    TResult? Function(RejectRqst value)? rejectRqst,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(ApproveRqst value)? approveRqst,
    TResult Function(DeleteRqst value)? deleteRqst,
    TResult Function(RejectRqst value)? rejectRqst,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadDataCopyWith<$Res> {
  factory _$$LoadDataCopyWith(
          _$LoadData value, $Res Function(_$LoadData) then) =
      __$$LoadDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadDataCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$LoadData>
    implements _$$LoadDataCopyWith<$Res> {
  __$$LoadDataCopyWithImpl(_$LoadData _value, $Res Function(_$LoadData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadData implements LoadData {
  const _$LoadData();

  @override
  String toString() {
    return 'NotificationEvent.loadData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(String id, int index) approveRqst,
    required TResult Function(String id, int index) deleteRqst,
    required TResult Function(String id, int index) rejectRqst,
  }) {
    return loadData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(String id, int index)? approveRqst,
    TResult? Function(String id, int index)? deleteRqst,
    TResult? Function(String id, int index)? rejectRqst,
  }) {
    return loadData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(String id, int index)? approveRqst,
    TResult Function(String id, int index)? deleteRqst,
    TResult Function(String id, int index)? rejectRqst,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(ApproveRqst value) approveRqst,
    required TResult Function(DeleteRqst value) deleteRqst,
    required TResult Function(RejectRqst value) rejectRqst,
  }) {
    return loadData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(ApproveRqst value)? approveRqst,
    TResult? Function(DeleteRqst value)? deleteRqst,
    TResult? Function(RejectRqst value)? rejectRqst,
  }) {
    return loadData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(ApproveRqst value)? approveRqst,
    TResult Function(DeleteRqst value)? deleteRqst,
    TResult Function(RejectRqst value)? rejectRqst,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(this);
    }
    return orElse();
  }
}

abstract class LoadData implements NotificationEvent {
  const factory LoadData() = _$LoadData;
}

/// @nodoc
abstract class _$$ApproveRqstCopyWith<$Res> {
  factory _$$ApproveRqstCopyWith(
          _$ApproveRqst value, $Res Function(_$ApproveRqst) then) =
      __$$ApproveRqstCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, int index});
}

/// @nodoc
class __$$ApproveRqstCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$ApproveRqst>
    implements _$$ApproveRqstCopyWith<$Res> {
  __$$ApproveRqstCopyWithImpl(
      _$ApproveRqst _value, $Res Function(_$ApproveRqst) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
  }) {
    return _then(_$ApproveRqst(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ApproveRqst implements ApproveRqst {
  const _$ApproveRqst(this.id, this.index);

  @override
  final String id;
  @override
  final int index;

  @override
  String toString() {
    return 'NotificationEvent.approveRqst(id: $id, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveRqst &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveRqstCopyWith<_$ApproveRqst> get copyWith =>
      __$$ApproveRqstCopyWithImpl<_$ApproveRqst>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(String id, int index) approveRqst,
    required TResult Function(String id, int index) deleteRqst,
    required TResult Function(String id, int index) rejectRqst,
  }) {
    return approveRqst(id, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(String id, int index)? approveRqst,
    TResult? Function(String id, int index)? deleteRqst,
    TResult? Function(String id, int index)? rejectRqst,
  }) {
    return approveRqst?.call(id, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(String id, int index)? approveRqst,
    TResult Function(String id, int index)? deleteRqst,
    TResult Function(String id, int index)? rejectRqst,
    required TResult orElse(),
  }) {
    if (approveRqst != null) {
      return approveRqst(id, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(ApproveRqst value) approveRqst,
    required TResult Function(DeleteRqst value) deleteRqst,
    required TResult Function(RejectRqst value) rejectRqst,
  }) {
    return approveRqst(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(ApproveRqst value)? approveRqst,
    TResult? Function(DeleteRqst value)? deleteRqst,
    TResult? Function(RejectRqst value)? rejectRqst,
  }) {
    return approveRqst?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(ApproveRqst value)? approveRqst,
    TResult Function(DeleteRqst value)? deleteRqst,
    TResult Function(RejectRqst value)? rejectRqst,
    required TResult orElse(),
  }) {
    if (approveRqst != null) {
      return approveRqst(this);
    }
    return orElse();
  }
}

abstract class ApproveRqst implements NotificationEvent {
  const factory ApproveRqst(final String id, final int index) = _$ApproveRqst;

  String get id;
  int get index;
  @JsonKey(ignore: true)
  _$$ApproveRqstCopyWith<_$ApproveRqst> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteRqstCopyWith<$Res> {
  factory _$$DeleteRqstCopyWith(
          _$DeleteRqst value, $Res Function(_$DeleteRqst) then) =
      __$$DeleteRqstCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, int index});
}

/// @nodoc
class __$$DeleteRqstCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$DeleteRqst>
    implements _$$DeleteRqstCopyWith<$Res> {
  __$$DeleteRqstCopyWithImpl(
      _$DeleteRqst _value, $Res Function(_$DeleteRqst) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
  }) {
    return _then(_$DeleteRqst(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteRqst implements DeleteRqst {
  const _$DeleteRqst(this.id, this.index);

  @override
  final String id;
  @override
  final int index;

  @override
  String toString() {
    return 'NotificationEvent.deleteRqst(id: $id, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteRqst &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteRqstCopyWith<_$DeleteRqst> get copyWith =>
      __$$DeleteRqstCopyWithImpl<_$DeleteRqst>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(String id, int index) approveRqst,
    required TResult Function(String id, int index) deleteRqst,
    required TResult Function(String id, int index) rejectRqst,
  }) {
    return deleteRqst(id, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(String id, int index)? approveRqst,
    TResult? Function(String id, int index)? deleteRqst,
    TResult? Function(String id, int index)? rejectRqst,
  }) {
    return deleteRqst?.call(id, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(String id, int index)? approveRqst,
    TResult Function(String id, int index)? deleteRqst,
    TResult Function(String id, int index)? rejectRqst,
    required TResult orElse(),
  }) {
    if (deleteRqst != null) {
      return deleteRqst(id, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(ApproveRqst value) approveRqst,
    required TResult Function(DeleteRqst value) deleteRqst,
    required TResult Function(RejectRqst value) rejectRqst,
  }) {
    return deleteRqst(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(ApproveRqst value)? approveRqst,
    TResult? Function(DeleteRqst value)? deleteRqst,
    TResult? Function(RejectRqst value)? rejectRqst,
  }) {
    return deleteRqst?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(ApproveRqst value)? approveRqst,
    TResult Function(DeleteRqst value)? deleteRqst,
    TResult Function(RejectRqst value)? rejectRqst,
    required TResult orElse(),
  }) {
    if (deleteRqst != null) {
      return deleteRqst(this);
    }
    return orElse();
  }
}

abstract class DeleteRqst implements NotificationEvent {
  const factory DeleteRqst(final String id, final int index) = _$DeleteRqst;

  String get id;
  int get index;
  @JsonKey(ignore: true)
  _$$DeleteRqstCopyWith<_$DeleteRqst> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectRqstCopyWith<$Res> {
  factory _$$RejectRqstCopyWith(
          _$RejectRqst value, $Res Function(_$RejectRqst) then) =
      __$$RejectRqstCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, int index});
}

/// @nodoc
class __$$RejectRqstCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$RejectRqst>
    implements _$$RejectRqstCopyWith<$Res> {
  __$$RejectRqstCopyWithImpl(
      _$RejectRqst _value, $Res Function(_$RejectRqst) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
  }) {
    return _then(_$RejectRqst(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RejectRqst implements RejectRqst {
  const _$RejectRqst(this.id, this.index);

  @override
  final String id;
  @override
  final int index;

  @override
  String toString() {
    return 'NotificationEvent.rejectRqst(id: $id, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectRqst &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectRqstCopyWith<_$RejectRqst> get copyWith =>
      __$$RejectRqstCopyWithImpl<_$RejectRqst>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(String id, int index) approveRqst,
    required TResult Function(String id, int index) deleteRqst,
    required TResult Function(String id, int index) rejectRqst,
  }) {
    return rejectRqst(id, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(String id, int index)? approveRqst,
    TResult? Function(String id, int index)? deleteRqst,
    TResult? Function(String id, int index)? rejectRqst,
  }) {
    return rejectRqst?.call(id, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(String id, int index)? approveRqst,
    TResult Function(String id, int index)? deleteRqst,
    TResult Function(String id, int index)? rejectRqst,
    required TResult orElse(),
  }) {
    if (rejectRqst != null) {
      return rejectRqst(id, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(ApproveRqst value) approveRqst,
    required TResult Function(DeleteRqst value) deleteRqst,
    required TResult Function(RejectRqst value) rejectRqst,
  }) {
    return rejectRqst(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(ApproveRqst value)? approveRqst,
    TResult? Function(DeleteRqst value)? deleteRqst,
    TResult? Function(RejectRqst value)? rejectRqst,
  }) {
    return rejectRqst?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(ApproveRqst value)? approveRqst,
    TResult Function(DeleteRqst value)? deleteRqst,
    TResult Function(RejectRqst value)? rejectRqst,
    required TResult orElse(),
  }) {
    if (rejectRqst != null) {
      return rejectRqst(this);
    }
    return orElse();
  }
}

abstract class RejectRqst implements NotificationEvent {
  const factory RejectRqst(final String id, final int index) = _$RejectRqst;

  String get id;
  int get index;
  @JsonKey(ignore: true)
  _$$RejectRqstCopyWith<_$RejectRqst> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  List<RepostRequestModel> get receivedrequests =>
      throw _privateConstructorUsedError;
  List<RepostRequestModel> get sendrequests =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      List<RepostRequestModel> receivedrequests,
      List<RepostRequestModel> sendrequests});
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? receivedrequests = null,
    Object? sendrequests = null,
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
      receivedrequests: null == receivedrequests
          ? _value.receivedrequests
          : receivedrequests // ignore: cast_nullable_to_non_nullable
              as List<RepostRequestModel>,
      sendrequests: null == sendrequests
          ? _value.sendrequests
          : sendrequests // ignore: cast_nullable_to_non_nullable
              as List<RepostRequestModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationStateCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$$_NotificationStateCopyWith(_$_NotificationState value,
          $Res Function(_$_NotificationState) then) =
      __$$_NotificationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      List<RepostRequestModel> receivedrequests,
      List<RepostRequestModel> sendrequests});
}

/// @nodoc
class __$$_NotificationStateCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$_NotificationState>
    implements _$$_NotificationStateCopyWith<$Res> {
  __$$_NotificationStateCopyWithImpl(
      _$_NotificationState _value, $Res Function(_$_NotificationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? receivedrequests = null,
    Object? sendrequests = null,
  }) {
    return _then(_$_NotificationState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      receivedrequests: null == receivedrequests
          ? _value._receivedrequests
          : receivedrequests // ignore: cast_nullable_to_non_nullable
              as List<RepostRequestModel>,
      sendrequests: null == sendrequests
          ? _value._sendrequests
          : sendrequests // ignore: cast_nullable_to_non_nullable
              as List<RepostRequestModel>,
    ));
  }
}

/// @nodoc

class _$_NotificationState implements _NotificationState {
  const _$_NotificationState(
      {required this.isLoading,
      required this.hasError,
      required final List<RepostRequestModel> receivedrequests,
      required final List<RepostRequestModel> sendrequests})
      : _receivedrequests = receivedrequests,
        _sendrequests = sendrequests;

  @override
  final bool isLoading;
  @override
  final bool hasError;
  final List<RepostRequestModel> _receivedrequests;
  @override
  List<RepostRequestModel> get receivedrequests {
    if (_receivedrequests is EqualUnmodifiableListView)
      return _receivedrequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receivedrequests);
  }

  final List<RepostRequestModel> _sendrequests;
  @override
  List<RepostRequestModel> get sendrequests {
    if (_sendrequests is EqualUnmodifiableListView) return _sendrequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sendrequests);
  }

  @override
  String toString() {
    return 'NotificationState(isLoading: $isLoading, hasError: $hasError, receivedrequests: $receivedrequests, sendrequests: $sendrequests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            const DeepCollectionEquality()
                .equals(other._receivedrequests, _receivedrequests) &&
            const DeepCollectionEquality()
                .equals(other._sendrequests, _sendrequests));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      const DeepCollectionEquality().hash(_receivedrequests),
      const DeepCollectionEquality().hash(_sendrequests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationStateCopyWith<_$_NotificationState> get copyWith =>
      __$$_NotificationStateCopyWithImpl<_$_NotificationState>(
          this, _$identity);
}

abstract class _NotificationState implements NotificationState {
  const factory _NotificationState(
          {required final bool isLoading,
          required final bool hasError,
          required final List<RepostRequestModel> receivedrequests,
          required final List<RepostRequestModel> sendrequests}) =
      _$_NotificationState;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  List<RepostRequestModel> get receivedrequests;
  @override
  List<RepostRequestModel> get sendrequests;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationStateCopyWith<_$_NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}
