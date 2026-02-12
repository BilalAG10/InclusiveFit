import 'package:flutter/material.dart';

import '../services/chatbot_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final _service = ChatbotService();

  final List<_Msg> _messages = [
    _Msg(isUser: false, text: 'Hi! I\'m your InclusiveFit assistant (placeholder).'),
    _Msg(isUser: false, text: 'Ask me about workouts, nutrition, or accessibility.'),
  ];

  bool _thinking = false;

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _thinking) return;

    setState(() {
      _messages.add(_Msg(isUser: true, text: text));
      _thinking = true;
    });
    _controller.clear();

    final reply = await _service.reply(text);
    if (!mounted) return;
    setState(() {
      _messages.add(_Msg(isUser: false, text: reply));
      _thinking = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Assistant')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, i) {
                final m = _messages[i];
                final align = m.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
                final color = m.isUser
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.surfaceContainerHighest;

                return Column(
                  crossAxisAlignment: align,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(m.text),
                    ),
                  ],
                );
              },
            ),
          ),
          if (_thinking)
            const Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: Text('Assistant is typing...'),
            ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) => _send(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(onPressed: _send, icon: const Icon(Icons.send)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Msg {
  final bool isUser;
  final String text;
  _Msg({required this.isUser, required this.text});
}
