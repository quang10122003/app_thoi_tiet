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
  State<HomeScreen> createState() => _HomeScreenState(_email);
  List<String> city_love;
  String _email='';
  HomeScreen(this._email,this.city_love);
}

class _HomeScreenState extends State<HomeScreen> {
  final String email;
  int currentPageIndex = 0;
  List<Widget> _screen = [];

  _HomeScreenState(this.email); // Nhận giá trị _email từ HomeScreen

  @override
  void initState() {
    super.initState();
    // Khởi tạo _screen ở trong initState để truy cập được vào thuộc tính email
    _screen = [
      MainScreen(email, widget.city_love),
      SearchScreen(email),
      FavoriteScreen(email), // Sử dụng email ở đây
      SettingScreen()
    ];
  }
  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
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
