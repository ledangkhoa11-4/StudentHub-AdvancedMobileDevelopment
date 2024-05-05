import 'dart:math';

import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/chat/chat.dart';
import 'package:boilerplate/domain/entity/chat/chatUser.dart';
import 'package:boilerplate/domain/entity/interview/interview.dart';
import 'package:boilerplate/domain/entity/meeting_room/meeting_room.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/domain/usecase/user/check_room_available_usercase.dart';
import 'package:boilerplate/presentation/9_schedule_for_interview/components/shedule_bottom_sheet.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:boilerplate/presentation/video_call/video_conference.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/utils/socket/socket.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:uuid/uuid.dart';

class MessageDetail extends StatefulWidget {
  final int projectId;
  final int userId;
  final String userName;

  const MessageDetail(
      {super.key,
      required this.projectId,
      required this.userId,
      required this.userName});

  @override
  State<MessageDetail> createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  final UserStore _userStore = getIt<UserStore>();
  late types.User _user;

  @override
  void initState() {
    _userStore.setCurrentChat(widget.projectId, widget.userId);
    _user = types.User(
      id: "${_userStore.user!.id!}",
    );
    super.initState();
  }

  @override
  void dispose() {
    _userStore.setCurrentChat(_userStore.currentChatProjectId, null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeStore _themeStore = getIt<ThemeStore>();
    final currentProfile = getIt<SharedPreferenceHelper>().currentProfile;

    return Scaffold(
      appBar: UserAppBar.buildAppBar(context,
          titleWidget: Text("${widget.userName}")),
      body: Stack(
        children: [
          Observer(builder: (context) {
            if (_userStore.readChat != null) {
              if (_userStore.readChat!.projectId == widget.projectId &&
                  _userStore.readChat!.senderId == widget.userId) {
                _userStore.setReadChat(null, null);
              }
            }
            List<types.Message> _messages = [];
            _userStore.currentChat.forEach((chat) {
              final String type = chat.interview != null ? "custom" : "text";
              _messages.add(types.Message.fromJson(
                {
                  "author": {
                    "firstName": !chat.sender.fullname.isEmpty
                        ? chat.sender.fullname
                        : widget.userName,
                    "id": "${chat.sender.id}",
                    "lastName": "",
                    "imageUrl": currentProfile == UserRole.COMPANY.value
                        ? "https://i.imgur.com/ugcoGNH.png"
                        : "https://i.imgur.com/SR6SaqF.png",
                  },
                  "createdAt": chat.createdAt.millisecondsSinceEpoch,
                  "id": "${chat.id}",
                  "text": chat.content,
                  "type": type,
                  "metadata":
                      chat.interview != null ? chat.interview!.toJson() : null
                },
              ));
            });
            _messages = _messages.reversed.toList();
            return Chat(
              onAttachmentPressed: currentProfile == UserRole.COMPANY.value
                  ? () => _handleCreateMeeting(context)
                  : null,
              l10n: ChatL10nEn(
                  emptyChatPlaceholder: _userStore.isLoading
                      ? AppLocalizations.of(context).translate('loading')
                      : ""),
              messages: _messages,
              user: _user,
              onSendPressed: _handleSendPressed,
              showUserAvatars: true,
              showUserNames: true,
              theme: _themeStore.darkMode
                  ? const DarkChatTheme(
                      attachmentButtonIcon: Icon(
                        BootstrapIcons.camera_video,
                        color: Colors.white,
                      ),
                    )
                  : const DefaultChatTheme(
                      attachmentButtonIcon: Icon(
                        BootstrapIcons.camera_video,
                        color: Colors.white,
                      ),
                      seenIcon: Text(
                        'read',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ),
              customMessageBuilder: (p0, {required messageWidth}) {
                if (p0.metadata != null) {
                  final currentProfile =
                      getIt<SharedPreferenceHelper>().currentProfile;

                  final Interview interview = Interview.fromJson(p0.metadata!);
                  final bool isDeleted = interview.deletedAt != null || interview.disableFlag == 1 || Moment(interview.meetingRoom.expiredAt ?? interview.endTime).isPast;
                  final senderName =
                      p0.author.id == _userStore.user!.id!.toString()
                          ? AppLocalizations.of(context).translate('you')
                          : _userStore.user!.fullname!;
                  final Duration diff =
                      interview.endTime.difference(interview.startTime);
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "${senderName} ${AppLocalizations.of(context).translate('create_schedule')} ${interview.title}",
                          style: TextStyle(
                              color: p0.author.id ==
                                      _userStore.user!.id!.toString()
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.primary),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('time'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                    Expanded(
                                        child: Text(
                                            "${diff.toDurationString(format: DurationFormat.auto, form: Abbreviation.semi, dropPrefixOrSuffix: true)}",
                                            textAlign: TextAlign.right,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall)),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                    "${AppLocalizations.of(context).translate('start_time')}${Moment(interview.startTime).toLocal().formatDateTimeShort()}",
                                    style:
                                        Theme.of(context).textTheme.labelSmall),
                                Text(
                                    "${AppLocalizations.of(context).translate('end_time')}${Moment(interview.endTime).toLocal().formatDateTimeShort()}",
                                    style:
                                        Theme.of(context).textTheme.labelSmall),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: isDeleted
                                            ? ElevatedButton.styleFrom(
                                                backgroundColor: Colors.grey)
                                            : ElevatedButton.styleFrom(),
                                        onPressed: () {
                                          _onJoinMeeting(interview);
                                        },
                                        child: Text(
                                          isDeleted
                                              ? AppLocalizations.of(context)
                                                  .translate('cancelled')
                                              : AppLocalizations.of(context)
                                                  .translate('join'),
                                          style: isDeleted
                                              ? TextStyle(color: Colors.white)
                                              : TextStyle(),
                                        ),
                                      ),
                                    ),
                                    if (currentProfile ==
                                            UserRole.COMPANY.value &&
                                        !isDeleted)
                                      PopupMenuButton(
                                          icon: const Icon(BootstrapIcons
                                              .three_dots_vertical),
                                          itemBuilder: (context) {
                                            return <PopupMenuEntry>[
                                              PopupMenuItem(
                                                child: Text(AppLocalizations.of(
                                                        context)
                                                    .translate(
                                                        'resschedule_meeting')),
                                                onTap: () {
                                                  _handleEditMeeting(interview);
                                                },
                                              ),
                                              PopupMenuItem(
                                                child: Text(
                                                    AppLocalizations.of(context)
                                                        .translate(
                                                            'cancel_meeting')),
                                                onTap: () {
                                                  _handleDeleteMeeting(
                                                      context, interview);
                                                },
                                              ),
                                            ];
                                          })
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return Text("ERROR");
                }
              },
            );
          }),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isLoading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          ),
        ],
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final socket = SocketService.socket;
    if (socket != null) {
      _addMessage(message);

      socket.emit(EMessageFlag.MESSAGE.eventName, {
        "projectId": widget.projectId,
        "senderId": _userStore.user!.id,
        "receiverId": widget.userId,
        "messageFlag": EMessageFlag.MESSAGE.value,
        "content": message.text
      });
    } else {
      ToastHelper.error("Cannot connect to socket service");
    }
  }

  void _addMessage(types.PartialText message) {
    _userStore.addCurrentChat(ChatEntity(
        id: Random().nextInt(100) + _userStore.currentChat.length,
        createdAt: DateTime.now(),
        content: message.text,
        sender: ChatUser(
            id: _userStore.user!.id!, fullname: _userStore.user!.fullname!),
        receiver: ChatUser(id: widget.userId, fullname: "You")));
  }

  void _handleCreateMeeting(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ScheduleBottomSheet(
          onMeetingCreated: _emitMeetingCreated,
        );
      },
    );
  }

  void _handleDeleteMeeting(BuildContext context, Interview interviewDelete) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('This action cannot be reversed'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                final socket = SocketService.socket;
                if (socket != null) {
                  socket.emit(EMessageFlag.UPDATE_INTERVIEW.eventName, {
                    "projectId": widget.projectId,
                    "senderId": _userStore.user!.id,
                    "receiverId": widget.userId,
                    "interviewId": interviewDelete.id,
                    "deleteAction": true
                  });
                  ToastHelper.success(
                      AppLocalizations.of(context).translate('wait_delete'),
                      length: Toast.LENGTH_LONG);
                } else {
                  ToastHelper.error("Cannot connect to socket service");
                }
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            )
          ],
        );
      },
    );
  }

  void _emitMeetingCreated(String title, DateTime startTime, DateTime endTime) {
    final socket = SocketService.socket;
    if (socket != null) {
      socket.emit(EMessageFlag.INTERVIEW.eventName, {
        "projectId": widget.projectId,
        "senderId": _userStore.user!.id,
        "receiverId": widget.userId,
        "content": "Schedule meeting for $title",
        "title": title,
        "startTime": Moment(startTime).toUtc().toIso8601String(),
        "endTime": Moment(endTime).toUtc().toIso8601String(),
        "meeting_room_code": Uuid().v4(),
        "meeting_room_id": Uuid().v4()
      });
      ToastHelper.success(AppLocalizations.of(context).translate('wait_create'),
          length: Toast.LENGTH_LONG);
    } else {
      ToastHelper.error("Cannot connect to socket service");
    }
  }

  void _emitMeetingEdit(Interview interviewEdit, String title,
      DateTime startTime, DateTime endTime) {
    final socket = SocketService.socket;
    if (socket != null) {
      socket.emit(EMessageFlag.UPDATE_INTERVIEW.eventName, {
        "projectId": widget.projectId,
        "senderId": _userStore.user!.id,
        "receiverId": widget.userId,
        "interviewId": interviewEdit.id,
        "title": title,
        "startTime": Moment(startTime).toUtc().toIso8601String(),
        "endTime": Moment(endTime).toUtc().toIso8601String(),
        "updateAction": true
      });
      ToastHelper.success(AppLocalizations.of(context).translate('wait_edit'),
          length: Toast.LENGTH_LONG);
    } else {
      ToastHelper.error("Cannot connect to socket service");
    }
  }

  void _handleEditMeeting(Interview interviewEdit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ScheduleBottomSheet(
          interviewEdit: interviewEdit,
          onMeetingCreated:
              (String title, DateTime startTime, DateTime endTime) =>
                  _emitMeetingEdit(interviewEdit, title, startTime, endTime),
        );
      },
    );
  }

  void _onJoinMeeting(Interview interview) {
    _userStore
        .checkRoomAvailability(CheckRoomAvailabilityParams(
            meeting_room_code: interview.meetingRoom.meetingRoomCode,
            meeting_room_id: interview.meetingRoom.meetingRoomId))
        .then((value) {
      if (value == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return VideoConferencePage(
              conferenceID:
                  interview.meetingRoom.meetingRoomId.replaceAll("-", "_"),
              title: interview.title,
            );
          }),
        );
      } else {
        ToastHelper.error("Room not available");
      }
    });
  }
}
