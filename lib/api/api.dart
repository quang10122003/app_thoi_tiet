import 'dart:convert';
import 'package:bai_cuoi_ky/Models/cityWeather.dart';
import 'package:http/http.dart' as http;

class Api {
  String api_key = "8c8cac0f35b26f2ec314ede5512fe32a";

  String handle_date_series(String input) {
    String inputString = input;
    // Tách chuỗi thành danh sách các phần
    List<String> parts = inputString.split(" ");
    // Lấy phần ngày tháng
    String datePart = parts[0];
    // Tách ngày, tháng và năm
    List<String> dateParts = datePart.split("-");
    String year = dateParts[0];
    String month = dateParts[1];
    String day = dateParts[2];
    // Đảo ngày và tháng
    String result = "$day/$month/$year";
    return result;
  }

  Future<CityWeather?> get_data_api_city(String namecity) async {
    String api =
        "https://api.openweathermap.org/data/2.5/forecast?q=$namecity&appid=$api_key&units=metric&lang=vi";
    var url = Uri.parse(api);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print("lay du lieu thanh cong");
        String data = response.body;
        var decode_data = jsonDecode(data);

        var icon = decode_data['list'][0]['weather'][0]["icon"].toString();
        icon = icon.substring(0, 2);

        var nd_icon = decode_data['list'][8]['weather'][0]["icon"].toString();
        nd_icon = nd_icon.substring(0, 2);

        var n2d_icon = decode_data['list'][16]['weather'][0]["icon"].toString();
        n2d_icon = nd_icon.substring(0, 2);

        var description = decode_data['list'][0]['weather'][0]["description"];

        var feels_like = decode_data['list'][0]['main']['feels_like'];
        var temp = decode_data['list'][0]['main']['temp'];
        var wind = decode_data['list'][0]['wind']['speed'];
        var pressure = decode_data['list'][0]['main']['pressure'];
        var humidity = decode_data['list'][0]['main']['humidity'];
        var visibility = decode_data['list'][0]["visibility"];
        var next_day = handle_date_series(decode_data['list'][8]['dt_txt']);
        var nd_description =
            decode_data['list'][8]['weather'][0]["description"];
        var nd_wind = decode_data['list'][8]['wind']['speed'];
        var nd_pressure = decode_data['list'][8]['main']['pressure'];
        var nd_humidity = decode_data['list'][8]['main']['humidity'];
        var nd_visibility = decode_data['list'][8]["visibility"];
        var nd_temp = decode_data['list'][8]['main']['temp'];
        var next_2_day = handle_date_series(decode_data['list'][16]['dt_txt']);
        var n2d_description =
            decode_data['list'][16]['weather'][0]["description"];
        var n2d_wind = decode_data['list'][16]['wind']['speed'];
        var n2d_pressure = decode_data['list'][16]['main']['pressure'];
        var n2d_humidity = decode_data['list'][16]['main']['humidity'];
        var n2d_visibility = decode_data['list'][16]["visibility"];
        var n2d_temp = decode_data['list'][16]['main']['temp'];
        CityWeather new_city_weather = CityWeather(
            description: description,
            feels_like: feels_like,
            temp: temp,
            wind: wind,
            pressure: pressure,
            humidity: humidity,
            visibility: visibility,
            icon: icon,
            next_day: next_day,
            nd_description: nd_description,
            nd_wind: nd_wind,
            nd_pressure: nd_pressure,
            nd_humidity: nd_humidity,
            nd_visibility: nd_visibility,
            nd_temp: nd_temp,
            next_2_day: next_2_day,
            n2d_description: n2d_description,
            n2d_wind: n2d_wind,
            n2d_pressure: n2d_pressure,
            n2d_humidity: n2d_humidity,
            n2d_visibility: n2d_visibility,
            n2d_temp: n2d_temp,
            nd_icon: nd_icon,
            n2d_icon: n2d_icon);
        return new_city_weather;
      } 
    } catch (e) {
      print("loi ${e}");
      return null;
    }
  }
}
