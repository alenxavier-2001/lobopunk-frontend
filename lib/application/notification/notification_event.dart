part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.loadData() = LoadData;
  const factory NotificationEvent.approveRqst(String id, int index) =
      ApproveRqst;
  const factory NotificationEvent.deleteRqst(String id, int index) = DeleteRqst;
  const factory NotificationEvent.rejectRqst(String id, int index) = RejectRqst;
}
