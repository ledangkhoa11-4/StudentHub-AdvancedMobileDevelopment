class Education {
  int? id;
  String schoolName;
  int startYear;
  int endYear;

  Education({
    this.id,
    required this.schoolName,
    required this.startYear,
    required this.endYear,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      id: json['id'],
      schoolName: json['schoolName'],
      startYear: json['startYear'],
      endYear: json['endYear'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['schoolName'] = this.schoolName;
    data['startYear'] = this.startYear;
    data['endYear'] = this.endYear;
    return data;
  }
}
