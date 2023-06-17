import 'package:flutter/material.dart';
import 'package:hp_idt_chat_test/util/utils.dart';

///Widget to display timestamp in formatted way
class ChatTime extends StatelessWidget {
  const ChatTime({super.key, required this.timestamp});
  final int timestamp;
  @override
  Widget build(BuildContext context) {
    return Text(Utils.getFormattedDate(timestamp), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),);
  }
}
