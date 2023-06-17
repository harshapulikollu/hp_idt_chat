import 'package:flutter/material.dart';
import 'package:hp_idt_chat_test/model/inbox.dart';
import 'package:hp_idt_chat_test/ui/widgets/chat_icon.dart';
import 'package:hp_idt_chat_test/ui/widgets/chat_time.dart';

///Widget to display each inbox chat thread item in listview
class InboxMessage extends StatelessWidget {
  const InboxMessage({super.key, required this.messageData});
  final Inbox messageData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(tag: messageData.id,
          child: Material(
              type: MaterialType.transparency,
              child: ChatIcon(members: messageData.members))),
      title: Row(
        children: [
          Expanded(child: Hero(
            tag: messageData.topic,
            child: Material(
                type: MaterialType.transparency,
                child: Text(messageData.topic, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleLarge,)),
          )),
          ChatTime(timestamp: messageData.modifiedAt),
        ],
      ),
      subtitle: Text(messageData.lastMessage, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),),
      onTap: (){
        Navigator.pushNamed(context, '/chat', arguments: messageData);
      },
    );
  }
}
