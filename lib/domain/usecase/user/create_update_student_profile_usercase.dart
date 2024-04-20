import 'package:boilerplate/domain/entity/user/profile_company.dart';
import 'package:boilerplate/domain/entity/user/profile_student.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../entity/user/user.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_update_student_profile_usercase.g.dart';

@JsonSerializable()
class CreateUpdateStudentProfileParams {
  final int? uid;
  final int techStackId;
  final List<int> skillSets;

  CreateUpdateStudentProfileParams(
      {this.uid = null,
      required this.techStackId,
      required this.skillSets});

  factory CreateUpdateStudentProfileParams.fromJson(Map<String, dynamic> json) =>
      _$CreateUpdateStudentProfileParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUpdateStudentProfileParamsToJson(this);
}

class CreateUpdateStudentProfileUseCase
    implements UseCase<dynamic, CreateUpdateStudentProfileParams> {
  final UserRepository _userRepository;

  CreateUpdateStudentProfileUseCase(this._userRepository);

  @override
  Future<ProfileStudent?> call(
      {required CreateUpdateStudentProfileParams params}) async {
    return _userRepository.createUpdateStudentProfile(params);
  }
}
