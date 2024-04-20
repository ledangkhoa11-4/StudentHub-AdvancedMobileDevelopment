import 'dart:async';

import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/core/stores/form/form_company_profile_store.dart'
    as CompanyProfileFormStore;
import 'package:boilerplate/core/stores/form/form_post_project_store.dart'
    as PostProjectFromStore;
import 'package:boilerplate/core/stores/form/form_signin_store.dart'
    as SigninFromStore;
import 'package:boilerplate/core/stores/form/form_forgot_store.dart'
    as ForgotFromStore;
import 'package:boilerplate/core/stores/form/form_changepass_store.dart'
    as ChangeFromStore;
import 'package:boilerplate/core/stores/form/form_student_profile_store.dart'
    as StudentProfileFormStore;
import 'package:boilerplate/core/stores/form/form_store.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';
import 'package:boilerplate/domain/repository/setting/setting_repository.dart';
import 'package:boilerplate/domain/usecase/post/get_post_usecase.dart';
import 'package:boilerplate/domain/usecase/project/get_all_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/get_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/insert_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/update_favorite_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/update_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/remove_project_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_educatuon_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_experience_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_language_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_update_company_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/forgot_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_me_usecase.dart';
import 'package:boilerplate/domain/usecase/user/change_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_update_student_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/get_profile_file_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_skillset_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_techstack_usecase.dart';
import 'package:boilerplate/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:boilerplate/domain/usecase/user/login_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_auth_token_usercase.dart';
import 'package:boilerplate/domain/usecase/user/save_current_profile_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_login_in_status_usecase.dart';
import 'package:boilerplate/domain/usecase/user/signup_usecase.dart';
import 'package:boilerplate/domain/usecase/user/upload_resume_usecase.dart';
import 'package:boilerplate/domain/usecase/user/upload_transcript_usecase.dart';
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
    getIt.registerFactory(() => StudentProfileFormStore.FormErrorStore());
    getIt.registerFactory(() => PostProjectFromStore.FormErrorStore());
    getIt.registerFactory(() => SigninFromStore.FormErrorStore());
    getIt.registerFactory(() => ForgotFromStore.FormErrorStore());
    getIt.registerFactory(() => ChangeFromStore.FormErrorStore());

    getIt.registerFactory(
      () => FormStore(getIt<FormErrorStore>(), getIt<ErrorStore>()),
    );
    getIt.registerFactory(
      () => CompanyProfileFormStore.FormCompanyProfileStore(
          getIt<CompanyProfileFormStore.FormErrorStore>(), getIt<ErrorStore>()),
    );

    getIt.registerFactory(
      () => StudentProfileFormStore.FormStudentProfileStore(
          getIt<StudentProfileFormStore.FormErrorStore>(), getIt<ErrorStore>()),
    );
    getIt.registerFactory(
      () => PostProjectFromStore.FormPostProjectStore(
          getIt<PostProjectFromStore.FormErrorStore>(), getIt<ErrorStore>()),
    );

    getIt.registerFactory(
      () => SigninFromStore.FormSigninStore(
          getIt<SigninFromStore.FormErrorStore>(), getIt<ErrorStore>()),
    );

    getIt.registerFactory(
      () => ForgotFromStore.FormForgotStore(
          getIt<ForgotFromStore.FormErrorStore>(), getIt<ErrorStore>()),
    );
    getIt.registerFactory(
      () => ChangeFromStore.FormChangeStore(
          getIt<ChangeFromStore.FormErrorStore>(), getIt<ErrorStore>()),
    );

    // stores:------------------------------------------------------------------
    getIt.registerSingleton<UserStore>(
      UserStore(
        getIt<IsLoggedInUseCase>(),
        getIt<SaveLoginStatusUseCase>(),
        getIt<SaveAuthTokenUseCase>(),
        getIt<SaveCurrentProfileUseCase>(),
        getIt<LoginUseCase>(),
        getIt<ChangeUseCase>(),
        getIt<ForgotUseCase>(),
        getIt<SignupUseCase>(),
        getIt<FormErrorStore>(),
        getIt<ErrorStore>(),
        getIt<GetMeUseCase>(),
        getIt<CreateUpdateCompanyProfileUseCase>(),
        getIt<GetTechStackUseCase>(),
        getIt<GetSkillSetUseCase>(),
        getIt<UploadResumeUseCase>(),
        getIt<UploadTranscriptUseCase>(),
        getIt<CreateLanguageUseCase>(),
        getIt<CreateEducationUseCase>(),
        getIt<CreateExperiencesUseCase>(),
        getIt<CreateUpdateStudentProfileUseCase>(),
        getIt<GetProfileFileUseCase>(),
      ),
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
      ProjectStore(
          getIt<GetProjectUseCase>(),
          getIt<InsertProjectUseCase>(),
          getIt<ErrorStore>(),
          getIt<ProjectRepository>(),
          getIt<GetAllProjectUseCase>(),
          getIt<UpdateProjectUseCase>(),
          getIt<RemoveProjectUseCase>(),
          getIt<UpdateFavoriteProjectUseCase>()),
    );
  }
}
