import 'package:flutter/material.dart';
import 'package:hp_idt_chat_test/ui/widgets/Circular_chat_icon.dart';
import 'package:hp_idt_chat_test/ui/widgets/squared_chat_icon.dart';

///Widget for Chat Icon
///We use two different shapes for group icons to distinguish groups and peer chats easily.
///Chat with more than one people as member is consider as group
///For group chats we use [SquaredIcon], where icon is square in shape with curved edges
///with first 3 [members] first characters as text stacked on each other.
///For peer to peer chat we use [CircularIcon], where icon is circular in shape with [member] first character as text in center
class ChatIcon extends StatelessWidget {
  const ChatIcon({super.key, required this.members});
  final List<String> members;

  @override
  Widget build(BuildContext context) {
    return members.length > 1 ? SquaredIcon(members: members): CircularIcon(member: members[0]);
  }
}
