import 'package:flutter/material.dart';

import '../data/exercises.dart';
import 'exercise_detail_screen.dart';
import 'exercise_search_screen.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercises'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ExerciseSearchScreen()),
            ),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: sampleExercises.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) {
          final ex = sampleExercises[i];
          return ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            title: Text(ex.name, style: const TextStyle(fontWeight: FontWeight.w700)),
            subtitle: Text('${ex.target} • ${ex.difficulty}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ExerciseDetailScreen(exercise: ex)),
            ),
          );
        },
      ),
    );
  }
}
