import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import '../models/plant_recommendation.dart';
import '../models/weather_condition.dart';

class WeatherService {
  Future<List<WeatherCondition>> fetchCurrentWeather(
      String selectedArea) async {
    final response = await http.get(Uri.parse(
        'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-JawaTimur.xml'));
    if (response.statusCode == 200) {
      final document = XmlDocument.parse(response.body);
      final List<WeatherCondition> weatherConditions = [];

      
      for (final area in document.findAllElements('area')) {
        
        final areaName = area
            .findElements('name')
            .firstWhere(
              (name) => name.getAttribute('xml:lang') == 'id_ID',
              orElse: () => XmlElement(XmlName('')),
            )
            .text;

        if (areaName == selectedArea) {
          
          area.findAllElements('parameter').forEach((parameter) {
            final id = parameter.getAttribute('id');

            
            switch (id) {
              case 'weather':
              case 't':
              case 'hu':
                final values = parameter.findAllElements('value');
                values.forEach((value) {
                  final datetime = value.getAttribute('datetime');
                  final dataValue = double.tryParse(value.text) ?? 0.0;
                  
                  weatherConditions.add(WeatherCondition(
                    areaName: areaName,
                    datetime: datetime ?? '',
                    weatherCode:
                        id == 'weather' ? dataValue.toInt() : 0, 
                    temperature: id == 't' ? dataValue : 0.0, 
                    humidity: id == 'hu' ? dataValue.toInt() : 0, 
                    windSpeed: 0.0, 
                    tempMin: 0.0, 
                    tempMax: 0.0, 
                    description: '', 
                  ));
                });
                break;
            }
          });
          break; 
        }
      }

      return weatherConditions;
    } else {
      throw Exception('Failed to load weather data.');
    }
  }
}

List<PlantRecommendation> generatePlantRecommendations(String selectedPlant) {
  List<PlantRecommendation> recommendations = [];
  // Deskripsi untuk tanaman berdasarkan kondisi cuaca tertentu
  switch (selectedPlant) {
    case 'Aloe Vera':
      recommendations.add(PlantRecommendation(
          name: 'Aloe Vera',
          description:
              'Cocok untuk kondisi sangat panas dan kering. Ideal pada suhu tinggi dengan kelembapan rendah.'));
      break;
    case 'Kaktus':
      recommendations.add(PlantRecommendation(
          name: 'Kaktus',
          description:
              'Ideal di lingkungan yang sangat kering dan panas. Kaktus tumbuh baik dengan sedikit air dan suhu tinggi.'));
      break;
    case 'Padi':
      recommendations.add(PlantRecommendation(
          name: 'Padi',
          description:
              'Membutuhkan kondisi lembab dan sering terkena hujan. Cocok untuk area dengan kelembapan tinggi dan curah hujan yang baik.'));
      break;
    case 'Lavender':
      recommendations.add(PlantRecommendation(
          name: 'Lavender',
          description:
              'Tumbuh optimal di iklim yang hangat dan kering. Lavender membutuhkan sinar matahari penuh dan tanah yang baik drainasenya.'));
      break;
    case 'Fern':
      recommendations.add(PlantRecommendation(
          name: 'Fern',
          description:
              'Memerlukan kelembapan tinggi dan sedikit sinar matahari. Fern tumbuh baik di bawah naungan dengan tanah yang tetap lembab.'));
      break;
    case 'Rhododendron':
      recommendations.add(PlantRecommendation(
          name: 'Rhododendron',
          description:
              'Lebih menyukai kondisi yang lebih dingin dan sinar matahari tidak langsung. Membutuhkan tanah yang asam dan drainase yang baik.'));
      break;
    case 'Bamboo':
      recommendations.add(PlantRecommendation(
          name: 'Bamboo',
          description:
              'Tahan terhadap berbagai kondisi, termasuk angin kencang. Bamboo membutuhkan banyak sinar matahari dan tanah yang lembab.'));
      break;
  }

  print(
      "Jumlah rekomendasi: ${recommendations.length} untuk tanaman $selectedPlant");
  return recommendations;
}
