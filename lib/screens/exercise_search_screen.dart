import 'package:flutter/material.dart';

import '../data/exercises.dart';
import 'exercise_detail_screen.dart';

class ExerciseSearchScreen extends StatefulWidget {
  const ExerciseSearchScreen({super.key});

  @override
  State<ExerciseSearchScreen> createState() => _ExerciseSearchScreenState();
}

class _ExerciseSearchScreenState extends State<ExerciseSearchScreen> {
  String q = '';

  @override
  Widget build(BuildContext context) {
    final results = sampleExercises.where((e) {
      final s = '${e.name} ${e.target} ${e.difficulty}'.toLowerCase();
      return s.contains(q.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Search Exercises')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search by name / target / difficulty',
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => q = v),
            ),
          ),
          Expanded(
            child: results.isEmpty
                ? const Center(child: Text('No results'))
                : ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: results.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, i) {
                      final ex = results[i];
                      return ListTile(
                        title: Text(ex.name),
                        subtitle: Text('${ex.target} • ${ex.difficulty}'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ExerciseDetailScreen(exercise: ex)),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
