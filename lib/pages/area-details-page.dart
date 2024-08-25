import 'package:flutter/material.dart';
import '../models/weather_condition.dart';
import '../services/weather_service.dart';

class AreaDetailsPage extends StatefulWidget {
  @override
  _AreaDetailsPageState createState() => _AreaDetailsPageState();
}

class _AreaDetailsPageState extends State<AreaDetailsPage> {
  final WeatherService _weatherService = WeatherService();
  String? _selectedArea;
  List<String> _areas = [
    'Surabaya',
    'Kota Malang',
    'Kota Kediri',
    'Jember',
    'Banyuwangi',
    'Sidoarjo',
    'Kabupaten Mojokerto',
    'Kabupaten Pasuruan',
    'Kabupaten Probolinggo',
    'Lumajang',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Conditions'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: DropdownButtonFormField<String>(
              value: _selectedArea,
              hint: Text('Select an Area'),
              onChanged: (newValue) {
                setState(() {
                  _selectedArea = newValue;
                });
              },
              items: _areas.map((String area) {
                return DropdownMenuItem<String>(
                  value: area,
                  child: Text(area),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: _selectedArea == null
                ? Center(
                    child: Text(
                        'Please select an area to view weather conditions.'))
                : FutureBuilder<List<WeatherCondition>>(
                    future: _weatherService.fetchCurrentWeather(_selectedArea!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(
                            child: Text('Error: ${snapshot.error.toString()}'));
                      }
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final weatherCondition = snapshot.data![index];
                            return ListTile(
                              title: Text('${weatherCondition.areaName}'),
                              subtitle: Text(
                                  'Temperature: ${weatherCondition.temperature}°C, Humidity: ${weatherCondition.humidity}%, Wind Speed: ${weatherCondition.windSpeed} m/s'),
                              trailing: Text('${weatherCondition.description}'),
                            );
                          },
                        );
                      } else {
                        return Center(
                            child: Text(
                                'No weather data available for the selected area.'));
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
