enum EProfileCompanySize { JUST_ME, SMALL, MEDIUM, LARGE, VERY_LARGE }

class CompanySizeItem {
  final int value;
  final String title;

  CompanySizeItem({required this.title, required this.value});
}

extension EProfileCompanySizeExtension on EProfileCompanySize {
  int get value {
    switch (this) {
      case EProfileCompanySize.JUST_ME:
        return 0;
      case EProfileCompanySize.SMALL:
        return 1;
      case EProfileCompanySize.MEDIUM:
        return 2;
      case EProfileCompanySize.LARGE:
        return 3;
      case EProfileCompanySize.VERY_LARGE:
        return 4;
      default:
        return -1;
    }
  }
}

final CompanySizeList = [
  CompanySizeItem(
      title: "It's just me", value: EProfileCompanySize.JUST_ME.value),
  CompanySizeItem(
      title: "2-9 employees", value: EProfileCompanySize.SMALL.value),
  CompanySizeItem(
      title: "10-99 employees", value: EProfileCompanySize.MEDIUM.value),
  CompanySizeItem(
      title: "100-1000 employees", value: EProfileCompanySize.LARGE.value),
  CompanySizeItem(
      title: "More than 1000 employees",
      value: EProfileCompanySize.VERY_LARGE.value),
];

class ProfileCompany {
  int? id;
  int userId;
  String companyName;
  String website;
  String description;
  int size;

  ProfileCompany(
      {this.id,
      required this.userId,
      required this.companyName,
      required this.website,
      required this.description,
      required this.size});

  factory ProfileCompany.fromMap(Map<String, dynamic> json) {
    return ProfileCompany(
      id: json["id"],
      userId: json["userId"],
      companyName: json["companyName"],
      website: json["website"],
      description: json["description"],
      size: json["size"],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "companyName": companyName,
        "website": website,
        "description": description,
        "size": size,
      };
}
