import 'dart:math';

import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/chat/chat.dart';
import 'package:boilerplate/domain/entity/chat/chatUser.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:boilerplate/utils/socket/socket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_mobx/flutter_mobx.dart';

class MessageDetail extends StatefulWidget {
  final int projectId;
  final int userId;
  final String userName;

  const MessageDetail(
      {super.key, required this.projectId, required this.userId, required this.userName});

  @override
  State<MessageDetail> createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  final UserStore _userStore = getIt<UserStore>();
  List<types.Message> _messages = [];
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

    return Scaffold(
      appBar: UserAppBar.buildAppBar(context, titleWidget: Text("${widget.userName}")),
      body: Stack(
        children: [
          Observer(
            builder: (context) {
              return Chat(
                l10n: ChatL10nEn(emptyChatPlaceholder: _userStore.isLoading ? 'Loading...' : _userStore.currentChat.length > 0 ? "" : "No message"
                  
                ),
                messages: _messages,
                user: _user,
                onSendPressed: _handleSendPressed,
                showUserAvatars: true,
                showUserNames: true,
                theme: _themeStore.darkMode ? const DarkChatTheme() : const DefaultChatTheme(
                  seenIcon: Text(
                    'read',
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                ),
              );
            }
          ),
          Observer(
            builder: (context) {
              return !_userStore.isLoading && _userStore.currentChat.length > 0
                  ? setChatBubble(_userStore.currentChat)
                  : SizedBox.shrink();
            },
          ),
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

  Widget setChatBubble(List<ChatEntity> chats) {
    final currentProfile = getIt<SharedPreferenceHelper>().currentProfile;
    List<types.Message> newChats = [];
    chats.forEach((chat) {
      newChats.add(types.Message.fromJson(
        {
          "author": {
            "firstName": !chat.sender.fullname.isEmpty ? chat.sender.fullname : widget.userName,
            "id": "${chat.sender.id}",
            "lastName": "",
            "imageUrl": currentProfile == UserRole.COMPANY.value
                ? "https://i.imgur.com/ugcoGNH.png"
                : "https://i.imgur.com/SR6SaqF.png",
          },
          "createdAt": chat.createdAt.millisecondsSinceEpoch,
          "id": "${chat.id}",
          "text": chat.content,
          "type": "text"
        },
      ));
    });
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {
        _messages = newChats.reversed.toList();
      });
    });

    return SizedBox.shrink();
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
}
