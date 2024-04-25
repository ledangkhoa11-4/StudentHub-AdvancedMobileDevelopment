import 'dart:async';

import 'package:boilerplate/domain/repository/post/post_repository.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';
import 'package:boilerplate/domain/repository/user/user_repository.dart';
import 'package:boilerplate/domain/usecase/post/delete_post_usecase.dart';
import 'package:boilerplate/domain/usecase/post/find_post_by_id_usecase.dart';
import 'package:boilerplate/domain/usecase/post/get_post_usecase.dart';
import 'package:boilerplate/domain/usecase/post/insert_post_usecase.dart';
import 'package:boilerplate/domain/usecase/post/udpate_post_usecase.dart';
import 'package:boilerplate/domain/usecase/project/get_submit_proposal_usecase.dart';
import 'package:boilerplate/domain/usecase/project/remove_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/get_all_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/get_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/update_favorite_project_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_educatuon_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_experience_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_language_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_update_company_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/create_update_student_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/get_me_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_profile_file_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_skillset_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_student_profile_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_techstack_usecase.dart';
import 'package:boilerplate/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:boilerplate/domain/usecase/user/login_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_auth_token_usercase.dart';
import 'package:boilerplate/domain/usecase/user/save_current_profile_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_login_in_status_usecase.dart';
import 'package:boilerplate/domain/usecase/user/signup_usecase.dart';
import 'package:boilerplate/domain/usecase/user/forgot_usecase.dart';
import 'package:boilerplate/domain/usecase/user/change_usecase.dart';
import 'package:boilerplate/domain/usecase/user/submit_proposal_usecase.dart';
import 'package:boilerplate/domain/usecase/user/update_proposal_usecase.dart';
import 'package:boilerplate/domain/usecase/user/upload_resume_usecase.dart';
import 'package:boilerplate/domain/usecase/user/upload_transcript_usecase.dart';

import '../../../di/service_locator.dart';
import '../../usecase/project/find_project_by_id_usecase.dart';
import '../../usecase/project/insert_project_usecase.dart';
import '../../usecase/project/update_project_usecase.dart';

mixin UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    // user:--------------------------------------------------------------------
    getIt.registerSingleton<IsLoggedInUseCase>(
      IsLoggedInUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<SaveLoginStatusUseCase>(
      SaveLoginStatusUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<SaveAuthTokenUseCase>(
      SaveAuthTokenUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<SaveCurrentProfileUseCase>(
      SaveCurrentProfileUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<SignupUseCase>(
      SignupUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<GetMeUseCase>(
      GetMeUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<CreateUpdateCompanyProfileUseCase>(
      CreateUpdateCompanyProfileUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<ForgotUseCase>(
      ForgotUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<ChangeUseCase>(
        ChangeUseCase(getIt<UserRepository>()));
    getIt.registerSingleton<GetTechStackUseCase>(
      GetTechStackUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<GetSkillSetUseCase>(
      GetSkillSetUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<UploadResumeUseCase>(
      UploadResumeUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<UploadTranscriptUseCase>(
      UploadTranscriptUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<CreateLanguageUseCase>(
      CreateLanguageUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<CreateEducationUseCase>(
      CreateEducationUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<CreateExperiencesUseCase>(
      CreateExperiencesUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<CreateUpdateStudentProfileUseCase>(
      CreateUpdateStudentProfileUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<GetProfileFileUseCase>(
      GetProfileFileUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<SubmitProposalUseCase>(
      SubmitProposalUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<GetStudentProfileUseCase>(
      GetStudentProfileUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<UpdateProposalUseCase>(
      UpdateProposalUseCase(getIt<UserRepository>()),
    );

    // post:--------------------------------------------------------------------
    getIt.registerSingleton<GetPostUseCase>(
      GetPostUseCase(getIt<PostRepository>()),
    );
    getIt.registerSingleton<FindPostByIdUseCase>(
      FindPostByIdUseCase(getIt<PostRepository>()),
    );
    getIt.registerSingleton<InsertPostUseCase>(
      InsertPostUseCase(getIt<PostRepository>()),
    );
    getIt.registerSingleton<UpdatePostUseCase>(
      UpdatePostUseCase(getIt<PostRepository>()),
    );
    getIt.registerSingleton<DeletePostUseCase>(
      DeletePostUseCase(getIt<PostRepository>()),
    );

    // Registering use cases related to the "project" domain
    getIt.registerSingleton<GetProjectUseCase>(
      GetProjectUseCase(getIt<ProjectRepository>()),
    );
    // getIt.registerSingleton<FindProjectByIdUseCase>(
    //   FindProjectByIdUseCase(getIt<ProjectRepository>()),
    // );
    getIt.registerSingleton<InsertProjectUseCase>(
      InsertProjectUseCase(getIt<ProjectRepository>()),
    );
    getIt.registerSingleton<UpdateProjectUseCase>(
      UpdateProjectUseCase(getIt<ProjectRepository>()),
    );
    getIt.registerSingleton<RemoveProjectUseCase>(
      RemoveProjectUseCase(getIt<ProjectRepository>()),
    );

    getIt.registerSingleton<GetAllProjectUseCase>(
      GetAllProjectUseCase(getIt<ProjectRepository>()),
    );

    getIt.registerSingleton<UpdateFavoriteProjectUseCase>(
      UpdateFavoriteProjectUseCase(getIt<ProjectRepository>()),
    );

    getIt.registerSingleton<GetSubmitProposalUseCase>(
      GetSubmitProposalUseCase(getIt<ProjectRepository>()),
    );
  }
}
