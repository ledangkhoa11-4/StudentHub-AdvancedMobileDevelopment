import 'package:boilerplate/domain/entity/user/tech_stack.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../entity/user/user.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_techstack_usecase.g.dart';

@JsonSerializable()
class GetTechStackParams {
 
}

class GetTechStackUseCase implements UseCase<dynamic, GetTechStackParams> {
  final UserRepository _userRepository;

  GetTechStackUseCase(this._userRepository);

  @override
  Future<List<TechStack>?> call({required GetTechStackParams params}) async {
    return _userRepository.getTechstack(params);
  }
}