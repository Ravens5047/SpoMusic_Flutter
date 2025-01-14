import 'package:flutter/material.dart';
import 'package:spomusic_flutter/pages/artist_detail/artist_detail_screen.dart';
import 'package:spomusic_flutter/pages/playing_music_bar/now_playing_music.dart';
import 'package:spomusic_flutter/pages/playing_music_bar/now_playing_screen.dart';
import 'package:spomusic_flutter/pages/search_screen/search_screen_music.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = [
    'All',
    'Album',
    'Playlist',
    'Artist',
    'Ex',
    'Favorites',
    'Recent'
  ];
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Music',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/ringing.png',
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
                const SizedBox(width: 20),
                Image.asset(
                  'assets/images/settings.png',
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  categories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        if (categories[index] == 'Artist') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ArtistDetailScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedIndex == index
                            ? Colors.red
                            : Colors.grey[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        categories[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
              indent: 0.0,
            ),
            const Text(
              'Explore The Album',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildAlbumCard('Islamic - Mix', 'assets/images/example.png'),
                  _buildAlbumCard(
                      'Durod - Sharif', 'assets/images/example.png'),
                  _buildAlbumCard(
                      'Quranic - Sura', 'assets/images/example.png'),
                  _buildAlbumCard('All Zikirs', 'assets/images/example.png'),
                  _buildAlbumCard('Dua', 'assets/images/example.png'),
                  _buildAlbumCard('Islamic Music', 'assets/images/example.png'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const NowPlayingBar(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, 'Home', true, onPressed: () {}),
                _buildNavItem(Icons.search, 'Search', false, onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                }),
                _buildNavItem(Icons.library_music, 'Library', false,
                    onPressed: () {}),
                _buildNavItem(Icons.person, 'Profile', false, onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlbumCard(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (title == 'Artist') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ArtistDetailScreen(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NowPlayingMusic(),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
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
