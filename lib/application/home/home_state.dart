part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {required bool isLoading,
      required bool hasError,
      required PostsPageModel homeposts}) = _HomeState;
  factory HomeState.initial() =>
      HomeState(isLoading: false, hasError: false, homeposts: PostsPageModel());
}
