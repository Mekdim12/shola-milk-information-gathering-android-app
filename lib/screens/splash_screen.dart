import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'home_page.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget>
    with SingleTickerProviderStateMixin {
  bool showText = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    // get screen width and start from the left side of the screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenWidth = MediaQuery.of(context).size.width;
      _animation = Tween<double>(
              begin: screenWidth - (screenWidth + (screenWidth * 0.5)), end: 0)
          .animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.fastOutSlowIn,
        ),
      );
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showText = true;
        _controller.forward();
      });
    });

    Future.delayed(const Duration(seconds: 6), () {
      Get.off(
        const HomePageWidget(),
        transition: Transition.circularReveal,
        duration: const Duration(milliseconds: 1000),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_with_footing.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo_with_white_text.png',
              width: 400.0,
              height: 400.0,
            ),
            SizedBox(height: (height * 0.1)),
            showText
                ? AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Transform.translate(
                            offset: Offset(_animation.value, 0),
                            child: Image.asset(
                              'assets/images/white_transparent_shola_entrance.png',
                              width: 500.0,
                              height: 200.0,
                            ),
                          );
                        },
                      );
                    },
                  )
                : const SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
