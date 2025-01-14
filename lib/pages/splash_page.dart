import 'package:flutter/material.dart';
import 'package:spomusic_flutter/pages/home_pages/home_page.dart';
import 'package:spomusic_flutter/widget/custom_button_widgets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 35, 35),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_music.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/music.png',
                    width: screenWidth * 0.25,
                    height: screenWidth * 0.25,
                    color: Colors.white,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Text(
                    'Millions of songs.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomButton(
                    text: 'Click Here For Free Sign Up',
                    onPressed: () {},
                    fontSize: 17.0,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSocialRow(
                        'assets/images/google.png',
                        'Continue With Google',
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      buildSocialRow(
                        'assets/images/facebook.png',
                        'Continue With Facebook',
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      buildSocialRow(
                        'assets/images/iphone.png',
                        'Continue With Apple',
                        Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomButton(
                    text: 'Log in',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSocialRow(String asset, String text, [Color? color]) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: Image.asset(
            asset,
            color: color,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 15.0),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
