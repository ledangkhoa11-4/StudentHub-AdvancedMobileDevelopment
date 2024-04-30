// Flutter imports:

import 'package:flutter/material.dart';

// Package imports:
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

import 'const.dart';

// Project imports:

class VideoConferencePage extends StatefulWidget {
  final String conferenceID;

  const VideoConferencePage({
    super.key,
    required this.conferenceID,
  });

  @override
  State<StatefulWidget> createState() => VideoConferencePageState();
}

class VideoConferencePageState extends State<VideoConferencePage> {
  final controller = ZegoUIKitPrebuiltVideoConferenceController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: 1913282325,
        appSign:
            "8f09796184ed6a1c74005b54f19cacde780cd4dbde7f0a763f6ef528e7702699",
        conferenceID: widget.conferenceID,
        userID: localUserID,
        userName: "user_$localUserID",
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
        // config: ZegoUIKitPrebuiltVideoConferenceConfig(
        //   turnOnCameraWhenJoining: false,
        //   audioVideoViewConfig:
        //       ZegoPrebuiltAudioVideoViewConfig(showCameraStateOnView: false),
        //   topMenuBarConfig: ZegoTopMenuBarConfig(
        //     buttons: [ZegoMenuBarButtonName.showMemberListButton],
        //   ),
        //   bottomMenuBarConfig: ZegoBottomMenuBarConfig(
        //     buttons: [
        //       ZegoMenuBarButtonName.toggleMicrophoneButton,
        //       ZegoMenuBarButtonName.leaveButton,
        //       ZegoMenuBarButtonName.switchAudioOutputButton,
        //     ],
        //   ),
        //   avatarBuilder: (BuildContext context, Size size,
        //       ZegoUIKitUser? user, Map extraInfo) {
        //     return user != null
        //         ? Container(
        //             decoration: const BoxDecoration(
        //               shape: BoxShape.circle,
        //               image: DecorationImage(
        //                 image: NetworkImage(
        //                   'https://media.istockphoto.com/id/1302783988/vector/the-embarrassed-man.jpg?s=612x612&w=0&k=20&c=bIPvdEHEGAP0RnSH5n45dvHfsqvZKv8NwG5qjRWCNTg=',
        //                 ),
        //               ),
        //             ),
        //           )
        //         : const SizedBox();
        //   },
        // )
      ),
    );
  }
}
