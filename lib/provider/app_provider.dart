import 'package:flutter/material.dart';

import '../shared/resources/colors.dart';
import '../utils/constants.dart';

class AppProvider with ChangeNotifier {
  //variables
  double result = 0.0;
  bool isDark = false;
  //functions of converting the currencies.
  double currencyConvertResult(double val) {
    while (coinWantConvert == '\$') {
      if (resultCoins == '¥') {
        result = val * 1.01;
        notifyListeners();
        return result;
      }
      if (resultCoins == '£') {
        result = val * 1.01;
        notifyListeners();
        return result;
      }
      if (resultCoins == '€') {
        result = val * 1.01;
        notifyListeners();
        return result;
      } else {
        return result = val;
      }
    }
    while (coinWantConvert == '¥') {
      if (resultCoins == '\$') {
        result = val * 0.0073;
        notifyListeners();
        return result;
      }
      if (resultCoins == '£') {
        result = val * 0.0073;
        notifyListeners();
        return result;
      }
      if (resultCoins == '€') {
        result = val * 0.0062;
        notifyListeners();
        return result;
      } else {
        return result = val;
      }
    }
    while (coinWantConvert == '£') {
      if (resultCoins == '¥') {
        result = val * 161.35;
        notifyListeners();
        return result;
      }
      if (resultCoins == '\$') {
        result = val * 1.17;
        notifyListeners();
        return result;
      }
      if (resultCoins == '€') {
        result = val * 1.18;
        notifyListeners();
        return result;
      } else {
        return result = val;
      }
    }
    while (coinWantConvert == '€') {
      if (resultCoins == '¥') {
        result = val * 136.28;
        notifyListeners();
        return result;
      }
      if (resultCoins == '£') {
        result = val * 0.85;
        notifyListeners();
        return result;
      }
      if (resultCoins == '\$') {
        result = val * 0.99;
        notifyListeners();
        return result;
      } else {
        return result = val;
      }
    }
    return result;
  }

  //change themes.
  changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  //change colors.
  changeColor(Color color) {
    primary = color;
    notifyListeners();
  }
}
