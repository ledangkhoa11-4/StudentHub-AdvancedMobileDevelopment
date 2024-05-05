import 'package:boilerplate/domain/entity/user/skillset.dart';
import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_skillset_usecase.g.dart';

@JsonSerializable()
class GetSkillSetParams {
 
}

class GetSkillSetUseCase implements UseCase<dynamic, GetSkillSetParams> {
  final UserRepository _userRepository;

  GetSkillSetUseCase(this._userRepository);

  @override
  Future<List<Skillset>?> call({required GetSkillSetParams params}) async {
    return _userRepository.getSkillSet(params);
  }
}