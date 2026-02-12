import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserHeader extends StatefulWidget {
  const UserHeader({super.key});

  @override
  State<UserHeader> createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeader> {
  String _name = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final n = (prefs.getString('user_name') ?? '').trim();
    if (!mounted) return;
    setState(() => _name = n);
  }

  @override
  Widget build(BuildContext context) {
    final letter = _name.isEmpty ? 'U' : _name[0].toUpperCase();
    return Row(
      children: [
        CircleAvatar(child: Text(letter)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _name.isEmpty ? 'Hello' : 'Hello, $_name',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              const Text('Welcome back', style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
