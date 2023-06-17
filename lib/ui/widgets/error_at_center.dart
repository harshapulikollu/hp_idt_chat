import 'package:flutter/material.dart';

///Common widget to display custom error message at center of page
class ErrorAtCenter extends StatelessWidget {
  const ErrorAtCenter({super.key, required this.message, this.onPressed});
  final String message;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message,),
        if(onPressed != null)
          IconButton(onPressed: onPressed, icon: const Icon(Icons.refresh_rounded))
      ],
    ));
  }
}
