class ChatUser {
  final int id;
  final String fullname;

  ChatUser({
    required this.id,
    required this.fullname,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
    };
  }

  static ChatUser fromMap(Map<String, dynamic> map) {
    return ChatUser(
      id: map['id'],
      fullname: map['fullname'],
    );
  }
}