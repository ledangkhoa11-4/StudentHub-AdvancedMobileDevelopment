import 'package:boilerplate/domain/entity/user/profile_company.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../entity/user/user.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_update_company_profile_usercase.g.dart';

@JsonSerializable()
class CreateUpdateCompanyProfileParams {
  final int? uid;
  final String companyName;
  final String website;
  final String description;
  final int size;

  CreateUpdateCompanyProfileParams(
      {this.uid = null,
      required this.companyName,
      required this.website,
      required this.description,
      required this.size});

  factory CreateUpdateCompanyProfileParams.fromJson(Map<String, dynamic> json) =>
      _$CreateUpdateCompanyProfileParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUpdateCompanyProfileParamsToJson(this);
}

class CreateUpdateCompanyProfileUseCase
    implements UseCase<dynamic, CreateUpdateCompanyProfileParams> {
  final UserRepository _userRepository;

  CreateUpdateCompanyProfileUseCase(this._userRepository);

  @override
  Future<ProfileCompany?> call(
      {required CreateUpdateCompanyProfileParams params}) async {
    return _userRepository.createUpdateCompanyProfile(params);
  }
}
