//
// @author thinhth on 12/06/2021
//

import 'package:easy_localization/easy_localization.dart';

class Translations {
  static String translate(String key,
      {List<String>? args, Map<String, String>? namedArgs}) {
    return tr(key, args: args, namedArgs: namedArgs);
  }
}
