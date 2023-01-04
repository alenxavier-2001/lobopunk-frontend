part of 'profileview_bloc.dart';

@freezed
class ProfileviewEvent with _$ProfileviewEvent {
  const factory ProfileviewEvent.loadData({required String userid}) = LoadData;
}
