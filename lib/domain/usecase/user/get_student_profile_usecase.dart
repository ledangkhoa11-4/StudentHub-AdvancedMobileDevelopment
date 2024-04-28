import 'package:boilerplate/domain/entity/user/profile_student.dart';
import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_student_profile_usecase.g.dart';

@JsonSerializable()
class GetStudentProfileParams {
  int? studentId;

  GetStudentProfileParams({
    required this.studentId,
  });

  factory GetStudentProfileParams.fromJson(Map<String, dynamic> json) =>
      _$GetStudentProfileParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetStudentProfileParamsToJson(this);
}

class GetStudentProfileUseCase
    implements UseCase<dynamic, GetStudentProfileParams> {
  final UserRepository _userRepository;

  GetStudentProfileUseCase(this._userRepository);

  @override
  Future<ProfileStudent?> call(
      {required GetStudentProfileParams params}) async {
    return _userRepository.getStudentProfile(params);
  }
}
