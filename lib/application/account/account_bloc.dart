import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/account/account_services.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';

part 'account_event.dart';
part 'account_state.dart';
part 'account_bloc.freezed.dart';

@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountService _accountService;
  AccountBloc(this._accountService) : super(AccountState.initial()) {
    on<LoadUserData>((event, emit) async {
      //send loading to UI
      emit(AccountState(
          isLoading: true, hasError: true, userDetails: UserModel()));

      //get user data
      final result = await _accountService.getUseData();
      //data to state

      final newState = result.fold((MainFailure failure) {
        return AccountState(
            isLoading: false, hasError: true, userDetails: UserModel());
      }, (UserModel resp) {
        return AccountState(
            isLoading: false, hasError: false, userDetails: resp);
      });
      emit(newState);
    });
  }
}
