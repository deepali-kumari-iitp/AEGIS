import 'package:flutter/material.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency SOS"),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("SOS feature will be connected soon."),
              ),
            );
          },
          icon: const Icon(Icons.sos),
          label: const Text("Broadcast SOS"),
        ),
      ),
    );
  }
}