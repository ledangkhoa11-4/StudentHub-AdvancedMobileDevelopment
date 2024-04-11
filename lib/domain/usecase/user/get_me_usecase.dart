import '../../../core/domain/usecase/use_case.dart';
import '../../entity/user/user.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_me_usecase.g.dart';

@JsonSerializable()
class GetMeParam {
 
}

class GetMeUseCase implements UseCase<dynamic, GetMeParam> {
  final UserRepository _userRepository;

  GetMeUseCase(this._userRepository);

  @override
  Future<User?> call({required GetMeParam params}) async {
    return _userRepository.getMe(params);
  }
}