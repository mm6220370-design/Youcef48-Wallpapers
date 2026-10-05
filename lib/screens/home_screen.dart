import 'package:flutter/material.dart';
import 'category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'طبيعة', 'icon': Icons.landscape, 'color': Colors.green, 'query': 'nature'},
    {'name': 'سيارات', 'icon': Icons.directions_car, 'color': Colors.red, 'query': 'car'},
    {'name': 'مدن', 'icon': Icons.location_city, 'color': Colors.blue, 'query': 'city'},
    {'name': 'حيوانات', 'icon': Icons.pets, 'color': Colors.orange, 'query': 'animal'},
    {'name': 'فضاء', 'icon': Icons.rocket_launch, 'color': Colors.indigo, 'query': 'space'},
    {'name': 'تجريدي', 'icon': Icons.brush, 'color': Colors.purple, 'query': 'abstract'},
    {'name': 'زهور', 'icon': Icons.local_florist, 'color': Colors.pink, 'query': 'flower'},
    {'name': 'بحر', 'icon': Icons.water, 'color': Colors.cyan, 'query': 'ocean'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youcef48 Wallpapers'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'ابحث عن خلفية...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.white54),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.3,
              ),
              itemCount: categories.length,
              itemBuilder: (context, i) {
                final cat = categories[i];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(
                          categoryName: cat['name'],
                          query: cat['query'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          (cat['color'] as Color).withValues(alpha: 0.8),
                          (cat['color'] as Color).withValues(alpha: 0.3),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(cat['icon'], size: 42, color: Colors.white),
                        const SizedBox(height: 8),
                        Text(
                          cat['name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
