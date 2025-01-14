import 'package:flutter/material.dart';
import 'package:spomusic_flutter/pages/home_pages/home_page.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.mic,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Find Song',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Search music',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                            suffixIcon:
                                const Icon(Icons.tune, color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Your top genres',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: screenSize.width,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildGenreCard('Pop', Colors.red[400]!,
                                'assets/images/example.png', screenSize.width),
                            _buildGenreCard('Jazz', Colors.orange[900]!,
                                'assets/images/example.png', screenSize.width),
                            _buildGenreCard('Hard Rock', Colors.blue[900]!,
                                'assets/images/example.png', screenSize.width),
                            _buildGenreCard('Hip Hop', Colors.green[800]!,
                                'assets/images/example.png', screenSize.width),
                            _buildGenreCard('Classic', Colors.purple[900]!,
                                'assets/images/example.png', screenSize.width),
                            _buildGenreCard('Rock', Colors.blue[700]!,
                                'assets/images/example.png', screenSize.width),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Browse all',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: screenSize.width,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildBrowseCard(
                                'Podcasts', Icons.mic, screenSize.width),
                            _buildBrowseCard(
                                'Radio', Icons.radio, screenSize.width),
                            _buildBrowseCard(
                                'Mood', Icons.emoji_emotions, screenSize.width),
                            _buildBrowseCard(
                                'In car', Icons.car_rental, screenSize.width),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: padding.bottom > 0 ? padding.bottom : 16,
                top: 8,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 41, 40, 40),
                border: Border(
                  top: BorderSide(color: Colors.grey[900]!, width: 0.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 'Home', false, onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }),
                  _buildNavItem(Icons.search, 'Search', true),
                  _buildNavItem(Icons.library_music, 'Library', false),
                  _buildNavItem(Icons.person, 'Profile', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenreCard(
      String title, Color color, String imagePath, double screenWidth) {
    // Tính toán width dựa trên màn hình
    double cardWidth = (screenWidth - 40) / 2; // 40 = padding + spacing
    return Container(
      width: cardWidth,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Transform.rotate(
              angle: 0.4,
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrowseCard(String title, IconData icon, double screenWidth) {
    // Tính toán width dựa trên màn hình
    double cardWidth = (screenWidth - 40) / 2; // 40 = padding + spacing
    return Container(
      width: cardWidth,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              icon,
              size: 80,
              color: Colors.grey[800],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected,
      {VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.red : Colors.white,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.red : Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
