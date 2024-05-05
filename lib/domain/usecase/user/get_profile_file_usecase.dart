import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_profile_file_usecase.g.dart';


@JsonSerializable()
class GetProfileFileParams {
  final int studentId;
  final String type;

  GetProfileFileParams({
    required this.studentId,
    required this.type,
  });

  factory GetProfileFileParams.fromJson(
          Map<String, dynamic> json) =>
      _$GetProfileFileParamsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetProfileFileParamsToJson(this);
}

class GetProfileFileUseCase
    implements UseCase<dynamic, GetProfileFileParams> {
  final UserRepository _userRepository;

  GetProfileFileUseCase(this._userRepository);

  @override
  Future<String?> call(
      {required GetProfileFileParams params}) async {
    return _userRepository.getProfileFile(params);
  }
}
