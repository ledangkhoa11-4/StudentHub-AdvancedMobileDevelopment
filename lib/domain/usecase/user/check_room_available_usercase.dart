import 'package:boilerplate/domain/entity/chat/chat.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_room_available_usercase.g.dart';

@JsonSerializable()
class CheckRoomAvailabilityParams {
  final String meeting_room_code ;
  final String meeting_room_id ;

  CheckRoomAvailabilityParams({required this.meeting_room_code, required this.meeting_room_id});

  factory CheckRoomAvailabilityParams.fromJson(Map<String, dynamic> json) =>
      _$CheckRoomAvailabilityParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CheckRoomAvailabilityParamsToJson(this);
}

class CheckRoomAvailabilityUseCase implements UseCase<bool, CheckRoomAvailabilityParams> {
  final UserRepository _userRepository;

  CheckRoomAvailabilityUseCase(this._userRepository);

  @override
  Future<bool> call({required CheckRoomAvailabilityParams params}) async {
    return _userRepository.checkRoomAvailability(params);
  }
}