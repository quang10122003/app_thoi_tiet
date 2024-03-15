import 'package:bai_cuoi_ky/Models/cityWeather.dart';

class City {
  // Khởi tạo citys trong constructor
  Map<String, CityWeather> cities = {
    'hanoi': CityWeather(
      today_weather: 'Overcast clouds',
      description: 'Gentle Freeze',
      today_temp: 20,
      wind: 1.5,
      pressure: 1019,
      humidity: 94,
      uv: 4,
      dew_point: 7,
      visibility: 10.0,
      next_day: DateTime(2024, 3, 20),
      nd_temp: 11,
      nd_dewpoint: 7,
      next_2_day: DateTime(2023, 3, 21),
      n2d_temp: 15,
      n2d_dewpoint: 8,
    ),
    'London': CityWeather(
      today_weather: 'Overcast clouds',
      description: 'Gentle Freeze',
      today_temp: 50,
      wind: 1.5,
      pressure: 1019,
      humidity: 94,
      uv: 4,
      dew_point: 7,
      visibility: 10.0,
      next_day: DateTime(2024, 3, 20),
      nd_temp: 11,
      nd_dewpoint: 7,
      next_2_day: DateTime(2023, 3, 21),
      n2d_temp: 15,
      n2d_dewpoint: 8,
    ),
    'Paris': CityWeather(
      today_weather: 'Clouds',
      description: 'Gentle Freeze',
      today_temp: 21,
      wind: 1.5,
      pressure: 1019,
      humidity: 94,
      uv: 4,
      dew_point: 7,
      visibility: 10.0,
      next_day: DateTime(2024, 3, 20),
      nd_temp: 11,
      nd_dewpoint: 7,
      next_2_day: DateTime(2023, 3, 21),
      n2d_temp: 15,
      n2d_dewpoint: 8,
    ),
  };
  List<String> loved_cities = ["hanoi", 'London', 'Paris'];
}
