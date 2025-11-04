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

class CategoryData {
  final String title;
  final String description;
  final String count;
  final Color color;
  final String image;

  CategoryData({
    required this.title,
    required this.description,
    required this.count,
    required this.color,
    required this.image,
  });
}

class WallpaperStudioHome extends StatefulWidget {
  const WallpaperStudioHome({Key? key}) : super(key: key);

  @override
  State<WallpaperStudioHome> createState() => _WallpaperStudioHomeState();
}

class _WallpaperStudioHomeState extends State<WallpaperStudioHome> {
  int _selectedIndex = 0;
  CategoryData? _activeCategory;

  final List<CategoryData> categories = [
    CategoryData(
      title: 'Nature',
      description: 'Mountains, Forest and Landscapes',
      count: '3 wallpapers',
      color: Colors.blue.shade900,
      image: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
    ),
    CategoryData(
      title: 'Abstract',
      description: 'Modern Geometric and artistic designs',
      count: '4 wallpapers',
      color: Colors.purple.shade700,
      image: 'https://images.unsplash.com/photo-1557672172-298e090bd0f1',
    ),
    CategoryData(
      title: 'Urban',
      description: 'Cities, architecture and street',
      count: '6 wallpapers',
      color: Colors.grey.shade800,
      image: 'https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b',
    ),
    CategoryData(
      title: 'Space',
      description: 'Cosmos, planets, and galaxies',
      count: '3 wallpapers',
      color: Colors.indigo.shade900,
      image: 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564',
    ),
    CategoryData(
      title: 'Minimalist',
      description: 'Clean, simple, and elegant',
      count: '5 wallpapers',
      color: Colors.brown.shade300,
      image: 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e',
    ),
    CategoryData(
      title: 'Animals',
      description: 'Wildlife and nature photography',
      count: '4 wallpapers',
      color: Colors.blue.shade800,
      image: 'https://images.unsplash.com/photo-1474511320723-9a56873867b5',
    ),
  ];

  void _toggleCategory(CategoryData category) {
    setState(() {
      if (_activeCategory == category) {
        _activeCategory = null;
      } else {
        _activeCategory = category;
      }
    });
  }

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
                    // Active Wallpaper Card (conditionally shown)
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: _activeCategory != null
                          ? Column(
                              children: [
                                _buildActiveWallpaperCard(),
                                const SizedBox(height: 48),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                    // Hero Section (shown only when no active category)
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: _activeCategory == null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 52,
                                      fontWeight: FontWeight.bold,
                                      height: 1.2,
                                      fontFamily: 'ClashDisplay',
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Discover ',
                                        style: TextStyle(
                                          color: Colors.orange.shade400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Beautiful ',
                                        style: TextStyle(
                                          color: Colors.orange.shade300,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Wallpapers',
                                        style: TextStyle(
                                          color: Colors.red.shade400,
                                        ),
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
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
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
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                        childAspectRatio: 1.5,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return _buildCategoryCard(category);
                      },
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

  Widget _buildActiveWallpaperCard() {
    if (_activeCategory == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Wallpaper Preview
          Container(
            width: 100,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade300,
              image: DecorationImage(
                image: NetworkImage(
                  '${_activeCategory!.image}?w=400',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 24),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    children: [
                      TextSpan(
                        text: 'Your ',
                        style: TextStyle(
                          color: Colors.orange.shade400,
                        ),
                      ),
                      TextSpan(
                        text: 'Active ',
                        style: TextStyle(
                          color: Colors.orange.shade300,
                        ),
                      ),
                      TextSpan(
                        text: 'Wallpaper',
                        style: TextStyle(
                          color: Colors.red.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'This wallpaper is currently set as your active background',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Category - ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Text(
                      _activeCategory!.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Selection - ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Text(
                      'Wallaper ${categories.indexOf(_activeCategory!) + 1}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Action buttons
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share_outlined,
              color: Colors.grey.shade600,
              size: 22,
            ),
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
              color: Colors.grey.shade600,
              size: 22,
            ),
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
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

  Widget _buildCategoryCard(CategoryData category) {
    final isActive = _activeCategory == category;
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _toggleCategory(category),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: category.color,
            border: isActive
                ? Border.all(color: Colors.orange.shade400, width: 3)
                : null,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isActive ? 0.15 : 0.1),
                blurRadius: isActive ? 12 : 8,
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
                        category.color,
                        category.color.withOpacity(0.7),
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
                        category.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category.description,
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
                          category.count,
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
      ),
    );
  }
}