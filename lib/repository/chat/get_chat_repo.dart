import 'package:flutter/material.dart';
import 'package:hp_idt_chat_test/helpers/api.dart';
import 'package:hp_idt_chat_test/model/chat.dart';
import 'package:hp_idt_chat_test/repository/chat/get_chat_repo_interface.dart';

///Implementation class for [GetChatRepoInterface]
///[getChat] method with [groupId] gets all chat messages of a particular chat from endpoint
class GetChatRepoImp extends GetChatRepoInterface {
  @override
  Future<List<Chat>> getChat(String groupId) async {
    try {
      String url = '/programming-test/api/$groupId.json';
      BaseApiHelper helper = BaseApiHelper();
      final response = await helper.get(url);
      List<Chat> chatMessages = [];
      response.forEach((e) => chatMessages.add(Chat.fromJson(e)));
      return chatMessages;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
