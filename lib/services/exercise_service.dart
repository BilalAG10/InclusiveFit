import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/exercise.dart';

class ExerciseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Exercise>> watchExercises() {
    return _db.collection('exercises').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Exercise.fromMap(doc.id, doc.data()))
          .toList();
    });
  }

  Future<List<Exercise>> getExercisesOnce() async {
    final snapshot = await _db.collection('exercises').get();
    return snapshot.docs
        .map((doc) => Exercise.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<void> testFetch() async {
    final snapshot = await _db.collection('exercises').get();
    for (final doc in snapshot.docs) {
      print("EXERCISE ID: ${doc.id}");
      print("DATA: ${doc.data()}");
    }
  }
}
