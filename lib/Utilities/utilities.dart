import 'package:Cloudy/Resources/Images/image_assets.dart';
import 'package:intl/intl.dart';

class Utilities {
  static Map<String, String> imageMap = {
    'snow': ImageAssets.snow,
    'rain': ImageAssets.rain,
    'fog': ImageAssets.fog,
    'wind': ImageAssets.wind,
    'cloudy': ImageAssets.cloudy,
    'partly-cloudy-day': ImageAssets.partlyCloudyDay,
    'partly-cloudy-night': ImageAssets.partlyCloudyNight,
    'clear-day': ImageAssets.clearDay,
    'clear-night': ImageAssets.clearNight,
    'snow-showers-day': ImageAssets.snowShowersDay,
    'snow-showers-night': ImageAssets.snowShowersNight,
    'thunder-rain': ImageAssets.thunderRain,
    'thunder-showers-day': ImageAssets.thunderShowersDay,
    'thunder-showers-night': ImageAssets.thunderShowersNight,
    'showers-day': ImageAssets.showersDay,
    'showers-night': ImageAssets.showersNight,
  };

// ---FormatedDate--
  static String formatedDate(DateTime date) {
    return DateFormat('EEEE d MMM').format(date);
  }

// ---ExtractDate--
  static String extractDate(String date) {
    return DateTime.parse(date).day.toString();
  }

// ---ExtractDay--
  static String extractDay(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formatedDate = DateFormat('EEEE').format(dateTime);
    String abbreviatedDay = formatedDate.substring(0, 3);
    return abbreviatedDay;
  }

  static String formattedTime(String time) {
    return DateFormat('h:mm a').format(DateTime.parse('2024-08-08T$time'));
  }

  static String formattedTimewithoutparsing(String time) {
    return DateFormat('h:00 a').format(DateTime.parse(time));
  }

// ---CurrentTime---
  static String currentTime() {
    return DateFormat('hh:mm a').format(DateTime.now()).toString();
  }

  static String formateTimeWithoutAmPm(String time) {
    return DateFormat('hh:mm').format(DateTime.parse('2024-08-08T$time'));
  }

  static String formateTimeWithoutAmPmwithoutpar(DateTime time) {
    return DateFormat('hh:00').format(time);
  }

  static bool checkTime(String time) {
    return DateFormat('hh a').format(DateTime.parse('2024-08-08T$time')) ==
        DateFormat('hh a').format(DateTime.now());
  }
}
