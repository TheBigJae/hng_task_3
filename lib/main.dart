import 'package:flutter/material.dart';

void main() {
  runApp(const WallpaperStudioApp());
}

class WallpaperStudioApp extends StatelessWidget {
  const WallpaperStudioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: 'Inter',
      ),
      home: const WallpaperStudioHome(),
    );
  }
}

class WallpaperStudioHome extends StatefulWidget {
  const WallpaperStudioHome({Key? key}) : super(key: key);

  @override
  State<WallpaperStudioHome> createState() => _WallpaperStudioHomeState();
}

class _WallpaperStudioHomeState extends State<WallpaperStudioHome> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: Row(
              children: [
                // Logo
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.red.shade400,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.diamond,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Wallpaper Studio',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                // Navigation
                _buildNavButton('Home', Icons.home_outlined, 0),
                const SizedBox(width: 8),
                _buildNavButton('Browse', Icons.grid_view_outlined, 1),
                const SizedBox(width: 8),
                _buildNavButton('Favourites', Icons.favorite_border, 2),
                const SizedBox(width: 8),
                _buildNavButton('Settings', Icons.settings_outlined, 3),
              ],
            ),
          ),
          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Section
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text: 'Discover ',
                            style: TextStyle(color: Colors.orange.shade400),
                          ),
                          TextSpan(
                            text: 'Beautiful ',
                            style: TextStyle(color: Colors.orange.shade300),
                          ),
                          TextSpan(
                            text: 'Wallpapers',
                            style: TextStyle(color: Colors.red.shade400),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Discover curated collections of stunning wallpapers. Browse by\ncategory, preview in full-screen, and set your favorites.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 64),
                    // Categories Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    // Categories Grid
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 1.5,
                      children: [
                        _buildCategoryCard(
                          'Nature',
                          'Mountains, Forest and Landscapes',
                          '3 wallpapers',
                          Colors.blue.shade900,
                          'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
                        ),
                        _buildCategoryCard(
                          'Abstract',
                          'Modern Geometric and artistic designs',
                          '4 wallpapers',
                          Colors.purple.shade700,
                          'https://images.unsplash.com/photo-1557672172-298e090bd0f1',
                        ),
                        _buildCategoryCard(
                          'Urban',
                          'Cities, architecture and street',
                          '6 wallpapers',
                          Colors.grey.shade800,
                          'https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b',
                        ),
                        _buildCategoryCard(
                          'Space',
                          'Cosmos, planets, and galaxies',
                          '3 wallpapers',
                          Colors.indigo.shade900,
                          'https://images.unsplash.com/photo-1462331940025-496dfbfc7564',
                        ),
                        _buildCategoryCard(
                          'Minimalist',
                          'Clean, simple, and elegant',
                          '5 wallpapers',
                          Colors.brown.shade300,
                          'https://images.unsplash.com/photo-1485827404703-89b55fcc595e',
                        ),
                        _buildCategoryCard(
                          'Animals',
                          'Wildlife and nature photography',
                          '4 wallpapers',
                          Colors.blue.shade800,
                          'https://images.unsplash.com/photo-1474511320723-9a56873867b5',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(String label, IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade100 : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.black : Colors.grey.shade600,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.black : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    String title,
    String description,
    String count,
    Color overlayColor,
    String imagePlaceholder,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: overlayColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Background gradient
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      overlayColor,
                      overlayColor.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        count,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}