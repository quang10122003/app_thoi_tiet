import 'package:bai_cuoi_ky/Models/city.dart';
import 'package:bai_cuoi_ky/Models/cityWeather.dart';
import 'package:bai_cuoi_ky/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  List<String>? list_city_love = City().loved_cities;
  String? _selectedItem;
  initState() {
    _selectedItem =
        list_city_love?.isEmpty == true ? null : list_city_love?.first;
  }

  Widget build(BuildContext context) {
    final TextEditingController cityController = TextEditingController();
    Size screen = MediaQuery.of(context).size;
    return Container(
      height: screen.height - 80,
      width: screen.width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Color(0xFFF9F7F7)),
      child: Stack(
        children: [
          Positioned(
            left: -(225 - screen.width / 2),
            top: -129,
            child: Container(
              width: 450,
              height: 340,
              decoration: ShapeDecoration(
                color: Color(0xFFDBE2EF),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
              top: 30,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: (screen.width - 280) / 2,
                    ),
                    child: SizedBox(
                      width: 280,
                      height: 70,
                      child: (() {
                        try {
                          if (list_city_love?.isEmpty != true) {
                            return DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                    width: 0.5,
                                    color: Color(0xFF3F72AF),
                                  ),
                                ),
                              ),
                              alignment: AlignmentDirectional.center,
                              value: _selectedItem,
                              style: TextStyle(
                                color: Color(0xFF112D4E),
                                fontSize: 30,
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                              items: City()
                                      .loved_cities
                                      ?.map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                      .toList() ??
                                  [], // Trường hợp danh sách rỗng
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedItem = value;
                                });
                              },
                            );
                          } else {
                            return Center(
                                child: Text(
                              "null",
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.w100),
                            ));
                          }
                        } catch (e) {
                          return Text("Error: $e");
                        }
                      })(), // Đóng biểu thức hàm và gọi nó ngay lập tức
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: screen.width / 2 - 75),
                    child: FutureBuilder<CityWeather?>(
                      future: Api().get_data_api_city(_selectedItem!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator(); // Hiển thị tiến trình chờ đợi
                        } else if (snapshot.hasError) {
                          return Text('Đã xảy ra lỗi: ${snapshot.error}');
                        } else {
                          CityWeather? cityWeather = snapshot.data;
                          if (cityWeather != null) {
                            String weatherIconPath =
                                'images/icon_weather_home/${cityWeather.icon}.svg';
                            return SvgPicture.asset(
                              weatherIconPath,
                              width: 150,
                              height: 150,
                            );
                          } else {
                            return Text('Không có dữ liệu');
                          }
                        }
                      },
                    ),
                  ),
                  FutureBuilder<CityWeather?>(
                    future: Api().get_data_api_city(_selectedItem!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Hiển thị tiến trình chờ đợi
                      } else if (snapshot.hasError) {
                        return Text('Đã xảy ra lỗi: ${snapshot.error}');
                      } else {
                        CityWeather? cityWeather = snapshot.data;
                        if (cityWeather != null) {
                          return Text(
                            '${cityWeather.description}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF112D4E),
                              fontSize: 32,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          );
                        } else {
                          return Text('Không có dữ liệu');
                        }
                      }
                    },
                  ),
                  FutureBuilder<CityWeather?>(
                    future: Api().get_data_api_city(_selectedItem!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Hiển thị tiến trình chờ đợi
                      } else if (snapshot.hasError) {
                        return Text('Đã xảy ra lỗi: ${snapshot.error}');
                      } else {
                        CityWeather? cityWeather = snapshot.data;
                        if (cityWeather != null) {
                          return Text(
                            'cảm giác như ${cityWeather.feels_like}°C',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF112D4E),
                              fontSize: 16,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w200,
                              height: 0,
                            ),
                          );
                        } else {
                          return Text('Không có dữ liệu');
                        }
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: FutureBuilder<CityWeather?>(
                      future: Api().get_data_api_city(_selectedItem!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator(); // Hiển thị tiến trình chờ đợi
                        } else if (snapshot.hasError) {
                          return Text('Đã xảy ra lỗi: ${snapshot.error}');
                        } else {
                          CityWeather? cityWeather = snapshot.data;
                          if (cityWeather != null) {
                            return Text(
                              '${cityWeather.temp}°C',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF112D4E),
                                fontSize: 32,
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            );
                          } else {
                            return Text('Không có dữ liệu');
                          }
                        }
                      },
                    ),
                  ),
                  Container(
                    width: 341,
                    height: 73,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 341,
                            height: 73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFDBE2EF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 13,
                          child: SizedBox(
                            width: 70,
                            height: 17,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'images/bar/wind.svg',
                                  width: 17,
                                  height: 17,
                                ),
                                Text(
                                  '  Wind',
                                  style: TextStyle(
                                    color: Color(0xFF112D4E),
                                    fontSize: 11,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 85,
                          top: 12,
                          child: SizedBox(
                            width: 75,
                            height: 19,
                            child: FutureBuilder<CityWeather?>(
                              future: Api().get_data_api_city(_selectedItem!),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return LinearProgressIndicator(
                                    backgroundColor: Colors
                                        .grey[300], // Màu nền của progress bar
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors
                                            .blue), // Màu của thanh tiến trình
                                  ); // Hiển thị tiến trình chờ đợi
                                } else if (snapshot.hasError) {
                                  return Text(
                                      'Đã xảy ra lỗi: ${snapshot.error}');
                                } else {
                                  CityWeather? cityWeather = snapshot.data;
                                  if (cityWeather != null) {
                                    return Text(
                                      '${cityWeather.wind}m/s',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF112D4E),
                                        fontSize: 11,
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    );
                                  } else {
                                    return Text('Không có dữ liệu');
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 42,
                          child: SizedBox(
                            width: 70,
                            height: 17,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'images/bar/pressure.svg',
                                  width: 17,
                                  height: 17,
                                ),
                                Text(
                                  '  Pressure',
                                  style: TextStyle(
                                    color: Color(0xFF112D4E),
                                    fontSize: 11,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 85,
                          top: 41,
                          child: SizedBox(
                            width: 75,
                            height: 19,
                            child: FutureBuilder<CityWeather?>(
                              future: Api().get_data_api_city(_selectedItem!),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return LinearProgressIndicator(
                                    backgroundColor: Colors
                                        .grey[300], // Màu nền của progress bar
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors
                                            .blue), // Màu của thanh tiến trình
                                  ); // Hiển thị tiến trình chờ đợi
                                } else if (snapshot.hasError) {
                                  return Text(
                                      'Đã xảy ra lỗi: ${snapshot.error}');
                                } else {
                                  CityWeather? cityWeather = snapshot.data;
                                  if (cityWeather != null) {
                                    return Text(
                                      '${cityWeather.pressure}hpa',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF112D4E),
                                        fontSize: 11,
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    );
                                  } else {
                                    return Text('Không có dữ liệu');
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          left: 192,
                          top: 13,
                          child: SizedBox(
                            width: 70,
                            height: 17,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'images/bar/humidity.svg',
                                  width: 17,
                                  height: 17,
                                ),
                                Text(
                                  '  Humidity\n',
                                  style: TextStyle(
                                    color: Color(0xFF112D4E),
                                    fontSize: 11,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 257,
                          top: 12,
                          child: SizedBox(
                            width: 75,
                            height: 19,
                            child: FutureBuilder<CityWeather?>(
                              future: Api().get_data_api_city(_selectedItem!),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return LinearProgressIndicator(
                                    backgroundColor: Colors
                                        .grey[300], // Màu nền của progress bar
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors
                                            .blue), // Màu của thanh tiến trình
                                  ); // Hiển thị tiến trình chờ đợi
                                } else if (snapshot.hasError) {
                                  return Text(
                                      'Đã xảy ra lỗi: ${snapshot.error}');
                                } else {
                                  CityWeather? cityWeather = snapshot.data;
                                  if (cityWeather != null) {
                                    return Text(
                                      '${cityWeather.humidity}%',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF112D4E),
                                        fontSize: 11,
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    );
                                  } else {
                                    return Text('Không có dữ liệu');
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          left: 170,
                          top: 61,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translate(0.0, 0.0)
                              ..rotateZ(-1.57),
                            child: Container(
                              width: 53,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.50,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFF112D4E),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Positioned(
                        //   left: 192,
                        //   top: 13,
                        //   child: SizedBox(
                        //     width: 70,
                        //     height: 17,
                        //     child: Row(
                        //       children: [
                        //         SvgPicture.asset(
                        //           'images/bar/uv.svg',
                        //           width: 17,
                        //           height: 17,
                        //         ),
                        //         Text(
                        //           '  UV',
                        //           style: TextStyle(
                        //             color: Color(0xFF112D4E),
                        //             fontSize: 11,
                        //             fontFamily: 'Jost',
                        //             fontWeight: FontWeight.w300,
                        //             height: 0,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //   left: 257,
                        //   top: 12,
                        //   child: SizedBox(
                        //     width: 75,
                        //     height: 19,
                        //     child: Text(
                        //       '4',
                        //       textAlign: TextAlign.right,
                        //       style: TextStyle(
                        //         color: Color(0xFF112D4E),
                        //         fontSize: 11,
                        //         fontFamily: 'Jost',
                        //         fontWeight: FontWeight.w400,
                        //         height: 0,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //   left: 192,
                        //   top: 42,
                        //   child: SizedBox(
                        //     width: 75,
                        //     height: 17,
                        //     child: Row(
                        //       children: [
                        //         SvgPicture.asset(
                        //           'images/bar/dewpoint.svg',
                        //           width: 17,
                        //           height: 17,
                        //         ),
                        //         Text(
                        //           '  Dew point',
                        //           style: TextStyle(
                        //             color: Color(0xFF112D4E),
                        //             fontSize: 11,
                        //             fontFamily: 'Jost',
                        //             fontWeight: FontWeight.w300,
                        //             height: 0,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //   left: 257,
                        //   top: 41,
                        //   child: SizedBox(
                        //     width: 75,
                        //     height: 19,
                        //     child: Text(
                        //       '7°C',
                        //       textAlign: TextAlign.right,
                        //       style: TextStyle(
                        //         color: Color(0xFF112D4E),
                        //         fontSize: 11,
                        //         fontFamily: 'Jost',
                        //         fontWeight: FontWeight.w400,
                        //         height: 0,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          left: 192,
                          top: 42,
                          child: SizedBox(
                            width: 75,
                            height: 17,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'images/bar/visibility.svg',
                                  height: 17,
                                  width: 17,
                                ),
                                Text(
                                  '  Visibility',
                                  style: TextStyle(
                                    color: Color(0xFF112D4E),
                                    fontSize: 11,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 257,
                          top: 41,
                          child: SizedBox(
                            width: 75,
                            height: 19,
                            child: FutureBuilder<CityWeather?>(
                              future: Api().get_data_api_city(_selectedItem!),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return LinearProgressIndicator(
                                    backgroundColor: Colors
                                        .grey[300], // Màu nền của progress bar
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors
                                            .blue), // Màu của thanh tiến trình
                                  ); // Hiển thị tiến trình chờ đợi
                                } else if (snapshot.hasError) {
                                  return Text(
                                      'Đã xảy ra lỗi: ${snapshot.error}');
                                } else {
                                  CityWeather? cityWeather = snapshot.data;
                                  if (cityWeather != null) {
                                    return Text(
                                      '${cityWeather.visibility}m',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF112D4E),
                                        fontSize: 11,
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    );
                                  } else {
                                    return Text('Không có dữ liệu');
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      '2 Days later forecast',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF112D4E),
                        fontSize: 20,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  Container(
                    width: 341,
                    height: 83,
                    decoration: ShapeDecoration(
                      color: Color(0xFFDBE2EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FutureBuilder<CityWeather?>(
                                  future:
                                      Api().get_data_api_city(_selectedItem!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: 40,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey[
                                              300], // Màu nền của progress bar
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors
                                                  .blue), // Màu của thanh tiến trình
                                        ),
                                      ); // Hiển thị tiến trình chờ đợi
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Đã xảy ra lỗi: ${snapshot.error}');
                                    } else {
                                      CityWeather? cityWeather = snapshot.data;
                                      if (cityWeather != null) {
                                        return Text(
                                          '${cityWeather.next_day}',
                                          style: TextStyle(
                                            color: Color(0xFF112D4E),
                                            fontSize: 14,
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        );
                                      } else {
                                        return Text('Không có dữ liệu');
                                      }
                                    }
                                  },
                                ),
                                FutureBuilder<CityWeather?>(
                                  future:
                                      Api().get_data_api_city(_selectedItem!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: 40,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey[
                                              300], // Màu nền của progress bar
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors
                                                  .blue), // Màu của thanh tiến trình
                                        ),
                                      ); // Hiển thị tiến trình chờ đợi
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Đã xảy ra lỗi: ${snapshot.error}');
                                    } else {
                                      CityWeather? cityWeather = snapshot.data;
                                      if (cityWeather != null) {
                                        return Text(
                                          '${cityWeather.nd_description}',
                                          style: TextStyle(
                                            color: Color(0xFF112D4E),
                                            fontSize: 14,
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w200,
                                            height: 0,
                                          ),
                                        );
                                      } else {
                                        return Text('Không có dữ liệu');
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                            FutureBuilder<CityWeather?>(
                              future: Api().get_data_api_city(_selectedItem!),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator(); // Hiển thị tiến trình chờ đợi
                                } else if (snapshot.hasError) {
                                  return Text(
                                      'Đã xảy ra lỗi: ${snapshot.error}');
                                } else {
                                  CityWeather? cityWeather = snapshot.data;
                                  if (cityWeather != null) {
                                    String weatherIconPath =
                                        'images/icon_weather_home/${cityWeather.nd_icon}.svg';
                                    return SvgPicture.asset(
                                      '${weatherIconPath}',
                                      width: 40,
                                      height: 40,
                                    );
                                  } else {
                                    return Text('Không có dữ liệu');
                                  }
                                }
                              },
                            ),
                            FutureBuilder<CityWeather?>(
                              future: Api().get_data_api_city(_selectedItem!),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container(
                                    width: 40,
                                    height: 10,
                                    child: LinearProgressIndicator(
                                      backgroundColor: Colors.grey[
                                          300], // Màu nền của progress bar
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors
                                              .blue), // Màu của thanh tiến trình
                                    ),
                                  ); // Hiển thị tiến trình chờ đợi
                                } else if (snapshot.hasError) {
                                  return Text(
                                      'Đã xảy ra lỗi: ${snapshot.error}');
                                } else {
                                  CityWeather? cityWeather = snapshot.data;
                                  if (cityWeather != null) {
                                    return Text(
                                      '${cityWeather.nd_temp}°C',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF112D4E),
                                        fontSize: 16,
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    );
                                  } else {
                                    return Text('Không có dữ liệu');
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'images/bar/wind.svg',
                                  height: 17,
                                  width: 17,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                FutureBuilder<CityWeather?>(
                                  future:
                                      Api().get_data_api_city(_selectedItem!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: 40,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey[
                                              300], // Màu nền của progress bar
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors
                                                  .blue), // Màu của thanh tiến trình
                                        ),
                                      ); // Hiển thị tiến trình chờ đợi
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Đã xảy ra lỗi: ${snapshot.error}');
                                    } else {
                                      CityWeather? cityWeather = snapshot.data;
                                      if (cityWeather != null) {
                                        return Text(
                                          '${cityWeather.nd_wind}m/s',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF112D4E),
                                            fontSize: 11,
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        );
                                      } else {
                                        return Text('Không có dữ liệu');
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'images/bar/pressure.svg',
                                  height: 17,
                                  width: 17,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                FutureBuilder<CityWeather?>(
                                  future:
                                      Api().get_data_api_city(_selectedItem!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: 40,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey[
                                              300], // Màu nền của progress bar
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors
                                                  .blue), // Màu của thanh tiến trình
                                        ),
                                      ); // Hiển thị tiến trình chờ đợi
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Đã xảy ra lỗi: ${snapshot.error}');
                                    } else {
                                      CityWeather? cityWeather = snapshot.data;
                                      if (cityWeather != null) {
                                        return Text(
                                          '${cityWeather.nd_pressure}hPa',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF112D4E),
                                            fontSize: 11,
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        );
                                      } else {
                                        return Text('Không có dữ liệu');
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'images/bar/humidity.svg',
                                  height: 17,
                                  width: 17,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                FutureBuilder<CityWeather?>(
                                  future:
                                      Api().get_data_api_city(_selectedItem!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: 40,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey[
                                              300], // Màu nền của progress bar
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors
                                                  .blue), // Màu của thanh tiến trình
                                        ),
                                      ); // Hiển thị tiến trình chờ đợi
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Đã xảy ra lỗi: ${snapshot.error}');
                                    } else {
                                      CityWeather? cityWeather = snapshot.data;
                                      if (cityWeather != null) {
                                        return Text(
                                          '${cityWeather.nd_humidity}%',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF112D4E),
                                            fontSize: 11,
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        );
                                      } else {
                                        return Text('Không có dữ liệu');
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'images/bar/visibility.svg',
                                  height: 17,
                                  width: 17,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                FutureBuilder<CityWeather?>(
                                  future:
                                      Api().get_data_api_city(_selectedItem!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: 40,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey[
                                              300], // Màu nền của progress bar
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors
                                                  .blue), // Màu của thanh tiến trình
                                        ),
                                      ); // Hiển thị tiến trình chờ đợi
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Đã xảy ra lỗi: ${snapshot.error}');
                                    } else {
                                      CityWeather? cityWeather = snapshot.data;
                                      if (cityWeather != null) {
                                        return Text(
                                          '${cityWeather.nd_visibility}m',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF112D4E),
                                            fontSize: 11,
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        );
                                      } else {
                                        return Text('Không có dữ liệu');
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: 341,
                    height: 83,
                    decoration: ShapeDecoration(
                      color: Color(0xFFDBE2EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FutureBuilder<CityWeather?>(
                                  future:
                                      Api().get_data_api_city(_selectedItem!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: 40,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey[
                                              300], // Màu nền của progress bar
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors
                                                  .blue), // Màu của thanh tiến trình
                                        ),
                                      ); // Hiển thị tiến trình chờ đợi
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Đã xảy ra lỗi: ${snapshot.error}');
                                    } else {
                                      CityWeather? cityWeather = snapshot.data;
                                      if (cityWeather != null) {
                                        return Text(
                                          '${cityWeather.next_2_day}',
                                          style: TextStyle(
                                            color: Color(0xFF112D4E),
                                            fontSize: 14,
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        );
                                      } else {
                                        return Text('Không có dữ liệu');
                                      }
                                    }
                                  },
                                ),
                                FutureBuilder<CityWeather?>(
                                  future:
                                      Api().get_data_api_city(_selectedItem!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: 40,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey[
                                              300], // Màu nền của progress bar
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors
                                                  .blue), // Màu của thanh tiến trình
                                        ),
                                      ); // Hiển thị tiến trình chờ đợi
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Đã xảy ra lỗi: ${snapshot.error}');
                                    } else {
                                      CityWeather? cityWeather = snapshot.data;
                                      if (cityWeather != null) {
                                        return Text(
                                          '${cityWeather.n2d_description}',
                                          style: TextStyle(
                                            color: Color(0xFF112D4E),
                                            fontSize: 14,
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w200,
                                            height: 0,
                                          ),
                                        );
                                      } else {
                                        return Text('Không có dữ liệu');
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                            FutureBuilder<CityWeather?>(
                              future: Api().get_data_api_city(_selectedItem!),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator(); // Hiển thị tiến trình chờ đợi
                                } else if (snapshot.hasError) {
                                  return Text(
                                      'Đã xảy ra lỗi: ${snapshot.error}');
                                } else {
                                  CityWeather? cityWeather = snapshot.data;
                                  if (cityWeather != null) {
                                    String weatherIconPath =
                                        'images/icon_weather_home/${cityWeather.n2d_icon}.svg';
                                    return SvgPicture.asset(
                                      '${weatherIconPath}',
                                      width: 40,
                                      height: 40,
                                    );
                                  } else {
                                    return Text('Không có dữ liệu');
                                  }
                                }
                              },
                            ),
                            FutureBuilder<CityWeather?>(
                              future: Api().get_data_api_city(_selectedItem!),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container(
                                    width: 40,
                                    height: 10,
                                    child: LinearProgressIndicator(
                                      backgroundColor: Colors.grey[
                                          300], // Màu nền của progress bar
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors
                                              .blue), // Màu của thanh tiến trình
                                    ),
                                  ); // Hiển thị tiến trình chờ đợi
                                } else if (snapshot.hasError) {
                                  return Text(
                                      'Đã xảy ra lỗi: ${snapshot.error}');
                                } else {
                                  CityWeather? cityWeather = snapshot.data;
                                  if (cityWeather != null) {
                                    return Text(
                                      '${cityWeather.n2d_temp}°C',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF112D4E),
                                        fontSize: 16,
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    );
                                  } else {
                                    return Text('Không có dữ liệu');
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'images/bar/wind.svg',
                                  height: 17,
                                  width: 17,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                FutureBuilder<CityWeather?>(
                                  future:
                                      Api().get_data_api_city(_selectedItem!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: 40,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey[
                                              300], // Màu nền của progress bar
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors
                                                  .blue), // Màu của thanh tiến trình
                                        ),
                                      ); // Hiển thị tiến trình chờ đợi
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Đã xảy ra lỗi: ${snapshot.error}');
                                    } else {
                                      CityWeather? cityWeather = snapshot.data;
                                      if (cityWeather != null) {
                                        return Text(
                                          '${cityWeather.n2d_wind}m/s',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF112D4E),
                                            fontSize: 11,
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        );
                                      } else {
                                        return Text('Không có dữ liệu');
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'images/bar/pressure.svg',
                                  height: 17,
                                  width: 17,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                FutureBuilder<CityWeather?>(
                                  future:
                                      Api().get_data_api_city(_selectedItem!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: 40,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey[
                                              300], // Màu nền của progress bar
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors
                                                  .blue), // Màu của thanh tiến trình
                                        ),
                                      ); // Hiển thị tiến trình chờ đợi
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Đã xảy ra lỗi: ${snapshot.error}');
                                    } else {
                                      CityWeather? cityWeather = snapshot.data;
                                      if (cityWeather != null) {
                                        return Text(
                                          '${cityWeather.n2d_pressure}hPa',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF112D4E),
                                            fontSize: 11,
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        );
                                      } else {
                                        return Text('Không có dữ liệu');
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'images/bar/humidity.svg',
                                  height: 17,
                                  width: 17,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                FutureBuilder<CityWeather?>(
                                  future:
                                      Api().get_data_api_city(_selectedItem!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: 40,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey[
                                              300], // Màu nền của progress bar
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors
                                                  .blue), // Màu của thanh tiến trình
                                        ),
                                      ); // Hiển thị tiến trình chờ đợi
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Đã xảy ra lỗi: ${snapshot.error}');
                                    } else {
                                      CityWeather? cityWeather = snapshot.data;
                                      if (cityWeather != null) {
                                        return Text(
                                          '${cityWeather.n2d_humidity}%',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF112D4E),
                                            fontSize: 11,
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        );
                                      } else {
                                        return Text('Không có dữ liệu');
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'images/bar/visibility.svg',
                                  height: 17,
                                  width: 17,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                FutureBuilder<CityWeather?>(
                                  future:
                                      Api().get_data_api_city(_selectedItem!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: 40,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey[
                                              300], // Màu nền của progress bar
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors
                                                  .blue), // Màu của thanh tiến trình
                                        ),
                                      ); // Hiển thị tiến trình chờ đợi
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Đã xảy ra lỗi: ${snapshot.error}');
                                    } else {
                                      CityWeather? cityWeather = snapshot.data;
                                      if (cityWeather != null) {
                                        return Text(
                                          '${cityWeather.n2d_visibility}m',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF112D4E),
                                            fontSize: 11,
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        );
                                      } else {
                                        return Text('Không có dữ liệu');
                                      }
                                    }
                                  },
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
