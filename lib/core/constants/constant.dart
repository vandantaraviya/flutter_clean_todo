class Constant {
  // Private constructor
  Constant._internal();

  // Factory constructor to return the same instance
  factory Constant() {
    return Constant._internal();
  }

  static const String baseUrlProd = "https://google.com/api";
  static const String baseUrlDev = "https://api.openweathermap.org/data/2.5/";

  static const String appName = "flutter_clean_todo";
  static const String appNameDev = "flutter_clean_todo";
  static const String sendbirdApplicationID = "-----[EnterYourID]-----";
  static const String appVersionIOS = "Version :- 1.0.0(22)";
  static const String appVersionAndroid = "Version :- 1.0.0(22)";
}
