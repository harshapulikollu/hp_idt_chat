import 'package:flutter/material.dart';
import 'package:hp_idt_chat_test/ui/widgets/Circular_chat_icon.dart';

///Widget to display Texts as chat Icon for groups
///[members] with greater one are consider as groups
///We consider first 3 [members] initial letter and [Stack] them to create a unique icon for each chat
class SquaredIcon extends StatelessWidget {
  const SquaredIcon({super.key, required this.members});
  final List<String> members;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 40,
          width: 40,
          color: Colors.black,
          child: Stack(
            alignment: Alignment.center,
            children: [
          Align(
            alignment: Alignment.topCenter,
            child: ChatIconText(letter: members[0][0]),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ChatIconText(letter: members[1][0]),
          ),
          if(members.length > 2)
            Align(
              alignment: Alignment.bottomRight,
              child: ChatIconText(letter: members[2][0]),
            ),
            ],
          ),
        ));
  }
}
