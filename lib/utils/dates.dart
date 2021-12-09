//
// @author thinhth on 12/02/2021
//

import 'package:intl/intl.dart';

class Dates {
  static String convertUTCToLocalTime(String utc,
      {String format = "dd/MM/yy"}) {
    if (utc.isNotEmpty) {
      var strToDateTime = DateTime.parse(utc);
      final convertLocal = strToDateTime.toLocal();
      var newFormat = DateFormat(format);
      String updatedDt = newFormat.format(convertLocal);
      return updatedDt;
    }
    return "";
  }
}
