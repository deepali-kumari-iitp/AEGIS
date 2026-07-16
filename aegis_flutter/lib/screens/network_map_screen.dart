import 'package:flutter/material.dart';

class NetworkMapScreen extends StatelessWidget {
  const NetworkMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Network Map"),
      ),
      body: const Center(
        child: Text(
          "Nearby Mesh Network\n(Coming Soon)",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}