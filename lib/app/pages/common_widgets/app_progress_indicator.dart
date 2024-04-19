import 'package:flutter/material.dart';


// A widget to display a progress indicator while data is loading
class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: CircularProgressIndicator());
}
