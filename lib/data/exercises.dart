class Exercise {
  final String id;
  final String name;
  final String difficulty; // beginner / intermediate / advanced
  final String target; // legs, chest, back, shoulders, core
  final String description;
  final List<String> steps;

  const Exercise({
    required this.id,
    required this.name,
    required this.difficulty,
    required this.target,
    required this.description,
    required this.steps,
  });
}

const sampleExercises = <Exercise>[
  Exercise(
    id: 'ex_001',
    name: 'Bodyweight Squat',
    difficulty: 'beginner',
    target: 'legs',
    description: 'A simple squat with no equipment. Good for strength and mobility.',
    steps: [
      'Stand with feet shoulder-width apart.',
      'Keep chest up and core tight.',
      'Lower hips back and down until thighs are about parallel.',
      'Push through heels to stand back up.',
    ],
  ),
  Exercise(
    id: 'ex_002',
    name: 'Wall Push-Up',
    difficulty: 'beginner',
    target: 'chest',
    description: 'A push-up variation that reduces intensity using a wall.',
    steps: [
      'Place hands on the wall at shoulder height.',
      'Step back slightly, body straight.',
      'Bend elbows and bring chest toward the wall.',
      'Push back to the start position.',
    ],
  ),
  Exercise(
    id: 'ex_003',
    name: 'Glute Bridge',
    difficulty: 'beginner',
    target: 'legs',
    description: 'Great for glutes and lower back support.',
    steps: [
      'Lie on your back, knees bent, feet flat.',
      'Squeeze glutes and lift hips.',
      'Pause at top, then lower slowly.',
    ],
  ),
  Exercise(
    id: 'ex_004',
    name: 'Seated Shoulder Press (Light)',
    difficulty: 'beginner',
    target: 'shoulders',
    description: 'Press light weights (or water bottles) overhead while seated.',
    steps: [
      'Sit tall with back supported if needed.',
      'Hold weights at shoulder level.',
      'Press overhead slowly.',
      'Lower with control.',
    ],
  ),
];
