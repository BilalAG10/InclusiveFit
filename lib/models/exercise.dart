class Exercise {
  final String id;
  final String name;
  final String target;
  final String difficulty;
  final String description;
  final List<String> steps;

  // Optional: for later
  final List<Map<String, dynamic>> jointActions;

  Exercise({
    required this.id,
    required this.name,
    required this.target,
    required this.difficulty,
    required this.description,
    required this.steps,
    this.jointActions = const [],
  });

  factory Exercise.fromMap(String id, Map<String, dynamic> data) {
    return Exercise(
      id: id,
      name: (data['name'] ?? '').toString(),
      target: (data['target'] ?? data['bodyRegion'] ?? '').toString(),
      difficulty: (data['difficulty'] ?? '').toString(),
      description: (data['description'] ?? data['instructions'] ?? '').toString(),
      steps: (data['steps'] is List)
          ? (data['steps'] as List).map((e) => e.toString()).toList()
          : _stepsFromInstructions((data['instructions'] ?? '').toString()),
      jointActions: (data['jointActions'] is List)
          ? (data['jointActions'] as List)
          .whereType<Map>()
          .map((m) => Map<String, dynamic>.from(m))
          .toList()
          : const [],
    );
  }

  static List<String> _stepsFromInstructions(String instructions) {
    if (instructions.trim().isEmpty) return const [];
    // If you don't store "steps" yet, we convert instructions into 1 step
    return [instructions.trim()];
  }
}
