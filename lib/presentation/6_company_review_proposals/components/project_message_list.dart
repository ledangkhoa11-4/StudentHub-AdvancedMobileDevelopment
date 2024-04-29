import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/message/components/conversation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moment_dart/moment_dart.dart';

class ProjectMessageList extends StatefulWidget {
  @override
  State<ProjectMessageList> createState() => _ProjectMessageListState();
}

class _ProjectMessageListState extends State<ProjectMessageList> {
  final UserStore _userStore = getIt<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: _userStore.chatList.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 16),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final chat = _userStore.chatList[index];
              return ConversationList(
                name: chat.sender.id == _userStore.user!.id
                    ? chat.receiver.fullname
                    : chat.sender.fullname,
                messageText: chat.sender.id == _userStore.user!.id
                    ? "You: ${chat.content}"
                    : chat.content,
                imageUrl: "https://i.imgur.com/ugcoGNH.png",
                time: "${Moment(chat.createdAt).fromNow()}",
                isMessageRead: false,
                projectId: _userStore.currentChatProjectId!,
                userId: chat.sender.id == _userStore.user!.id
                    ? chat.receiver.id
                    : chat.sender.id,
              );
            },
          );
        }
      ),
    ));
  }
}
