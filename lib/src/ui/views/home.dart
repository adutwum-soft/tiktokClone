import 'package:flutter/material.dart';
import 'package:tiktokclone/src/res/colors.dart';
import 'package:tiktokclone/src/ui/views/add_videos.dart';
import 'package:tiktokclone/src/ui/views/components/custom_icon.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  static const pages = [
    Text('Home Screen'),
    Text('Search Screen'),
    AddVideos(),
    Text('Messages Screen'),
    Text('Profile Screen'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: ((value) {
            setState(() {
              pageIndex = value;
            });
          }),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.backgroundColor,
          selectedItemColor: AppColors.buttonColor,
          unselectedItemColor: Colors.white,
          currentIndex: pageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message, size: 30),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'Profile',
            ),
          ],
        ),
        body: pages[pageIndex]);
  }
}
