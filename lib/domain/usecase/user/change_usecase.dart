import '../../../core/domain/usecase/use_case.dart';
import '../../entity/user/user.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_usecase.g.dart';

@JsonSerializable()
class ChangeParams {
  final String oldPassword;
  final String newPassword;

  ChangeParams({required this.oldPassword, required this.newPassword});

  factory ChangeParams.fromJson(Map<String, dynamic> json) =>
      _$ChangeParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeParamsToJson(this);
}

class ChangeUseCase implements UseCase<dynamic, ChangeParams> {
  final UserRepository _userRepository;

  ChangeUseCase(this._userRepository);

  @override
  Future<dynamic> call({required ChangeParams params}) async {
    return _userRepository.change(params);
  }
}