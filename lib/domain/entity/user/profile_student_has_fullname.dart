import 'package:boilerplate/domain/entity/language/Language.dart';
import 'package:boilerplate/domain/entity/user/education.dart';
import 'package:boilerplate/domain/entity/user/experience.dart';
import 'package:boilerplate/domain/entity/user/language.dart';
import 'package:boilerplate/domain/entity/user/skillset.dart';
import 'package:boilerplate/domain/entity/user/tech_stack.dart';

class ProfileStudentHasFullName {
  int? id;
  int userId;
  int? techStackId;
  String? resume;
  String? transcript;
  TechStack? techStack;
  List<ProfileLanguage>? languages;
  List<Education>? educations;
  List<Experience>? experiences;
  String? fullname; // Added fullname field

  ProfileStudentHasFullName({
    this.id,
    required this.userId,
    this.techStackId,
    this.resume,
    this.transcript,
    this.techStack,
    this.languages,
    this.educations,
    this.experiences,
    this.fullname,
  });

  factory ProfileStudentHasFullName.fromMap(Map<String, dynamic> json) {
    final student = json["student"] as Map<String, dynamic>;
    final user = student["user"] as Map<String, dynamic>;
    List<dynamic> languagesObj =
        json["languages"] != null ? json["languages"] : [];
    final languages =
        languagesObj.map((e) => ProfileLanguage.fromJson(e)).toList();

    List<dynamic> educationsObj =
        json["educations"] != null ? json["educations"] : [];
    final educations = educationsObj.map((e) => Education.fromJson(e)).toList();

    List<dynamic> experiencesObj =
        json["experiences"] != null ? json["experiences"] : [];
    final experiences =
        experiencesObj.map((e) => Experience.fromJson(e)).toList();

    return ProfileStudentHasFullName(
      id: json["id"],
      userId: json["userId"],
      techStackId: json["techStackId"],
      resume: json["resume"],
      transcript: json["transcript"],
      techStack: TechStack.fromJson(json['techStack']),
      languages: languages,
      educations: educations,
      experiences: experiences,
      fullname: user["fullname"], // Extracted fullname from nested user object
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'techStackId': techStackId,
      'resume': resume,
      'transcript': transcript,
      'techStack': techStack?.toJson(),
      'languages': languages != null
          ? languages!.map((language) => language.toJson()).toList()
          : null,
      'educations': educations != null
          ? educations!.map((education) => education.toJson()).toList()
          : null,
      'experiences': experiences != null
          ? experiences!.map((experience) => experience.toJson()).toList()
          : null,
      'fullname': fullname, // Added fullname field to JSON
    };
  }
}
