import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/comment/comment_model/comment_model.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';

abstract class CommentServices {
  //get
  Future<Either<MainFailure, List<CommentModel>>> getComments(String postid);

  //post
  Future<Either<MainFailure, CommentModel>> postComment(
      Map<String, dynamic> data);
  Future<Either<MainFailure, CommentModel>> commentLike(String commentid);
  Future<Either<MainFailure, CommentModel>> commentDislike(String commentid);
  Future<Either<MainFailure, bool>> deleteComment(String commentid);
//sub comment section

  Future<Either<MainFailure, CommentModel>> postSubComment(
      Map<String, dynamic> data);
  Future<Either<MainFailure, CommentModel>> subCommentLike(
      String commentid, int subcommentindex);
  Future<Either<MainFailure, CommentModel>> subCommentDislike(
      String commentid, int subcommentindex);
  Future<Either<MainFailure, CommentModel>> deleteSuubComment(
      String commentid, int subcommentindex);
}
