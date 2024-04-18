import 'package:boilerplate/domain/entity/user/skillset.dart';

class Experience {
  int? id;
  String title;
  String startMonth;
  String endMonth;
  String description;
  List<Skillset> skillSets;

  Experience({
    this.id,
    required this.title,
    required this.startMonth,
    required this.endMonth,
    required this.description,
    required this.skillSets,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    List<dynamic> skillSetsObj = json["skillSets"];
    final skillSets = skillSetsObj.map((e) => Skillset.fromJson(e)).toList();

    return Experience(
      id: json['id'],
      title: json['title'],
      startMonth: json['startMonth'],
      endMonth: json['startMonth'],
      description: json['description'],
      skillSets: skillSets,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['startMonth'] = this.startMonth;
    data['endMonth'] = this.endMonth;
    data['description'] = this.description;
    data['skillSets'] = this.skillSets;
    return data;
  }
}
