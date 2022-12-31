// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:lobopunk/application/account/account_bloc.dart' as _i24;
import 'package:lobopunk/application/comment/comment_bloc.dart' as _i25;
import 'package:lobopunk/application/hashtag_screen/hashtagscreen_bloc.dart'
    as _i26;
import 'package:lobopunk/application/home/home_bloc.dart' as _i27;
import 'package:lobopunk/application/publicpage/publicpage_bloc.dart' as _i21;
import 'package:lobopunk/domain/addpost/addpost_services.dart' as _i3;
import 'package:lobopunk/domain/auth/auth_services.dart' as _i5;
import 'package:lobopunk/domain/comment/comment_service.dart' as _i7;
import 'package:lobopunk/domain/common_services/common_services.dart' as _i9;
import 'package:lobopunk/domain/filepicker_service/file_picker_services.dart'
    as _i11;
import 'package:lobopunk/domain/hashtags/hashtags_services.dart' as _i13;
import 'package:lobopunk/domain/home/home_services.dart' as _i15;
import 'package:lobopunk/domain/posts/post_services.dart' as _i17;
import 'package:lobopunk/domain/publicpage/publicpage_services.dart' as _i19;
import 'package:lobopunk/domain/user/user_services.dart' as _i22;
import 'package:lobopunk/infrastructure/addpost/addpost_impl.dart' as _i4;
import 'package:lobopunk/infrastructure/auth/auth_impl.dart' as _i6;
import 'package:lobopunk/infrastructure/comments/comments_impl.dart' as _i8;
import 'package:lobopunk/infrastructure/common_impl/common_impl.dart' as _i10;
import 'package:lobopunk/infrastructure/file_picker_impl/file_picker_impl.dart'
    as _i12;
import 'package:lobopunk/infrastructure/hashtags/hashtags_impl.dart' as _i14;
import 'package:lobopunk/infrastructure/home/home_impl.dart' as _i16;
import 'package:lobopunk/infrastructure/post/post_impl.dart' as _i18;
import 'package:lobopunk/infrastructure/publicpage/publicpage_impl.dart'
    as _i20;
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart' as _i23;

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
    gh.lazySingleton<_i17.PostService>(() => _i18.PostImplementation());
    gh.lazySingleton<_i19.PublicPageServices>(
        () => _i20.PublicPageImplementation());
    gh.factory<_i21.PublicpageBloc>(() => _i21.PublicpageBloc(
          gh<_i19.PublicPageServices>(),
          gh<_i13.HashtagsServices>(),
        ));
    gh.lazySingleton<_i22.UserServices>(() => _i23.UserImplementation());
    gh.factory<_i24.AccountBloc>(
        () => _i24.AccountBloc(gh<_i22.UserServices>()));
    gh.factory<_i25.CommentBloc>(
        () => _i25.CommentBloc(gh<_i7.CommentServices>()));
    gh.factory<_i26.HashtagscreenBloc>(
        () => _i26.HashtagscreenBloc(gh<_i17.PostService>()));
    gh.factory<_i27.HomeBloc>(() => _i27.HomeBloc(gh<_i15.HomeServices>()));
    return this;
  }
}
