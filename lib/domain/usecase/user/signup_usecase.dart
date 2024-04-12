import '../../../core/domain/usecase/use_case.dart';
import '../../entity/user/user.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_usecase.g.dart';

@JsonSerializable()
class SignupParam {
  final String fullname;
  final String email;
  final String password;
  final int role;

  SignupParam({required this.fullname, required this.email, required this.password, required this.role});

  factory SignupParam.fromJson(Map<String, dynamic> json) =>
      _$SignupParamFromJson(json);

  Map<String, dynamic> toJson() => _$SignupParamToJson(this);
}

class SignupUseCase implements UseCase<dynamic, SignupParam> {
  final UserRepository _userRepository;

  SignupUseCase(this._userRepository);

  @override
  Future<dynamic> call({required SignupParam params}) async {
    return _userRepository.signup(params);
  }
}