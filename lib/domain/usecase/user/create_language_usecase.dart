import '../../../core/domain/usecase/use_case.dart';
import '../../entity/user/user.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_language_usecase.g.dart';

@JsonSerializable()
class LanguageParams {
  String languageName;
  String level;

  LanguageParams({
    required this.languageName,
    required this.level,
  });

  factory LanguageParams.fromJson(Map<String, dynamic> json) =>
      _$LanguageParamsFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageParamsToJson(this);
}


@JsonSerializable()
class CreateLanguageParams {
  List<LanguageParams> languages;

  CreateLanguageParams({
    required this.languages,
  });

  factory CreateLanguageParams.fromJson(Map<String, dynamic> json) => _$CreateLanguageParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateLanguageParamsToJson(this);
}

class CreateLanguageUseCase implements UseCase<dynamic, CreateLanguageParams> {
  final UserRepository _userRepository;

  CreateLanguageUseCase(this._userRepository);

  @override
  Future<dynamic> call({required CreateLanguageParams params}) async {
    return _userRepository.createLanguages(params);
  }
}