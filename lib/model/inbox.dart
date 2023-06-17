// To parse this JSON data, do
//
//     final inbox = inboxFromJson(jsonString);

import 'dart:convert';

class Inbox {
  final String id;
  String lastMessage;
  final List<String> members;
  final String topic;
  int modifiedAt;

  Inbox({
    required this.id,
    required this.lastMessage,
    required this.members,
    required this.topic,
    required this.modifiedAt,
  });

  Inbox copyWith({
    String? id,
    String? lastMessage,
    List<String>? members,
    String? topic,
    int? modifiedAt,
  }) =>
      Inbox(
        id: id ?? this.id,
        lastMessage: lastMessage ?? this.lastMessage,
        members: members ?? this.members,
        topic: topic ?? this.topic,
        modifiedAt: modifiedAt ?? this.modifiedAt,
      );

  factory Inbox.fromRawJson(String str) => Inbox.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Inbox.fromJson(Map<String, dynamic> json) => Inbox(
    id: json["id"],
    lastMessage: json["last_message"],
    members: List<String>.from(json["members"].map((x) => x)),
    topic: json["topic"],
    modifiedAt: json["modified_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "last_message": lastMessage,
    "members": List<dynamic>.from(members.map((x) => x)),
    "topic": topic,
    "modified_at": modifiedAt,
  };
}
