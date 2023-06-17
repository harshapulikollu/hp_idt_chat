// To parse this JSON data, do
//
//     final chat = chatFromJson(jsonString);

import 'dart:convert';

class Chat {
  final String id;
  final String message;
  final int modifiedAt;
  final String sender;

  Chat({
    required this.id,
    required this.message,
    required this.modifiedAt,
    required this.sender,
  });

  Chat copyWith({
    String? id,
    String? message,
    int? modifiedAt,
    String? sender,
  }) =>
      Chat(
        id: id ?? this.id,
        message: message ?? this.message,
        modifiedAt: modifiedAt ?? this.modifiedAt,
        sender: sender ?? this.sender,
      );

  factory Chat.fromRawJson(String str) => Chat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    id: json["id"],
    message: json["message"],
    modifiedAt: json["modified_at"],
    sender: json["sender"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "message": message,
    "modified_at": modifiedAt,
    "sender": sender,
  };
}
