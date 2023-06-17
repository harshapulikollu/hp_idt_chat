import 'package:hp_idt_chat_test/model/inbox.dart';

abstract class GetInboxRepoInterface {
  Future<List<Inbox>> getInbox();
}