import 'dart:developer';
import 'dart:io';
import 'package:bai_cuoi_ky/Widget/homeScreen.dart';
import 'package:bai_cuoi_ky/Widget/registerScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../firebase/fire_base.dart';

// class giao diện màm hình login
class LoginScreen extends StatelessWidget {
  late List<String> city_love;
  TextEditingController _password_ctl = TextEditingController();
  TextEditingController _email_ctl = TextEditingController();
  firebaseService _auth = firebaseService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // hàm yêu cầu người dùng cấp quyền truy cập vị trí
  void _checkLocationPermission() async {
    PermissionStatus status = await Permission.locationWhenInUse.status;
    if (status.isDenied) {
      PermissionStatus permissionStatus =
          await Permission.locationWhenInUse.request();
      if (permissionStatus.isDenied) {
        // Thoát ứng dụng nếu người dùng từ chối cấp quyền
        exit(0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    void _confirmRegistration() async {
      AuthResult result = await _auth.loginUserWithEmailPassword(
          _email_ctl.text, _password_ctl.text);
      if (result.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(_email_ctl.text,city_love)),
        );
      } else if (result.errorMessage != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result.errorMessage!)));
      }
    }

    _checkLocationPermission();
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 750,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Color(0xFFF9F7F7)),
                child: Stack(
                  children: [
                    //Day la vi tri logo
                    Positioned(
                      left: -21,
                      top: -203,
                      child: Container(
                        width: 588,
                        height: 588,
                        decoration: ShapeDecoration(
                          color: Color(0xFFDBE2EF),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 46,
                      top: 41,
                      child: SvgPicture.asset(
                        'images/weather_icon/Weather-App-Sun-Cloud-Location--Streamline-Ultimate.svg',
                        width: 268,
                        height: 268,
                      ),
                    ),
                    Positioned(
                      left: 32,
                      top: 369,
                      child: SizedBox(
                        width: 284,
                        height: 62,
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Color(0xFF3F72AF),
                            fontSize: 48,
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 27,
                      top: 449,
                      child: Container(
                        width: 306,
                        height: 77,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 26,
                              child: Container(
                                width: 306,
                                height: 51,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF9F7F7),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 2, color: Color(0xFF3F72AF)),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 15,
                              top: 0,
                              child: SizedBox(
                                width: 73,
                                height: 16,
                                child: Text(
                                  'Email:',
                                  style: TextStyle(
                                    color: Color(0xFF3F72AF),
                                    fontSize: 16,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21,
                              top: 38,
                              child: SizedBox(
                                width: 306,
                                height: 51,
                                child: TextField(
                                  onChanged: (value) async{
                                    city_love = await firebaseService().getAllCitiesByEmail(value);
                                  },
                                  controller: _email_ctl,
                                  decoration: InputDecoration(
                                    hintText: 'abc@gmail.com',
                                  ),
                                  style: TextStyle(
                                    color: Color(0xFF3F72AF),
                                    fontSize: 16,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 27,
                      top: 536,
                      child: Container(
                        width: 306,
                        height: 77,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 26,
                              child: Container(
                                width: 306,
                                height: 51,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF9F7F7),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 2, color: Color(0xFF3F72AF)),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 15,
                              top: 0,
                              child: SizedBox(
                                width: 280,
                                height: 16,
                                child: Text(
                                  'Password:',
                                  style: TextStyle(
                                    color: Color(0xFF3F72AF),
                                    fontSize: 16,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21,
                              top: 38,
                              child: SizedBox(
                                width: 306,
                                height: 51,
                                child: TextField(
                                  controller: _password_ctl,
                                  decoration: InputDecoration(
                                    hintText: '********',
                                  ),
                                  obscureText: true,
                                  style: TextStyle(
                                    color: Color(0xFF3F72AF),
                                    fontSize: 16,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        left: 85,
                        top: 643,
                        child: ElevatedButton(
                            onPressed: () {
                              
                              _confirmRegistration();
                            },
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Karla',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF3F72AF)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(200, 40))))),

                    Positioned(
                      left: 80,
                      top: 699,
                      child: Container(
                        width: 202,
                        height: 18,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 1,
                              child: SizedBox(
                                width: 162,
                                height: 17,
                                child: Text(
                                  'Don’t have an account? ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 230,
                      top: 685,
                      child: TextButton(
                        style: TextButton.styleFrom(minimumSize: Size(50, 17)),
                        onPressed: () {
                          // Điều hướng đến màn hình đăng ký ở đây
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
