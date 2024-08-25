import 'package:flutter/material.dart';
import '../models/plant_model.dart';
import 'care_guide_screen.dart';

class PlantDetailsScreen extends StatelessWidget {
  final Plant plant;

  PlantDetailsScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(plant.imageUrl),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(plant.description),
            ),
            ElevatedButton(
              child: Text('Lihat Panduan Perawatan'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CareGuideScreen(plant: plant),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
