import 'package:flutter/material.dart';

class ARScreen extends StatelessWidget {
  const ARScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AR Trainer (Placeholder)')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('AR Module', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                SizedBox(height: 10),
                Text('This screen is a placeholder.'),
                SizedBox(height: 6),
                Text('Ashfina + Razeen will integrate ARCore here later.'),
                SizedBox(height: 6),
                Text('Plan: camera view + 3D overlay + pose guidance.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
