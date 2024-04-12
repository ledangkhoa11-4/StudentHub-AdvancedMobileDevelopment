import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';

class SaveCurrentProfileUseCase implements UseCase<void, int> {
  final UserRepository _userRepository;

  SaveCurrentProfileUseCase(this._userRepository);

  @override
  Future<void> call({required int params}) async {
    return _userRepository.saveCurrentProfile(params);
  }
}