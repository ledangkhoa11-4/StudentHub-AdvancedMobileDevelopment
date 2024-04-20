import '../../../core/domain/usecase/use_case.dart';
import '../../entity/user/user.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_educatuon_usecase.g.dart';

@JsonSerializable()
class EducationParam {
  String schoolName;
  int startYear;
  int endYear;

  EducationParam({
    required this.schoolName,
    required this.startYear,
    required this.endYear,
  });

  factory EducationParam.fromJson(Map<String, dynamic> json) =>
      _$EducationParamFromJson(json);

  Map<String, dynamic> toJson() => _$EducationParamToJson(this);
}


@JsonSerializable()
class CreateEducationsParams {
  List<EducationParam> education;

  CreateEducationsParams({
    required this.education,
  });

  factory CreateEducationsParams.fromJson(Map<String, dynamic> json) => _$CreateEducationsParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateEducationsParamsToJson(this);
}

class CreateEducationUseCase implements UseCase<dynamic, CreateEducationsParams> {
  final UserRepository _userRepository;

  CreateEducationUseCase(this._userRepository);

  @override
  Future<dynamic> call({required CreateEducationsParams params}) async {
    return _userRepository.createEducations(params);
  }
}