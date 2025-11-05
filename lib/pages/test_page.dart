import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          title: Row(
            children: [
              const Icon(Icons.auto_awesome, color: Colors.deepOrange),
              const SizedBox(width: 8),
              const Text('Wallpaper Studio', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
            ],
          ),
          actions: [
            _NavButton(icon: Icons.home, label: 'Home', active: true),
            _NavButton(icon: Icons.grid_view, label: 'Browse'),
            _NavButton(icon: Icons.favorite_border, label: 'Favourites'),
            _NavButton(icon: Icons.settings, label: 'Settings'),
            const SizedBox(width: 16),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _HeroHeader(),
              const SizedBox(height: 32),
              _SectionHeader(title: 'Categories', actionLabel: 'See All'),
              const SizedBox(height: 16),
              _CategoriesGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  const _NavButton({required this.icon, required this.label, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: active ? Colors.black : Colors.grey[600]),
        label: Text(label, style: TextStyle(color: active ? Colors.black : Colors.grey[700])),
        style: TextButton.styleFrom(
          backgroundColor: active ? Colors.white : Colors.transparent,
          elevation: active ? 2 : 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}

class _HeroHeader extends StatelessWidget {
  const _HeroHeader();

  @override
  Widget build(BuildContext context) {
    /* final headlineStyle = Theme.of(context).textTheme.headline3?.copyWith(fontWeight: FontWeight.w800); */
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gradient headline
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFF6A623), Color(0xFFEF4373)],
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
          child: Text('Discover Beautiful Wallpapers', )),
      
        const SizedBox(height: 12),
        const SizedBox(
          width: 900,
          child: Text(
            'Discover curated collections of stunning wallpapers. Browse by category, preview in full-screen, and set your favorites.',
            style: TextStyle(fontSize: 18, color: Color(0xFF666666)),
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String actionLabel;
  const _SectionHeader({required this.title, required this.actionLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black87)),
        TextButton(onPressed: () {}, child: Text(actionLabel, style: const TextStyle(color: Colors.grey, fontSize: 16))),
      ],
    );
  }
}

class _CategoriesGrid extends StatelessWidget {
  final List<_Category> categories = const [
    _Category('Nature', 'Mountains, Forest and Landscapes', 'assets/images/nature.jpg', '3 wallpapers'),
    _Category('Abstract', 'Modern Geometric and artistic designs', 'assets/images/abstract.jpg', '4 wallpapers'),
    _Category('Urban', 'Cities, architecture and street', 'assets/images/urban.jpg', '6 wallpapers'),
    _Category('Space', 'Cosmos, planets, and galaxies', 'assets/images/space.jpg', '3 wallpapers'),
    _Category('Minimalist', 'Clean, simple, and elegant', 'assets/images/minimalist.jpg', '6 wallpapers'),
    _Category('Animals', 'Wildlife and nature photography', 'assets/images/animals.jpg', '4 wallpapers'),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      int crossAxisCount = 3;
      if (width < 800) crossAxisCount = 1;
      else if (width < 1200) crossAxisCount = 2;

      return GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
          childAspectRatio: 16 / 10,
        ),
        itemBuilder: (context, index) {
          final cat = categories[index];
          return _CategoryCard(category: cat);
        },
      );
    });
  }
}

class _Category {
  final String title;
  final String subtitle;
  final String image;
  final String badge;
  const _Category(this.title, this.subtitle, this.image, this.badge);
}

class _CategoryCard extends StatelessWidget {
  final _Category category;
  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(category.image, fit: BoxFit.cover, errorBuilder: (c, e, s) {
            return Container(color: Colors.grey[300]);
          }),
          // Dark gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
              ),
            ),
          ),
          // Text content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                Text(category.subtitle, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(category.badge, style: const TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
