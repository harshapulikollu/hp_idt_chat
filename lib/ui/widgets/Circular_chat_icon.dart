import 'package:flutter/material.dart';

///Widget to display Circular chat icon for peer to peer chats
class CircularIcon extends StatelessWidget {
  const CircularIcon({super.key, required this.member});
  final String member;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: Colors.black),
      height: 40,
      width: 40,
      child: Center(child: ChatIconText(letter: member[0],),)
    );
  }
}

///Widget to display first character as text/icon in the [CircularIcon] and [SquaredIcon] widgets
class ChatIconText extends StatelessWidget {
  const ChatIconText({super.key, required this.letter});
  final String letter;
  @override
  Widget build(BuildContext context) {
    return  Text(letter, style: const TextStyle(color: Colors.white, fontSize: 24.0));
  }
}
