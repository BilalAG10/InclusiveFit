class ChatbotService {
  Future<String> reply(String message) async {
    await Future.delayed(const Duration(milliseconds: 450));

    final m = message.toLowerCase();

    if (m.contains('calorie') || m.contains('nutrition')) {
      return 'You can track calories in the Nutrition tab. Set a target and update consumed calories.';
    }
    if (m.contains('squat')) {
      return 'Squat tip: keep chest up, brace core, and push through your heels.';
    }
    if (m.contains('access') || m.contains('disability')) {
      return 'InclusiveFit aims for accessible workouts. We can add seated options and clear step-by-step guidance.';
    }
    return 'I\'m a placeholder assistant. Next step: connect a real chatbot API.';
  }
}
