// Flutter imports:

import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/interview/interview.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class VideoConferencePage extends StatefulWidget {
  final String conferenceID;
  final String title;

  const VideoConferencePage({
    super.key,
    required this.conferenceID,
    required this.title,
  });

  @override
  State<StatefulWidget> createState() => VideoConferencePageState();
}

class VideoConferencePageState extends State<VideoConferencePage> {
  final controller = ZegoUIKitPrebuiltVideoConferenceController();
  final UserStore _userStore = getIt<UserStore>();
  final currentProfile = getIt<SharedPreferenceHelper>().currentProfile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: 1945694952, // 1913282325,
        appSign:
            "288448230ee26f3f7c0f986dc1cbec9d62bd01f5b58066f883d7d3012c11c069",
        // "8f09796184ed6a1c74005b54f19cacde780cd4dbde7f0a763f6ef528e7702699",
        conferenceID: widget.conferenceID,
        userID: "${_userStore.user!.id}",
        userName: "${_userStore.user!.fullname}",
        config: ZegoUIKitPrebuiltVideoConferenceConfig(
          turnOnCameraWhenJoining: false,
          topMenuBarConfig:
              ZegoTopMenuBarConfig(title: "Meeting for ${widget.title}"),
          avatarBuilder: (BuildContext context, Size size, ZegoUIKitUser? user,
              Map extraInfo) {
            return user != null
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            user.id == _userStore.user!.id!.toString()
                                ? currentProfile == UserRole.COMPANY.value
                                    ? "https://i.imgur.com/SR6SaqF.png"
                                    : "https://i.imgur.com/ugcoGNH.png"
                                : currentProfile == UserRole.COMPANY.value
                                    ? "https://i.imgur.com/ugcoGNH.png"
                                    : "https://i.imgur.com/SR6SaqF.png"),
                      ),
                    ),
                  )
                : const SizedBox();
          },
        ),
      ),
    );
  }
}
