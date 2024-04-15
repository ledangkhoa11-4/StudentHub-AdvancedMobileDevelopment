class Skillset {
  int id;
  String name;

  Skillset({
    required this.id,
    required this.name,
  });

  factory Skillset.fromJson(Map<String, dynamic> json) {
    return Skillset(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}