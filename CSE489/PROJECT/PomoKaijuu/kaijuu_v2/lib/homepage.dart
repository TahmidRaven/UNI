// homepage.dart
import 'package:flutter/material.dart';
import 'common_app_bar.dart';
import 'pomokaijuu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonAppBar( // Use CommonAppBar widget
      title: 'Home',
      body: PomoKaijuuStateful(), // Display PomoKaijuu directly on the homepage
    );
  }
}
