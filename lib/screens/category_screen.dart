import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/wallpaper.dart';
import 'detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;
  final String query;

  const CategoryScreen({
    super.key,
    required this.categoryName,
    required this.query,
  });

  List<Wallpaper> _getWallpapers() {
    return List.generate(30, (i) {
      final seed = i + 1;
      return Wallpaper(
        id: '$query-$seed',
        url: 'https://source.unsplash.com/random/1080x1920/?$query&sig=$seed',
        thumb: 'https://source.unsplash.com/random/400x600/?$query&sig=$seed',
        category: categoryName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final wallpapers = _getWallpapers();
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.65,
        ),
        itemCount: wallpapers.length,
        itemBuilder: (context, i) {
          final wp = wallpapers[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(wallpaper: wp),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: CachedNetworkImage(
                imageUrl: wp.thumb,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  color: Colors.white10,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (_, __, ___) => Container(
                  color: Colors.white10,
                  child: const Icon(Icons.broken_image, color: Colors.white38),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
