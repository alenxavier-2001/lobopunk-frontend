import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/notification/notification_services.dart';

import '../../domain/repost/repost_request_model/repost_request_model.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationServices notificationServices;
  NotificationBloc(this.notificationServices)
      : super(NotificationState.initial()) {
    on<LoadData>((event, emit) async {
      //initail state
      emit(const NotificationState(
          isLoading: true,
          hasError: false,
          receivedrequests: [],
          sendrequests: []));

      //get user data
      final result = await notificationServices.getrecievedRequests();
      final result2 = await notificationServices.getsendedRequests();

      //data to state

      final newState = result.fold((MainFailure failure) {
        return const NotificationState(
            isLoading: false,
            hasError: true,
            receivedrequests: [],
            sendrequests: []);
      }, (List<RepostRequestModel> resp) {
        return NotificationState(
            isLoading: false,
            hasError: false,
            receivedrequests: resp,
            sendrequests: []);
      });
      // const LoadUserPosts();

      emit(newState);
      final newState2 = result2.fold((MainFailure failure) {
        return NotificationState(
            isLoading: false,
            hasError: true,
            receivedrequests: state.receivedrequests,
            sendrequests: state.sendrequests);
      }, (List<RepostRequestModel> resp) {
        return NotificationState(
            isLoading: false,
            hasError: false,
            receivedrequests: state.receivedrequests,
            sendrequests: resp);
      });
      // const LoadUserPosts();

      emit(newState2);
    });

    on<ApproveRqst>((event, emit) async {
      //initail state
      emit(NotificationState(
          isLoading: false,
          hasError: false,
          receivedrequests: state.receivedrequests,
          sendrequests: state.sendrequests));

      //get user data
      final result =
          await notificationServices.approverecievedRequests(event.id);

      //data to state

      final newState = result.fold((MainFailure failure) {
        return NotificationState(
            isLoading: false,
            hasError: true,
            receivedrequests: state.receivedrequests,
            sendrequests: state.sendrequests);
      }, (RepostRequestModel resp) {
        return NotificationState(
            isLoading: false,
            hasError: false,
            receivedrequests: List.from(state.receivedrequests)
              ..replaceRange(event.index, event.index + 1, [resp]),
            sendrequests: state.sendrequests);
      });
      // const LoadUserPosts();

      emit(newState);
    });
    on<DeleteRqst>((event, emit) async {
      //initail state
      emit(NotificationState(
        isLoading: false,
        hasError: false,
        receivedrequests: state.receivedrequests,
        sendrequests: List.from(state.sendrequests)..removeAt(event.index),
      ));

      //get user data
      final result = await notificationServices.deletesendedRequests(event.id);

      //data to state

      final newState = result.fold((MainFailure failure) {
        return NotificationState(
            isLoading: false,
            hasError: true,
            receivedrequests: state.receivedrequests,
            sendrequests: state.sendrequests);
      }, (bool resp) {
        return NotificationState(
            isLoading: false,
            hasError: false,
            receivedrequests: state.receivedrequests,
            sendrequests: state.sendrequests);
      });
      // const LoadUserPosts();

      emit(newState);
    });
    on<RejectRqst>((event, emit) async {
      //initail state
      emit(NotificationState(
        isLoading: true,
        hasError: false,
        receivedrequests: List.from(state.sendrequests)..removeAt(event.index),
        sendrequests: state.sendrequests,
      ));

      //get user data
      final result = await notificationServices.rejectRequests(event.id);

      //data to state

      final newState = result.fold((MainFailure failure) {
        return NotificationState(
            isLoading: false,
            hasError: true,
            receivedrequests: state.receivedrequests,
            sendrequests: state.sendrequests);
      }, (bool resp) {
        return NotificationState(
            isLoading: false,
            hasError: false,
            receivedrequests: state.receivedrequests,
            sendrequests: state.sendrequests);
      });
      // const LoadUserPosts();

      emit(newState);
    });
  }
}
