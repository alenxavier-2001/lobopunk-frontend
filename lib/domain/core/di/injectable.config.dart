// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:lobopunk/application/account/account_bloc.dart' as _i26;
import 'package:lobopunk/application/comment/comment_bloc.dart' as _i27;
import 'package:lobopunk/application/hashtag_screen/hashtagscreen_bloc.dart'
    as _i28;
import 'package:lobopunk/application/home/home_bloc.dart' as _i29;
import 'package:lobopunk/application/notification/notification_bloc.dart'
    as _i30;
import 'package:lobopunk/application/profile_view/profileview_bloc.dart'
    as _i31;
import 'package:lobopunk/application/publicpage/publicpage_bloc.dart' as _i23;
import 'package:lobopunk/domain/addpost/addpost_services.dart' as _i3;
import 'package:lobopunk/domain/auth/auth_services.dart' as _i5;
import 'package:lobopunk/domain/comment/comment_service.dart' as _i7;
import 'package:lobopunk/domain/common_services/common_services.dart' as _i9;
import 'package:lobopunk/domain/filepicker_service/file_picker_services.dart'
    as _i11;
import 'package:lobopunk/domain/hashtags/hashtags_services.dart' as _i13;
import 'package:lobopunk/domain/home/home_services.dart' as _i15;
import 'package:lobopunk/domain/notification/notification_services.dart'
    as _i17;
import 'package:lobopunk/domain/posts/post_services.dart' as _i19;
import 'package:lobopunk/domain/publicpage/publicpage_services.dart' as _i21;
import 'package:lobopunk/domain/user/user_services.dart' as _i24;
import 'package:lobopunk/infrastructure/addpost/addpost_impl.dart' as _i4;
import 'package:lobopunk/infrastructure/auth/auth_impl.dart' as _i6;
import 'package:lobopunk/infrastructure/comments/comments_impl.dart' as _i8;
import 'package:lobopunk/infrastructure/common_impl/common_impl.dart' as _i10;
import 'package:lobopunk/infrastructure/file_picker_impl/file_picker_impl.dart'
    as _i12;
import 'package:lobopunk/infrastructure/hashtags/hashtags_impl.dart' as _i14;
import 'package:lobopunk/infrastructure/home/home_impl.dart' as _i16;
import 'package:lobopunk/infrastructure/notification/notification_impl.dart'
    as _i18;
import 'package:lobopunk/infrastructure/post/post_impl.dart' as _i20;
import 'package:lobopunk/infrastructure/publicpage/publicpage_impl.dart'
    as _i22;
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart' as _i25;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AddPostService>(() => _i4.AddPostImplementation());
    gh.lazySingleton<_i5.AuthService>(() => _i6.AuthImplementation());
    gh.lazySingleton<_i7.CommentServices>(() => _i8.Commentimplementation());
    gh.lazySingleton<_i9.CommonService>(() => _i10.CommonImplementation());
    gh.lazySingleton<_i11.FilePickerServices>(
        () => _i12.FilePickerImplementation());
    gh.lazySingleton<_i13.HashtagsServices>(
        () => _i14.HashtagsImplementation());
    gh.lazySingleton<_i15.HomeServices>(() => _i16.HomeImplementation());
    gh.lazySingleton<_i17.NotificationServices>(
        () => _i18.NotificationImplemnetation());
    gh.lazySingleton<_i19.PostService>(() => _i20.PostImplementation());
    gh.lazySingleton<_i21.PublicPageServices>(
        () => _i22.PublicPageImplementation());
    gh.factory<_i23.PublicpageBloc>(() => _i23.PublicpageBloc(
          gh<_i21.PublicPageServices>(),
          gh<_i13.HashtagsServices>(),
        ));
    gh.lazySingleton<_i24.UserServices>(() => _i25.UserImplementation());
    gh.factory<_i26.AccountBloc>(
        () => _i26.AccountBloc(gh<_i24.UserServices>()));
    gh.factory<_i27.CommentBloc>(
        () => _i27.CommentBloc(gh<_i7.CommentServices>()));
    gh.factory<_i28.HashtagscreenBloc>(
        () => _i28.HashtagscreenBloc(gh<_i19.PostService>()));
    gh.factory<_i29.HomeBloc>(() => _i29.HomeBloc(gh<_i15.HomeServices>()));
    gh.factory<_i30.NotificationBloc>(
        () => _i30.NotificationBloc(gh<_i17.NotificationServices>()));
    gh.factory<_i31.ProfileviewBloc>(
        () => _i31.ProfileviewBloc(gh<_i24.UserServices>()));
    return this;
  }
}
