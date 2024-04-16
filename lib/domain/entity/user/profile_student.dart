import 'package:boilerplate/domain/entity/language/Language.dart';
import 'package:boilerplate/domain/entity/user/education.dart';
import 'package:boilerplate/domain/entity/user/experience.dart';
import 'package:boilerplate/domain/entity/user/language.dart';
import 'package:boilerplate/domain/entity/user/skillset.dart';
import 'package:boilerplate/domain/entity/user/tech_stack.dart';

class ProfileStudent {
  int? id;
  int userId;
  int? stechStackId;
  TechStack? techStack;
  List<Skillset>? skillSets;
  String? resume;
  String? transcript;
  List<ProfileLanguage>? languages;
  List<Education>? educations;
  List<Experience>? experiences;

  ProfileStudent(
      {this.id,
      required this.userId,
      this.stechStackId,
      this.skillSets,
      this.resume,
      this.transcript,
      this.techStack,
      this.languages,
      this.educations,
      this.experiences});

  factory ProfileStudent.fromMap(Map<String, dynamic> json) {
    List<dynamic> skillSetsObj = json["skillSets"];
    final skillSets = skillSetsObj.map((e) => Skillset.fromJson(e)).toList();

    List<dynamic> educationsObj = json["educations"];
    final educations = educationsObj.map((e) => Education.fromJson(e)).toList();

    List<dynamic> languagesObj = json["languages"];
    final languages =
        languagesObj.map((e) => ProfileLanguage.fromJson(e)).toList();

    List<dynamic> experiencesObj = json["experiences"];
    final experiences =
        experiencesObj.map((e) => Experience.fromJson(e)).toList();

    return ProfileStudent(
        id: json["id"],
        userId: json["userId"],
        stechStackId: json["techStackId"],
        skillSets: skillSets,
        resume: json["resume"],
        techStack: TechStack.fromJson(json['techStack']),
        transcript: json["transcript"],
        languages: languages,
        educations: educations,
        experiences: experiences);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'stechStackId': stechStackId,
      'skillSets': skillSets != null
          ? skillSets!.map((skillset) => skillset.toJson()).toList()
          : null,
      'resume': resume,
      'transcript': transcript,
      'languages': languages != null
          ? languages!.map((language) => language.toJson()).toList()
          : null,
      'educations': educations != null
          ? educations!.map((education) => education.toJson()).toList()
          : null,
      'experiences': experiences != null
          ? experiences!.map((experience) => experience.toJson()).toList()
          : null,
    };
  }
}
