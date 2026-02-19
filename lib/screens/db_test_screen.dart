import 'package:flutter/material.dart';
import '../../services/exercise_service.dart';

class DbTestScreen extends StatefulWidget {
  const DbTestScreen({super.key});

  @override
  State<DbTestScreen> createState() => _DbTestScreenState();
}

class _DbTestScreenState extends State<DbTestScreen> {
  @override
  void initState() {
    super.initState();

    // ✅ Call Firestore fetch once when screen loads
    final service = ExerciseService();
    service.testFetch();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Testing Firestore... Check console logs")),
    );
  }
}
