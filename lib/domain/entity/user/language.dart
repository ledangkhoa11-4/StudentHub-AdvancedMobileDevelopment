class ProfileLanguage {
  int? id;
  String languageName;
  String level;

  ProfileLanguage({
    this.id,
    required this.languageName,
    required this.level,
  });

  factory ProfileLanguage.fromJson(Map<String, dynamic> json) {
    return ProfileLanguage(
      id: json['id'],
      languageName: json['languageName'],
      level: json['level'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['languageName'] = this.languageName;
    data['level'] = this.level;
    return data;
  }
}
