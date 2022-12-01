import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';
part 'main_failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.clientFailure(String msg) = _ClientFailure;
  const factory MainFailure.serverFailure(ServerErrorModel error) =
      _ServerFailure;
  const factory MainFailure.requestCancelled() = RequestCancelled;
  const factory MainFailure.unauthorisedRequest() = UnauthorisedRequest;
  const factory MainFailure.badRequest() = BadRequest;
  const factory MainFailure.notFound(String reason) = NotFound;
  const factory MainFailure.methodNotAllowed() = MethodNotAllowed;
  const factory MainFailure.notAcceptable() = NotAcceptable;
  const factory MainFailure.requestTimeout() = RequestTimeout;
  const factory MainFailure.sendTimeout() = SendTimeout;
  const factory MainFailure.conflict() = Conflict;
  const factory MainFailure.internalServerError() = InternalServerError;
  const factory MainFailure.notImplemented() = NotImplemented;
  const factory MainFailure.serviceUnavailable() = ServiceUnavailable;
  const factory MainFailure.noInternetConnection() = NoInternetConnection;
  const factory MainFailure.formatException() = FormatException;
  const factory MainFailure.unableToProcess() = UnableToProcess;
  const factory MainFailure.defaultError(String error) = DefaultError;
  const factory MainFailure.unexpectedError() = UnexpectedError;
}
