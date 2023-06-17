import 'package:flutter/material.dart';

///Widget to send a message once user typed
class SendButton extends StatelessWidget {
  const SendButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(Icons.send, color: Colors.white,),
        ),
      ),
    );
  }
}
