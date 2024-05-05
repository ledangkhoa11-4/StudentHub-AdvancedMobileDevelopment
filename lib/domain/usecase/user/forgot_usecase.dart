import '../../../core/domain/usecase/use_case.dart';
import '../../entity/user/user.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_usecase.g.dart';

@JsonSerializable()
class ForgotParams {
  final String email;

  ForgotParams({required this.email});

  factory ForgotParams.fromJson(Map<String, dynamic> json) =>
      _$ForgotParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotParamsToJson(this);
}

class ForgotUseCase implements UseCase<dynamic, ForgotParams> {
  final UserRepository _userRepository;

  ForgotUseCase(this._userRepository);

  @override
  Future<dynamic> call({required ForgotParams params}) async {
    return _userRepository.forgot(params);
  }
}