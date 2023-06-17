import 'package:flutter/material.dart';

///Common widget to display loading indicator at center of page
class LoadingIndicatorAtCenter extends StatelessWidget {
  const LoadingIndicatorAtCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(),);
  }
}
