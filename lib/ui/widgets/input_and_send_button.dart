import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_idt_chat_test/cubit/chat/chat_cubit.dart';
import 'package:hp_idt_chat_test/ui/widgets/send_button.dart';
import 'package:hp_idt_chat_test/ui/widgets/text_input.dart';
import 'package:hp_idt_chat_test/util/colors.dart';

///Widget to hold [TextInput] and [SendButton] in detailed [ChatPage]
class InputAndSendButton extends StatelessWidget {
  InputAndSendButton({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(
          color: UiColors.scaffoldBackgroundColor,
          width: 1.0,
        ))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Row(
          children: [
            TextInput(controller: controller, onSubmitted: (val){
              _sendMessage(context);
            },),
            const SizedBox(width: 8.0,),
            SendButton(
              onTap: (){
                _sendMessage(context);
              },
            )
            // SendButton(onTap),
          ],
        ),
      ),
    );
  }

  void _sendMessage(BuildContext context) {
    if(controller.text.isNotEmpty){
      context.read<ChatCubit>().sendMessage(controller.text);
      controller.clear();
      context.read<ChatCubit>().sendReplyMessage();
    }else{
      const snackBar = SnackBar(
        content: Text('Please type a message to send!'),
        duration: Duration(milliseconds: 500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
