import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_idt_chat_test/cubit/chat/chat_cubit.dart';

///Widget for user to type message and send to the chat
class TextInput extends StatelessWidget {
  const TextInput({super.key, required this.controller, required this.onSubmitted});
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          focusNode: context.read<ChatCubit>().focusNode,
          autofocus: true,
          controller: controller,
          minLines: 1,
          maxLines: 5,
          decoration: const InputDecoration(
              hintText: "Type your message...",
              hintStyle: TextStyle(color: Colors.black54),
              border: InputBorder.none
          ),
          textInputAction: TextInputAction.newline,
          onSubmitted: onSubmitted,
        ),
      ),
    ));
  }
}
