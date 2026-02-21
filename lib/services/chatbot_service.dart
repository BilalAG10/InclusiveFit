import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/exercises.dart';

class ChatbotService {

  Future<String> reply(String message) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final m = message.toLowerCase();


    final matchedExercise = sampleExercises.firstWhere(
      (ex) => m.contains(ex.name.toLowerCase()) || m.contains(ex.target.toLowerCase()),
      orElse: () => const Exercise(
        id: '',
        name: '',
        difficulty: '',
        target: '',
        description: '',
        steps: [],
      ),
    );

    if (matchedExercise.id.isNotEmpty) {
      return 'I found a workout: ${matchedExercise.name}. '
          'It targets ${matchedExercise.target} and is ${matchedExercise.difficulty} level.';
    }


    if (m.contains('nutrition') || m.contains('calorie') || m.contains('food')) {
      return 'Go to the Nutrition tab to track meals and calories.';
    }

    if (m.contains('hello') || m.contains('hi') || m.contains('help')) {
      return 'Hi! Ask me about workouts, nutrition, or accessibility.';
    }

    if (m.contains('disability') || m.contains('wheelchair')) {
      return 'We support inclusive exercises like seated workouts.';
    }


    return await _askOpenAI(message);
  }


  Future<String> _askOpenAI(String message) async {

    final url = Uri.parse("http://10.0.2.2:5002/chat");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"message": message}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["reply"];
      } else {
        return "AI service unavailable (Status: ${response.statusCode}).";
      }

    } catch (e) {
      return "Connection error. Make sure your Flask backend is running on port 5002.";
    }
  }
}
