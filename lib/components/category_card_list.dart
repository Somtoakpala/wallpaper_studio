import 'package:flutter/material.dart';
import 'package:wallpaper_studio/components/models/category.dart';

class CategoryCardList extends StatelessWidget {
  final Category category;
  const CategoryCardList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            /* boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ], */
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Image.asset(
                  category.image,
                  width: 277,
                  height: 185,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 140,
                      height: 90,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, color: Colors.white54, size: 40),
                    );
                  },
                ),
              ),
        
              // Right text section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        category.subtitle,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        
                        width: 130,
                        height: 44,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color:Color.fromRGBO(135, 135, 135, 0.1), /* Color(0xff8787871A).withValues(alpha: 0.1), */
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Color.fromRGBO(0, 0, 0, 0.05))
                        ),
                        child: Center(
                          child: Text(
                            category.badge,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Divider()
      ],
    );
  }
}
