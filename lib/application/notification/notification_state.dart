part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    required bool isLoading,
    required bool hasError,
    required List<RepostRequestModel> receivedrequests,
    required List<RepostRequestModel> sendrequests,
  }) = _NotificationState;

  factory NotificationState.initial() => const NotificationState(
      isLoading: false,
      hasError: false,
      sendrequests: [],
      receivedrequests: []);
}
