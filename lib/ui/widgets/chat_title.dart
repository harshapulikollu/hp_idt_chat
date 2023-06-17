import 'package:flutter/material.dart';
import 'package:hp_idt_chat_test/ui/widgets/chat_icon.dart';

///Widget to display chat title i.e. topic and members of the chat
///Used in the details chat page [ChatPage]
class ChatTitle extends StatelessWidget {
  const ChatTitle({super.key, required this.members, required this.topic, required this.id});
  final List<String> members;
  final String topic;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(tag: id,
            child: Material(
                type: MaterialType.transparency,
                child: ChatIcon(members: members))),
        const SizedBox(width: 16.0,),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
               tag: topic,
                child: Material(
                    type: MaterialType.transparency,
                    child: Text(topic, style: Theme.of(context).textTheme.titleLarge,))),
            Text(members.join(", "), overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87, fontSize: 10.0),),
          ],
        ))
      ],
    );
  }
}
