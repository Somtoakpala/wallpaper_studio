import 'package:flutter/material.dart';
import 'package:wallpaper_studio/components/preview_panel.dart';
import 'package:wallpaper_studio/components/wallpaper_card.dart';


class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _NatureScreenState();
}

class _NatureScreenState extends State<DetailsPage> {
  int selectedIndex = 0;

  final wallpapers = [
    'images/wallpappers/nature.png',
    'images/wallpappers/nature.png',
    'images/wallpappers/nature.png',
    'images/wallpappers/nature.png',
    'images/wallpappers/nature.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left: Wallpapers grid
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nature",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: wallpapers.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => setState(() => selectedIndex = index),
                          child: WallpaperCard(
                            imagePath: wallpapers[index],
                            title: "Nature ${index + 1}",
                            selected: selectedIndex == index,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 40),

            // Right: Preview panel
            Expanded(
              flex: 1,
              child: PreviewPanel(
                imagePath: wallpapers[selectedIndex],
                title: "Nature ${selectedIndex + 1}",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
