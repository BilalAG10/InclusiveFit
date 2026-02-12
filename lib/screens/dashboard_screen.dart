import 'package:flutter/material.dart';

import '../widgets/user_header.dart';
import '../widgets/primary_card.dart';
import 'exercise_search_screen.dart';
import 'nutrition_tracker_screen.dart';
import 'chat_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const UserHeader(),
          const SizedBox(height: 16),
          PrimaryCard(
            title: 'Search Exercises',
            subtitle: 'Find workouts by name or target muscle',
            icon: Icons.search,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ExerciseSearchScreen()),
            ),
          ),
          const SizedBox(height: 12),
          PrimaryCard(
            title: 'Nutrition Tracker',
            subtitle: 'Set calories + track daily intake',
            icon: Icons.local_fire_department_outlined,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NutritionTrackerScreen()),
            ),
          ),
          const SizedBox(height: 12),
          PrimaryCard(
            title: 'Chat Assistant',
            subtitle: 'Ask for workout and nutrition help',
            icon: Icons.chat_bubble_outline,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ChatScreen()),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'AR Trainer is available from the AR tab (placeholder for now).',
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
