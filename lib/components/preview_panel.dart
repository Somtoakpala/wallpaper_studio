import 'package:flutter/material.dart';

class PreviewPanel extends StatelessWidget {
  final String imagePath;
  final String title;

  const PreviewPanel({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Preview", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text("Name", style: TextStyle(color: Colors.grey[600])),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: const [
              Chip(label: Text("Nature")),
              Chip(label: Text("Ambience")),
              Chip(label: Text("Flowers")),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Description",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Discover the pure beauty of 'Natural Essence' – your gateway to authentic, nature-inspired experiences. Let this unique collection elevate your senses and connect you with nature.",
            style: TextStyle(height: 1.4),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(imagePath, fit: BoxFit.cover, height: 400),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                label: const Text("Save to Favorites"),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                child: const Text("Set to Wallpaper"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
