import 'package:flutter/material.dart';
import 'package:hp_idt_chat_test/helpers/api.dart';
import 'package:hp_idt_chat_test/model/inbox.dart';
import 'package:hp_idt_chat_test/repository/inbox/get_inbox_repo_interface.dart';

///Implementation class for [GetInboxRepoInterface]
///[getInbox] method gets all inbox messages from endpoint
class GetInboxRepoImp extends GetInboxRepoInterface {
  @override
  Future<List<Inbox>> getInbox() async {
    try {
      String url = '/programming-test/api/inbox.json';
      BaseApiHelper helper = BaseApiHelper();
      final response = await helper.get(url);
      List<Inbox> inboxMessages = [];
      response.forEach((e) => inboxMessages.add(Inbox.fromJson(e)));
      return inboxMessages;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
