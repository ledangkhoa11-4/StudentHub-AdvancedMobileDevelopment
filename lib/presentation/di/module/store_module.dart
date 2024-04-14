import 'dart:async';

import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/core/stores/form/form_company_profile_store.dart'
    as CompanyProfileFormStore;
import 'package:boilerplate/core/stores/form/form_post_project_store.dart'
    as PostProjectFromStore;
import 'package:boilerplate/core/stores/form/form_signin_store.dart'
    as SigninFromStore;
import 'package:boilerplate/core/stores/form/form_store.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';
import 'package:boilerplate/domain/repository/setting/setting_repository.dart';
import 'package:boilerplate/domain/usecase/post/get_post_usecase.dart';
import 'package:boilerplate/domain/usecase/project/get_project_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_me_usecase.dart';
import 'package:boilerplate/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:boilerplate/domain/usecase/user/login_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_auth_token_usercase.dart';
import 'package:boilerplate/domain/usecase/user/save_current_profile_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_login_in_status_usecase.dart';
import 'package:boilerplate/domain/usecase/user/signup_usecase.dart';
import 'package:boilerplate/presentation/home/store/language/language_store.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/post/store/post_store.dart';

import '../../../di/service_locator.dart';
import '../../post_project/store/post_project_store.dart';

mixin StoreModule {
  static Future<void> configureStoreModuleInjection() async {
    // factories:---------------------------------------------------------------
    getIt.registerFactory(() => ErrorStore());
    getIt.registerFactory(() => FormErrorStore());
    getIt.registerFactory(() => CompanyProfileFormStore.FormErrorStore());
    getIt.registerFactory(() => PostProjectFromStore.FormErrorStore());
    getIt.registerFactory(() => SigninFromStore.FormErrorStore());

    getIt.registerFactory(
      () => FormStore(getIt<FormErrorStore>(), getIt<ErrorStore>()),
    );
    getIt.registerFactory(
      () => CompanyProfileFormStore.FormCompanyProfileStore(
          getIt<CompanyProfileFormStore.FormErrorStore>(), getIt<ErrorStore>()),
    );
    getIt.registerFactory(
      () => PostProjectFromStore.FormPostProjectStore(
          getIt<PostProjectFromStore.FormErrorStore>(), getIt<ErrorStore>()),
    );

    getIt.registerFactory(
      () => SigninFromStore.FormSigninStore(
          getIt<SigninFromStore.FormErrorStore>(), getIt<ErrorStore>()),
    );

    // stores:------------------------------------------------------------------
    getIt.registerSingleton<UserStore>(
      UserStore(
          getIt<IsLoggedInUseCase>(),
          getIt<SaveLoginStatusUseCase>(),
          getIt<SaveAuthTokenUseCase>(),
          getIt<SaveCurrentProfileUseCase>(),
          getIt<LoginUseCase>(),
          getIt<SignupUseCase>(),
          getIt<FormErrorStore>(),
          getIt<ErrorStore>(),
          getIt<GetMeUseCase>()),
    );

    getIt.registerSingleton<PostStore>(
      PostStore(
        getIt<GetPostUseCase>(),
        getIt<ErrorStore>(),
      ),
    );

    getIt.registerSingleton<ThemeStore>(
      ThemeStore(
        getIt<SettingRepository>(),
        getIt<ErrorStore>(),
      ),
    );

    getIt.registerSingleton<LanguageStore>(
      LanguageStore(
        getIt<SettingRepository>(),
        getIt<ErrorStore>(),
      ),
    );

    getIt.registerSingleton<ProjectStore>(
      ProjectStore(getIt<GetProjectUseCase>(), getIt<ErrorStore>(),
          getIt<ProjectRepository>()),
    );
  }
}
