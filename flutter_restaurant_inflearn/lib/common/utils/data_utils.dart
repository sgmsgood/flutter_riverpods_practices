import 'package:flutter_restaurant_inflearn/common/const/data.dart';

class DataUtils {
  static String pathToUrl(String value) {
    return 'http://$localIp$value';
  }

  static List<String> listPathsToUrls(List paths) {
    return paths.map((e) => pathToUrl(e)).toList();
  }
}