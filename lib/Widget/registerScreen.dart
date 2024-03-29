import 'package:bai_cuoi_ky/Widget/loginScreen.dart';
import 'package:bai_cuoi_ky/firebase/fire_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  firebaseService _auth = firebaseService();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordAgain = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      top: 300,
                      child: SizedBox(
                        width: 284,
                        height: 62,
                        child: Text(
                          'Sign up',
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
                      top: 380,
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
                                  controller: _email,
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
                      top: 467,
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
                                  controller: _password,
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
                      left: 27,
                      top: 554,
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
                                  'Confirm Password:',
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
                                  controller: _passwordAgain,
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
                          onPressed: _confirmRegistration,
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
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF3F72AF)),
                              minimumSize:
                                  MaterialStateProperty.all(Size(200, 40))),
                        )),
                    Positioned(
                      left: 75,
                      top: 699,
                      child: Container(
                        width: 206,
                        height: 18,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 1,
                              child: SizedBox(
                                width: 175,
                                height: 17,
                                child: Text(
                                  'Already have an account? ',
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
                      left: 240,
                      top: 685,
                      child: TextButton(
                        style: TextButton.styleFrom(minimumSize: Size(50, 17)),
                        onPressed: () {
                          // Điều hướng đến màn hình đăng nhập ở đây
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          'Sign in',
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

  void _confirmRegistration() async {
    if (_password.text == _passwordAgain.text) {
      if (_password.text.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Mật khẩu phải có ít nhất 6 ký tự")));
        setState(() {
          _password.text = "";
          _passwordAgain.text = "";
        });
      } else if (!isEmailValid(_email.text)) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("email không hợp lệ")));
        setState(() {
          _email.text = "";
        });
      } else {
        AuthResult result = await _auth.registerUserWithEmailPassword(
            _email.text, _password.text);
        if (result.user != null) {
          // Đăng ký thành công
          print('Đăng ký thành công');
          // _auth.registerNewUser(_email.text);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Đăng ký thành công"),
            ),
          );
        } else if (result.errorMessage != null) {
          // Có lỗi xảy ra, hiển thị thông báo lỗi
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(result.errorMessage!)));
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("mật khẩu không khớp vui lòng nhập lại")));
      setState(() {
        _password.text = "";
        _passwordAgain.text = "";
      });
    }
  }

  bool isEmailValid(String email) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }
}
