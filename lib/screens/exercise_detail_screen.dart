import 'package:flutter/material.dart';

import '../data/exercises.dart';
import 'workout_timer_screen.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final Exercise exercise;
  const ExerciseDetailScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exercise.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(exercise.description, style: const TextStyle(fontSize: 15)),
          const SizedBox(height: 16),
          const Text('Steps', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          ...List.generate(exercise.steps.length, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${i + 1}. ', style: const TextStyle(fontWeight: FontWeight.w700)),
                  Expanded(child: Text(exercise.steps[i])),
                ],
              ),
            );
          }),
          const SizedBox(height: 18),
          FilledButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => WorkoutTimerScreen(title: exercise.name)),
            ),
            icon: const Icon(Icons.play_arrow),
            label: const Text('Start Timer'),
          ),
        ],
      ),
    );
  }
}
