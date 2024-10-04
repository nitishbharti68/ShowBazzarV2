import 'package:flutter/material.dart';
import 'package:show_bazzar/Screens/home_screen.dart';
import 'package:show_bazzar/Settings/my_profile/screens/my_profile_screen.dart';
import 'package:show_bazzar/reels/reels_page.dart';

import '../Stream/stream_pages/stream_watch_page.dart';

class StreamBottomBar extends StatefulWidget {
  static const RouteName = 'Landing-screen';
  const StreamBottomBar({super.key});

  @override
  State<StreamBottomBar> createState() => _StreamBottomBarState();
}

class _StreamBottomBarState extends State<StreamBottomBar> {

  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
     StreamWatchPage(),
    const ReelsPage(),
    const myProfile(),
  ];
  void pageUpdate(int a) {
    setState(() {
      _page = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: const Color(0xFF6552FE),
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        iconSize: 28,
        onTap: pageUpdate,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              child: const Icon(Icons.home_outlined),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              child: const Icon(Icons.video_collection_outlined),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              child: const Icon(Icons.person_2_outlined),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
