import 'package:flutter/material.dart';

import 'nutrition_tracker_screen.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nutrition')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Today', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                  SizedBox(height: 8),
                  Text('Use the tracker to set calories + update meals.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            title: const Text('Open Nutrition Tracker'),
            subtitle: const Text('Calories + progress'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NutritionTrackerScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
