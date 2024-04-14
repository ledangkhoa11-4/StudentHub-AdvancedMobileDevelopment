class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://192.168.1.7";

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
}
