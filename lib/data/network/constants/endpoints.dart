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

  static const String postProject = baseUrl + "/api/project";

  static const String createCompanyProfile = baseUrl + "/api/profile/company";

  static const String getCompanyProject = baseUrl + "/api/project/company/111";
}
