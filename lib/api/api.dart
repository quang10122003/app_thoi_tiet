// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:bai_cuoi_ky/Widget/Models/cityWeather.dart';

// class Api {
//   String api_key = "8c8cac0f35b26f2ec314ede5512fe32a";
//   Future<CityWeather> get_data_api_city(
//       String api_key, String name_city) async {
//     String api =
//         "https://api.openweathermap.org/data/2.5/forecast?q=$name_city&appid=$api_key&units=metric&lang=vi";
//     var url = Uri.parse(api);
//     try{
//       var response = await http.get(url);
//       if(response.statusCode == 200){
//         print("lay du lieu thanh cong");
//         String data = response.body;
//         var decode_data = jsonDecode(data);
//         CityWeather weather = CityWeather(today_weather: decode_data["list"][0]["weather"][0]["main"], description:decode_data["list"][0]["weather"][0]["description"] , today_temp: decode_data["list"][0]["main"]["temp"], wind: decode_data["list"][0]["wind"]["speed"], pressure: pressure, humidity: humidity, uv: uv, dew_point: dew_point, visibility: visibility, next_day: next_day, nd_temp: nd_temp, nd_dewpoint: nd_dewpoint, next_2_day: next_2_day, n2d_temp: n2d_temp, n2d_dewpoint: n2d_dewpoint)
//       }
//     }
//   }
// }
