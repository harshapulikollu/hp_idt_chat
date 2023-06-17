import 'package:hp_idt_chat_test/model/chat.dart';

abstract class GetChatRepoInterface {
  Future<List<Chat>> getChat(String groupId); // Here group can be peer to peer chat or multiple people group
}