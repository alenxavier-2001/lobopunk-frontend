part of 'addpost_bloc.dart';

@freezed
class AddpostState with _$AddpostState {
  const factory AddpostState(
      {required bool isLoading,
      required bool hasError,
      required File videofile,
      required List<String> hashtags}) = _AddpostState;

  factory AddpostState.initial() => AddpostState(
      isLoading: false, hasError: false, videofile: File(""), hashtags: []);
}
