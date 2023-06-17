import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_idt_chat_test/cubit/chat/chat_cubit.dart';
import 'package:hp_idt_chat_test/model/chat.dart';
import 'package:hp_idt_chat_test/ui/widgets/input_and_send_button.dart';
import 'package:hp_idt_chat_test/ui/widgets/message.dart';

///Widget to display Chat in ListView along with input for messages and send button
class ChatList extends StatelessWidget {
  const ChatList({super.key, required this.messages});
  final List<Chat> messages;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: ListView.builder(
              controller: context.read<ChatCubit>().scrollController,
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index){
              return  Message(message: messages[index]);
            }),
          ),
           Align(
              alignment: Alignment.bottomLeft,
              child: InputAndSendButton()),
        ],
      ),
    );
  }
}
