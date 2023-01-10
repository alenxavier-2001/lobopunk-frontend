import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/repost/repost_request_model/repost_request_model.dart';

abstract class NotificationServices {
  Future<Either<MainFailure, RepostRequestModel>> approverecievedRequests(
      String id);
  Future<Either<MainFailure, bool>> deletesendedRequests(String id);
  Future<Either<MainFailure, bool>> rejectRequests(String id);
  Future<Either<MainFailure, List<RepostRequestModel>>> getsendedRequests();
  Future<Either<MainFailure, List<RepostRequestModel>>> getrecievedRequests();
}
