import '../../../core/domain/usecase/use_case.dart';
import '../../entity/user/user.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_experience_usecase.g.dart';

@JsonSerializable()
class ExperienceParam {
  String title;
  String startMonth;
  String endMonth;
  String description;
  List<int> skillSets;

  ExperienceParam({
    required this.title,
    required this.startMonth,
    required this.endMonth,
    required this.description,
    required this.skillSets,
  });

  factory ExperienceParam.fromJson(Map<String, dynamic> json) =>
      _$ExperienceParamFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceParamToJson(this);
}


@JsonSerializable()
class CreateExperiencesParams {
  List<ExperienceParam> experience;

  CreateExperiencesParams({
    required this.experience,
  });

  factory CreateExperiencesParams.fromJson(Map<String, dynamic> json) => _$CreateExperiencesParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateExperiencesParamsToJson(this);
}

class CreateExperiencesUseCase implements UseCase<dynamic, CreateExperiencesParams> {
  final UserRepository _userRepository;

  CreateExperiencesUseCase(this._userRepository);

  @override
  Future<dynamic> call({required CreateExperiencesParams params}) async {
    return _userRepository.createExperiences(params);
  }
}