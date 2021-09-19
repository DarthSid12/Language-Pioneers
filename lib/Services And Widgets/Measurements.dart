import 'package:flutter/cupertino.dart';

class Measurements {
  static double width(BuildContext context, {double multiplier = 1}) {
    return MediaQuery.of(context).size.width * multiplier;
  }

  static double height(BuildContext context, {double multiplier = 1}) {
    return MediaQuery.of(context).size.height * multiplier;
  }

  static bool isLaptop(BuildContext context) {
    return width(context) > 980;
  }
}
