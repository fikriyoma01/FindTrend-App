import 'package:flutter/material.dart';
import '../models/plant_model.dart';

class PlantRemindersScreen extends StatelessWidget {
  final Plant plant;

  PlantRemindersScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders for ${plant.name}'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Water your plant'),
            subtitle: Text('Every 3 days'),
            trailing: Icon(Icons.alarm),
            onTap: () {
              
            },
          ),
          
        ],
      ),
    );
  }
}
