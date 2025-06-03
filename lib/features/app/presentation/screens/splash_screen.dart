import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';
import 'package:ui/ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeData.primaryColor,
      body: SizedBox(
        width: context.sw,
        height: context.sh,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
                height: context.sh,
                width: context.sw,
                child: Center(child: AppImage(path: Assets.images.logo.path))),
          ],
        ),
      ),
    );
  }
}
