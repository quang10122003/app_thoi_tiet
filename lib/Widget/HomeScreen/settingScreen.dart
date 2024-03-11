import 'package:bai_cuoi_ky/Widget/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool switch1 = false;
  bool switch2 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String _selectedItem = 'English';
    return Container(
      width: size.width,
      height: size.height - 80,
      decoration: BoxDecoration(color: Color(0xFFF9F7F7)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Color(0xFFDBE2EF)),
            height: 110,
            width: size.width,
            child: Text(
              'Setting',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF112D4E),
                fontSize: 24,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark mode',
                  style: TextStyle(
                    color: Color(0xFF112D4E),
                    fontSize: 20,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
                Switch(
                    value: switch1,
                    // thumbColor: MaterialStatePropertyAll<Color>(Color(0xFFDBE2EF)),
                    // activeColor: Color(0xFFF9F7F7),
                    onChanged: (bool value) {
                      setState(() {
                        switch1 = value;
                      });
                    })
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language',
                  style: TextStyle(
                    color: Color(0xFF112D4E),
                    fontSize: 20,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
                DropdownButton<String>(
                  value: _selectedItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue!;
                    });
                  },
                  items: <String>['English', 'Vietnamese']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notification',
                  style: TextStyle(
                    color: Color(0xFF112D4E),
                    fontSize: 20,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
                Switch(
                    value: switch2,
                    // activeColor: Color(0xFFF9F7F7),
                    onChanged: (bool value) {
                      setState(() {
                        switch2 = value;
                      });
                    })
              ],
            ),
          ),
          SizedBox(
            width: size.width,
            height: 50,
          ),
          Container(
            width: size.width,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 100),
            alignment: Alignment.center,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all((Radius.circular(10.0)))
                    ),
                    backgroundColor: Color(0xFFDBE2EF)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Log out  ',
                      style: TextStyle(
                        color: Color(0xFF112D4E),
                        fontSize: 16,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                    SvgPicture.asset(
                      'images/bar/sign-out.svg',
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                }),
          )
        ],
      ),
    );
  }
}
