import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NutritionTrackerScreen extends StatefulWidget {
  const NutritionTrackerScreen({super.key});

  @override
  State<NutritionTrackerScreen> createState() => _NutritionTrackerScreenState();
}

class _NutritionTrackerScreenState extends State<NutritionTrackerScreen> {
  final _targetCtrl = TextEditingController();
  final _consumedCtrl = TextEditingController();

  int _target = 2000;
  int _consumed = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    _target = prefs.getInt('cal_target') ?? 2000;
    _consumed = prefs.getInt('cal_consumed') ?? 0;
    _targetCtrl.text = _target.toString();
    _consumedCtrl.text = _consumed.toString();
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _save() async {
    final t = int.tryParse(_targetCtrl.text.trim()) ?? _target;
    final c = int.tryParse(_consumedCtrl.text.trim()) ?? _consumed;
    _target = t.clamp(1, 20000);
    _consumed = c.clamp(0, 20000);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('cal_target', _target);
    await prefs.setInt('cal_consumed', _consumed);
    if (!mounted) return;
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Saved')));
  }

  @override
  void dispose() {
    _targetCtrl.dispose();
    _consumedCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pct = (_consumed / _target).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(title: const Text('Nutrition Tracker')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: CircularPercentIndicator(
              radius: 90,
              lineWidth: 12,
              percent: pct,
              center: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('$_consumed', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                  Text('of $_target kcal', style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: _consumedCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Consumed kcal',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _targetCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Target kcal',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _save,
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
