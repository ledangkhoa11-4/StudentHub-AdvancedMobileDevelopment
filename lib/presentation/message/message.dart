import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/chat/chat.dart';
import 'package:boilerplate/domain/entity/chat/chatUser.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/message/components/conversation_list.dart';
import 'package:boilerplate/presentation/navigation_bar/navigation_bar.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moment_dart/moment_dart.dart';

class MessageScreen extends StatefulWidget {
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final UserStore _userStore = getIt<UserStore>();
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    if (_userStore.allChatList == null) {
      _userStore.getAllChatList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(
        context,
        titleWidget: Text(AppLocalizations.of(context).translate('message')),
      ),
      bottomNavigationBar:
          UserNavigationBar.buildNavigationBar(context, setState: setState),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText:
                          AppLocalizations.of(context).translate('search'),
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                    ),
                  ),
                ),
                Observer(builder: (context) {
                  final Set<int> groupProject = _userStore.allChatList != null
                      ? _userStore.allChatList!
                          .where((chat) => chat.project != null)
                          .map((chat) => chat.project!.id!)
                          .toSet()
                      : Set.of([]);

                  final filteredChats = _userStore.allChatList != null
                      ? _userStore.allChatList!
                          .where((chat) =>
                              // chat.sender.fullname.toLowerCase().contains(
                              //     (_searchController.text ?? '')
                              //         .toLowerCase()) ||
                              chat.receiver.fullname.toLowerCase().contains(
                                  (_searchController.text ?? '').toLowerCase()))
                          .toList()
                      : <ChatEntity>[];

                  if (filteredChats.isEmpty) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        "No chat found",
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  if (_searchController.text == "") {
                    return Column(
                      children: [
                        ...groupProject.map((id) {
                          final project = _userStore.allChatList!
                              .firstWhere((chat) => chat.project?.id == id)
                              .project;
                          return ExpansionTile(
                            initiallyExpanded: true,
                            leading: Icon(BootstrapIcons.kanban),
                            collapsedShape: RoundedRectangleBorder(
                              side: BorderSide.none,
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                            ),
                            title: Text(
                              "${AppLocalizations.of(context).translate('project')} ${project != null ? project.title : "N/A"}",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            children: [
                              Observer(builder: (context) {
                                final currentProfile =
                                    getIt<SharedPreferenceHelper>()
                                        .currentProfile;
                                final chatsInProject = _userStore.allChatList!
                                    .where((chat) => chat.project?.id == id)
                                    .toList();
                                return ListView.builder(
                                  itemCount: chatsInProject.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final chat = chatsInProject[index];
                                    return ConversationList(
                                      name:
                                          chat.sender.id == _userStore.user!.id
                                              ? chat.receiver.fullname
                                              : chat.sender.fullname,
                                      messageText: chat.sender.id ==
                                              _userStore.user!.id
                                          ? "${AppLocalizations.of(context).translate('you')}: ${chat.content}"
                                          : chat.content,
                                      imageUrl: currentProfile ==
                                              UserRole.COMPANY.value
                                          ? "https://i.imgur.com/ugcoGNH.png"
                                          : "https://i.imgur.com/SR6SaqF.png",
                                      time:
                                          "${Moment(chat.createdAt).fromNow()}",
                                      isMessageRead: false,
                                      projectId: chat.project!.id!,
                                      userId:
                                          chat.sender.id == _userStore.user!.id
                                              ? chat.receiver.id
                                              : chat.sender.id,
                                    );
                                  },
                                );
                              })
                            ],
                          );
                        }).toList(),
                      ],
                    );
                  } else {
                    // PHONG ----------------------------------------------------------------------
                    // final currentProfile =
                    //     getIt<SharedPreferenceHelper>().currentProfile;
                    // return ListView.builder(
                    //   itemCount: filteredChats.length,
                    //   shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   itemBuilder: (context, index) {
                    //     final chat = filteredChats[index];
                    //     return ConversationList(
                    //       name: chat.sender.id == _userStore.user!.id
                    //           ? chat.receiver.fullname
                    //           : chat.sender.fullname,
                    //       messageText: chat.sender.id == _userStore.user!.id
                    //           ? "${AppLocalizations.of(context).translate('you')}: ${chat.content}"
                    //           : chat.content,
                    //       imageUrl: currentProfile == UserRole.COMPANY.value
                    //           ? "https://i.imgur.com/ugcoGNH.png"
                    //           : "https://i.imgur.com/SR6SaqF.png",
                    //       time: "${Moment(chat.createdAt).fromNow()}",
                    //       isMessageRead: false,
                    //       projectId: chat.project!.id!,
                    //       userId: chat.sender.id == _userStore.user!.id
                    //           ? chat.receiver.id
                    //           : chat.sender.id,
                    //     );
                    //   },
                    // );
                    return Column(
                      children: [
                        ...groupProject.map((id) {
                          final project = filteredChats
                              .firstWhere((chat) => chat.project?.id == id)
                              .project;
                          return ExpansionTile(
                            initiallyExpanded: true,
                            leading: Icon(BootstrapIcons.kanban),
                            collapsedShape: RoundedRectangleBorder(
                              side: BorderSide.none,
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                            ),
                            title: Text(
                              "${AppLocalizations.of(context).translate('project')} ${project != null ? project.title : "N/A"}",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            children: [
                              Observer(builder: (context) {
                                final currentProfile =
                                    getIt<SharedPreferenceHelper>()
                                        .currentProfile;
                                final chatsInProject = filteredChats
                                    .where((chat) => chat.project?.id == id)
                                    .toList();
                                return ListView.builder(
                                  itemCount: chatsInProject.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final chat = chatsInProject[index];
                                    return ConversationList(
                                      name:
                                          chat.sender.id == _userStore.user!.id
                                              ? chat.receiver.fullname
                                              : chat.sender.fullname,
                                      messageText: chat.sender.id ==
                                              _userStore.user!.id
                                          ? "${AppLocalizations.of(context).translate('you')}: ${chat.content}"
                                          : chat.content,
                                      imageUrl: currentProfile ==
                                              UserRole.COMPANY.value
                                          ? "https://i.imgur.com/ugcoGNH.png"
                                          : "https://i.imgur.com/SR6SaqF.png",
                                      time:
                                          "${Moment(chat.createdAt).fromNow()}",
                                      isMessageRead: false,
                                      projectId: chat.project!.id!,
                                      userId:
                                          chat.sender.id == _userStore.user!.id
                                              ? chat.receiver.id
                                              : chat.sender.id,
                                    );
                                  },
                                );
                              })
                            ],
                          );
                        }).toList(),
                      ],
                    );
                  }
                  // ---------------------------------------------------------------------------------
                }),
              ],
            ),
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
}
