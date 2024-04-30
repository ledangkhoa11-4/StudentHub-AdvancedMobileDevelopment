import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

enum EMessageFlag {
  MESSAGE,
  INTERVIEW,
  UPDATE_INTERVIEW,
}

extension EMessageFlagType on EMessageFlag {
  int get value {
    switch (this) {
      case EMessageFlag.MESSAGE:
        return 0;
      case EMessageFlag.INTERVIEW:
        return 1;
      case EMessageFlag.UPDATE_INTERVIEW:
        return 2;
      default:
        return -1;
    }
  }

  String get eventName {
    switch (this) {
      case EMessageFlag.MESSAGE:
        return "SEND_MESSAGE";
      case EMessageFlag.INTERVIEW:
        return "SCHEDULE_INTERVIEW";
      case EMessageFlag.UPDATE_INTERVIEW:
        return "UPDATE_INTERVIEW";
      default:
        return "";
    }
  }
}

class SocketService {
  static Socket? socket;

  static connect(String token) {
    socket = IO.io(
        "https://api.studenthub.dev",
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket!.io.options?['extraHeaders'] = {
      'Authorization': 'Bearer ${token}',
    };
    socket!.connect();

    socket!.onConnect((data) => {
          print('Connected'),
        });

    socket!.onDisconnect((data) => {
          print('Disconnected'),
        });

    socket!.onConnectError((data) => print('CONNECT ERROR $data'));
    socket!.onError((data) => print(data));
  }

  static void connectWithQuery(int projectId, String token) {
    if (socket != null) {
      socket!.disconnect();
      socket = IO.io(
          "https://api.studenthub.dev",
          OptionBuilder()
              .setTransports(['websocket'])
              .disableAutoConnect()
              .build());
      socket!.io.options?['extraHeaders'] = {
        'Authorization': 'Bearer ${token}',
      };
      socket!.io.options?['query'] = {'project_id': projectId};
      socket!.connect();
      socket!.onConnect((data) => {
            print('Connected'),
          });

      socket!.onDisconnect((data) => {
            print('Disconnected'),
          });

      socket!.onConnectError((data) => print('CONNECT ERROR $data'));
      socket!.onError((data) => print(data));
    }
  }
}
