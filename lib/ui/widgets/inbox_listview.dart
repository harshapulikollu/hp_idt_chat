import 'package:flutter/material.dart';
import 'package:hp_idt_chat_test/model/inbox.dart';
import 'package:hp_idt_chat_test/ui/widgets/inbox_message.dart';

///Widget to display list of inbox chat threads
class InboxListview extends StatelessWidget {
  const InboxListview({super.key, required this.inboxMessages});
  final List<Inbox> inboxMessages;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(itemBuilder: (BuildContext context, int index){
        Inbox inboxMessage = inboxMessages[index];
        return InboxMessage(messageData: inboxMessage);
      }, separatorBuilder: (BuildContext context, int index){
        return const Divider();
      }, itemCount: inboxMessages.length,),
    );
  }
}
