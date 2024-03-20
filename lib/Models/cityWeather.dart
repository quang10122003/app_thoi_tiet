class CityWeather {
  var description; // mo ta thoi tiet
  var feels_like; // mưu tả nhiệt độ hôm nay  (cam giac nhu ... c)
  var temp; // nhiệt đọo hôm nay
  var wind; // gió m/s
  var pressure; // áp lực
  var humidity; // độ ẩm
  var visibility; // tầm nhìn
  var icon; // icon thoi tiet
  var next_day;
  var nd_description;
  var nd_wind; // gió m/s
  var nd_pressure; // áp lực
  var nd_humidity; // độ ẩm
  var nd_visibility;
  var nd_temp;
  var nd_icon;
  var next_2_day;
  var n2d_description;
  var n2d_wind; // gió m/s
  var n2d_pressure; // áp lực
  var n2d_humidity; // độ ẩm
  var n2d_visibility;
  var n2d_temp;
  var n2d_icon;
  var name_city;
  CityWeather({
    required this.description,
    required this.feels_like,
    required this.temp,
    required this.wind,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.icon,
    required this.next_day,
    required this.nd_description,
    required this.nd_wind,
    required this.nd_pressure,
    required this.nd_humidity,
    required this.nd_visibility,
    required this.nd_temp,
    required this.next_2_day,
    required this.n2d_description,
    required this.n2d_wind,
    required this.n2d_pressure,
    required this.n2d_humidity,
    required this.n2d_visibility,
    required this.n2d_temp,
    required this.nd_icon,
    required this.n2d_icon,
    this.name_city,
  });
}
