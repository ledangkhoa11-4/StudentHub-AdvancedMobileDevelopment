class MeetingRoom {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String meetingRoomCode;
  final String meetingRoomId;
  final DateTime? expiredAt;

  MeetingRoom({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.meetingRoomCode,
    required this.meetingRoomId,
    this.expiredAt,
  });

  factory MeetingRoom.fromJson(Map<String, dynamic> json) {
    return MeetingRoom(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      meetingRoomCode: json['meeting_room_code'] as String,
      meetingRoomId: json['meeting_room_id'] as String,
      expiredAt: json['expired_at'] != null ? DateTime.parse(json['expired_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt.toIso8601String();
    data['updatedAt'] = this.updatedAt.toIso8601String();
    data['deletedAt'] = this.deletedAt?.toIso8601String();
    data['meeting_room_code'] = this.meetingRoomCode;
    data['meeting_room_id'] = this.meetingRoomId;
    data['expired_at'] = this.expiredAt?.toIso8601String();
    return data;
  }
}