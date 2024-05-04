
import 'package:boilerplate/domain/entity/notification/notification.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_notification_usecase.g.dart';

@JsonSerializable()
class GetAllNotificationParams {
}

class GetAllNotificationsUseCase implements UseCase<List<AppNotification>, void> {
  final UserRepository _userRepository;

  GetAllNotificationsUseCase(this._userRepository);

  @override
  Future<List<AppNotification>> call({required params}) async {
    return _userRepository.getAllNotification();
  }
}