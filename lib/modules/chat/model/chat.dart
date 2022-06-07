import 'dart:convert';

List<Chat> chatFromJson(String str) =>
    List<Chat>.from(json.decode(str).map((x) => Chat.fromJson(x)));

String chatToJson(List<Chat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chat {
  Chat({
    this.sender,
    this.receiver,
    this.message,
  });

  int? sender;
  int? receiver;
  String? message;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        sender: json["sender"],
        receiver: json["receiver"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "sender": sender,
        "receiver": receiver,
        "message": message,
      };
}
