part of 'comment_bloc.dart';

@freezed
class CommentEvent with _$CommentEvent {
  const factory CommentEvent.loadComments({required String postid}) =
      LoadComments;
  const factory CommentEvent.addComment({required Map<String, dynamic> data}) =
      AddComment;
  const factory CommentEvent.likeComment(
      {required String commentid, required int index}) = LikeComment;
  const factory CommentEvent.dislikeComment(
      {required String commentid, required int index}) = DislikeComment;
  const factory CommentEvent.likeSubComment(
      {required String commentid,
      required int index,
      required int subindex}) = LikeSubComment;
  const factory CommentEvent.dislikeSubComment(
      {required String commentid,
      required int index,
      required int subindex}) = DislikeSubComment;
  const factory CommentEvent.addSubComment(
      {required Map<String, dynamic> data, required int index}) = AddSubComment;
  const factory CommentEvent.deleteSubComment(
      {required String commentid,
      required int index,
      required int subindex}) = DeleteSubComment;
  const factory CommentEvent.deleteComment(
      {required String commentid, required int index}) = DeleteComment;
}
