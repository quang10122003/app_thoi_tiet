import 'package:bai_cuoi_ky/Widget/HomeScreen/favoriteScreen.dart';
import 'package:bai_cuoi_ky/Widget/HomeScreen/homeScreen.dart';
import 'package:bai_cuoi_ky/Widget/HomeScreen/searchScreen.dart';
import 'package:bai_cuoi_ky/Widget/HomeScreen/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class giao diện của màn hình home
// home có 4 chức năng làm chức năng cần thêm màn hình nào thì các bạn tự thêm nha
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  List<Widget> _screen = <Widget>[
      MainScreen(),
      SearchScreen(),
      FavoriteScreen(),
      SettingScreen()
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _screen.elementAt(currentPageIndex),
            ]
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        backgroundColor: Color(0xFFDBE2EF),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Container(
              width: 20,
              height: 20,
              child: SvgPicture.asset('images/bar/house.svg'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 20,
              height: 20,
              child: SvgPicture.asset('images/bar/search-location.svg'),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 20,
              height: 20,
              child: SvgPicture.asset('images/bar/favorite.svg'),
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 20,
              height: 20,
              child: SvgPicture.asset('images/bar/setting.svg'),
            ),
            label: 'Settings',
          ),

        ],
      ),
    );
  }
}
