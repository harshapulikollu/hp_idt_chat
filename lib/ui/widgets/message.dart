import 'package:flutter/material.dart';
import 'package:hp_idt_chat_test/model/chat.dart';
import 'package:hp_idt_chat_test/util/colors.dart';
import 'package:hp_idt_chat_test/util/utils.dart';

///Widget to display [message] in detailed [ChatPage]
///own messages will be displayed on right of screen
///and others messages displayed on left of the screen
class Message extends StatelessWidget {
  const Message({super.key, required this.message});
  final Chat message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14.0,right: 14.0,top: 10.0,bottom: 5.0),
      child: Align(
        alignment: (message.sender != "you"?Alignment.topLeft:Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (message.sender != "you"? Colors.black12 :UiColors.chatContainer2),
          ),
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: message.sender != "you" ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(message.sender, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),),
                  Text(' @${Utils.getFormattedDate(message.modifiedAt)}', style: const TextStyle(fontSize: 12, color: Colors.black45),),
                ],
              ),
              Text(message.message, style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 14.0),),
            ],
          ),
        ),
      ),
    );
  }
}
