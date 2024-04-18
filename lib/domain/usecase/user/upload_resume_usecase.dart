import 'package:boilerplate/domain/entity/user/tech_stack.dart';
import 'package:dio/dio.dart';
import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';



class UploadResumeUseCase implements UseCase<dynamic, FormData> {
  final UserRepository _userRepository;

  UploadResumeUseCase(this._userRepository);

  @override
  Future<dynamic> call({required FormData params}) async {

    return _userRepository.uploadResume(params);
  }
}