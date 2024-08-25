import '../models/plant_model.dart';

class PlantService {
  static List<Plant> getRecommendedPlants() {
    return [
      Plant(
        name: 'Aloe Vera',
        description: 'Bagus untuk kualitas udara dalam ruangan.',
        imageUrl: 'assets/images/aloevera.jpg',
        careInstructions:
            'Siram setiap 3 minggu dan letakkan di tempat yang terang dan tidak langsung.',
      ),
      Plant(
        name: 'Snake Plant',
        description: 'Meningkatkan kualitas udara dalam ruangan.',
        imageUrl: 'assets/images/snakeplant.jpeg',
        careInstructions:
            'Siram setiap 2-6 minggu; lebih menyukai cahaya tidak langsung.',
      ),
      Plant(
        name: 'Peace Lily',
        description:
            'Dikenal dengan bunga putih dan kemampuannya memurnikan udara.',
        imageUrl: 'assets/images/peacelily.jpeg',
        careInstructions:
            'Jaga agar tanah tetap lembab; cahaya rendah dan tidak langsung.',
      ),
      Plant(
        name: 'Spider Plant',
        description: 'Mudah tumbuh dan bagus untuk pemula.',
        imageUrl: 'assets/images/spiderplant.jpg',
        careInstructions:
            'Siram dengan baik tetapi biarkan mengering di antara penyiraman; cahaya terang dan tidak langsung.',
      ),
      Plant(
        name: 'Rubber Plant',
        description:
            'Memiliki daun besar berwarna hijau tua; terkenal tangguh.',
        imageUrl: 'assets/images/rubberplant.jpg',
        careInstructions:
            'Lebih menyukai cahaya tidak langsung; siram saat bagian atas tanah kering.',
      ),
      Plant(
        name: 'Fiddle Leaf Fig',
        description:
            'Menampilkan daun besar, berurat tebal, berbentuk biola yang tumbuh tegak.',
        imageUrl: 'assets/images/fiddleleaffig.jpeg',
        careInstructions:
            'Lebih menyukai cahaya terang dan tidak langsung; air saat tanah kering jika disentuh.',
      ),
    ];
  }
}
