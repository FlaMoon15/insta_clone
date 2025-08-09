import 'package:flutter/cupertino.dart';
import 'package:insta_clone/screen/home_screen.dart';
import 'package:insta_clone/screen/search_screen.dart';

class InstaBody extends StatelessWidget {
  final int bottomNavigationBarItemIndex;
  const InstaBody({required this.bottomNavigationBarItemIndex, super.key});

  @override
  Widget build(BuildContext context) {
    if (bottomNavigationBarItemIndex == 0) {
      return HomeScreen();
    }

    return SearchScreen();
  }
}
