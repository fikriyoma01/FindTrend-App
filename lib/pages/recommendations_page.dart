import 'package:flutter/material.dart';

import '../models/weather_condition.dart';
import '../services/weather_service.dart';

class RecommendationsPage extends StatefulWidget {
  @override
  _RecommendationsPageState createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends State<RecommendationsPage> {
  final WeatherService _weatherService = WeatherService();

  final List<String> _plants = [
    'Kaktus',
    'Padi',
    'Lavender',
    'Aloe Vera',
    'Fern',
    'Rhododendron',
    'Bamboo'
  ];
  String? _selectedPlant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi Tanaman'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              hint: Text('Pilih Tanaman'),
              value: _selectedPlant,
              onChanged: (value) {
                setState(() {
                  _selectedPlant = value;
                  print("Tanaman yang dipilih: $_selectedPlant");
                });
              },
              items: _plants.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<WeatherCondition>>(
              future: _weatherService.fetchCurrentWeather(_selectedPlant!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (_selectedPlant == null) {
                  return Center(
                      child: Text(
                          'Silakan pilih tanaman untuk melihat rekomendasi.'));
                } else if (snapshot.hasData) {
                  final recommendations =
                      generatePlantRecommendations(_selectedPlant as String);
                  final plantRecommendation = recommendations
                      .where((r) => r.name == _selectedPlant)
                      .toList();

                  if (plantRecommendation.isEmpty) {
                    return Center(
                        child:
                            Text('Tidak ada rekomendasi untuk tanaman ini.'));
                  }

                  return ListView.builder(
                    itemCount: plantRecommendation.length,
                    itemBuilder: (context, index) {
                      final recommendation = plantRecommendation[index];
                      return ListTile(
                        title: Text(recommendation.name),
                        subtitle: Text(recommendation.description),
                      );
                    },
                  );
                } else {
                  return Center(child: Text('Tidak ada data tersedia.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
