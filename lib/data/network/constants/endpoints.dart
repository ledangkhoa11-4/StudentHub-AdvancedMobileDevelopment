class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://api.studenthub.dev";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";

  static const String signup = baseUrl + "/api/auth/sign-up";

  static const String signin = baseUrl + "/api/auth/sign-in";

  static const String getMe = baseUrl + "/api/auth/me";

  static const String change = baseUrl + "/api/user/changePassword";

  static const String forgot = baseUrl + "/api/user/forgotPassword";

  static const String postProject = baseUrl + "/api/project";

  static const String patchProject = baseUrl + "/api/project/:projectId";

  static const String createCompanyProfile = baseUrl + "/api/profile/company";

  static const String getCompanyProject = baseUrl + "/api/project/company";

  static const String createStudentProfile = baseUrl + "/api/profile/student";

  static const String getStudentProfile =
      baseUrl + "/api/profile/student/:studentId";

  static const String getAllTechstack =
      baseUrl + "/api/techstack/getAllTechStack";

  static const String getAllSkillset = baseUrl + "/api/skillset/getAllSkillSet";

  static const String uploadResume =
      baseUrl + "/api/profile/student/:studentId/resume";

  static const String uploadTranscript =
      baseUrl + "/api/profile/student/:studentId/transcript";

  static const String createLanguage =
      baseUrl + "/api/language/updateByStudentId/:studentId";

  static const String createEducation =
      baseUrl + "/api/education/updateByStudentId/:studentId";

  static const String createExperience =
      baseUrl + "/api/experience/updateByStudentId/:studentId";

  static const String getResumeFile =
      baseUrl + "/api/profile/student/:studentId/resume";

  static const String getTranscriptFile =
      baseUrl + "/api/profile/student/:studentId/transcript";

  static const String getAllProject = baseUrl + "/api/project";

  static const String patchFavorite =
      baseUrl + "/api/favoriteProject/:studentId";

  static const String submitProposal = baseUrl + "/api/proposal";

  static const String getSubmitProposal =
      baseUrl + "/api/proposal/project/:studentId";

  static const String updateProposal = baseUrl + "/api/proposal/:proposalId";

  static const String getAllChatByProjectId = baseUrl + "/api/message/:projectId";

  static const String getAllChatWithUserInProject = baseUrl + "/api/message/:projectId/user/:userId";

  static const String getAllChat = baseUrl + "/api/message";

}
