part of 'comment_bloc.dart';

@freezed
class CommentState with _$CommentState {
  const factory CommentState({
    required bool isLoading,
    required bool hasError,
    required List<CommentModel> commentsList,
  }) = _CommentState;

  factory CommentState.initial() =>
      const CommentState(isLoading: false, hasError: false, commentsList: []);
}
