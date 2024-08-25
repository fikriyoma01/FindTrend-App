import 'package:flutter/material.dart';
import '../models/plant_model.dart';

class CareGuideScreen extends StatelessWidget {
  final Plant plant;

  CareGuideScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panduan Perawatan untuk ${plant.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Instruksi perawatan',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            Text(plant.careInstructions),
          ],
        ),
      ),
    );
  }
}
