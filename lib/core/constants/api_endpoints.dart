class ApiEndpoints {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String appIdDev = "cc95d932d5a45d33a9527d5019475f2c";
  static String currentWeatherByName(String city) => '$baseUrl/weather?q=$city&appid=$appIdDev';
  static String weatherIcon(String iconCode) => 'http://openweathermap.org/img/wn/$iconCode@2x.png';
  static const String login = '/auth/login/';
}
