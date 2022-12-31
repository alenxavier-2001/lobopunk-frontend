import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/home/home_services.dart';
import 'package:lobopunk/domain/posts/posts_page_model/posts_page_model.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeServices homeServices;
  HomeBloc(this.homeServices) : super(HomeState.initial()) {
    on<LoadHomeData>((event, emit) async {
      emit(HomeState(
          isLoading: true, hasError: false, homeposts: PostsPageModel()));

      //get Home Post

      final result = await homeServices.getuserinterestedposts();
      final newState = result.fold((MainFailure failure) {
        return HomeState(
            isLoading: false, hasError: true, homeposts: PostsPageModel());
      }, (PostsPageModel resp) {
        return HomeState(isLoading: false, hasError: false, homeposts: resp);
      });
      emit(newState);
    });
  }
}
