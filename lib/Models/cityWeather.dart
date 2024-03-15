class CityWeather {
  String today_weather; // thơ
  String description; // mưu tả
  int today_temp; // nhiệt đọo hôm nay
  double wind;
  double pressure;
  int humidity;
  int uv;
  int dew_point;
  double visibility;
  DateTime next_day;
  int nd_temp;
  int nd_dewpoint;
  DateTime next_2_day;
  int n2d_temp;
  int n2d_dewpoint;

  CityWeather(
      {required this.today_weather,
      required this.description,
      required this.today_temp,
      required this.wind,
      required this.pressure,
      required this.humidity,
      required this.uv,
      required this.dew_point,
      required this.visibility,
      required this.next_day,
      required this.nd_temp,
      required this.nd_dewpoint,
      required this.next_2_day,
      required this.n2d_temp,
      required this.n2d_dewpoint});
}
