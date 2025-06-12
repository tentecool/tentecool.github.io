import 'package:flutter/material.dart';

void main() {
  runApp(CharacterProfileApp());
}

class CharacterProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CharacterProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CharacterProfileScreen extends StatelessWidget {
  final character = {
    'name': 'Аймон',
    'level': 8,
    'strength': 23,
    'agility': 7,
    'endurance': 5,
    'intellect': 6,
    'spirit': 9,
    'hp': {'current': 280, 'max': 280},
    'xp': {'current': 13287, 'max': 16350},
    'equipment': [
      {'slot': 'head', 'name': 'Шлем'},
      {'slot': 'body', 'name': 'Броня'},
      {'slot': 'feet', 'name': 'Ботинки'},
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(character['name'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Уровень: ${character['level']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            _buildStat('Сила', character['strength']),
            _buildStat('Ловкость', character['agility']),
            _buildStat('Выносливость', character['endurance']),
            _buildStat('Интеллект', character['intellect']),
            _buildStat('Дух', character['spirit']),
            SizedBox(height: 16),
            _buildBar('Жизни', character['hp']['current'], character['hp']['max'], Colors.red),
            _buildBar('Опыт', character['xp']['current'], character['xp']['max'], Colors.blue),
            SizedBox(height: 16),
            Text('Экипировка', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            _buildEquipmentList(character['equipment']),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, int value) {
    return Row(
      children: [
        Expanded(child: Text(label)),
        Text(value.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildBar(String label, int current, int max, Color color) {
    double percent = current / max;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: $current / $max'),
        SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: percent,
            minHeight: 10,
            color: color,
            backgroundColor: color.withOpacity(0.3),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _buildEquipmentList(List<Map<String, String>> equipment) {
    return Column(
      children: equipment.map((item) {
        return Row(
          children: [
            Icon(Icons.shield, size: 20),
            SizedBox(width: 8),
            Text('${item['slot']!.toUpperCase()}: ${item['name']}'),
          ],
        );
      }).toList(),
    );
  }
}