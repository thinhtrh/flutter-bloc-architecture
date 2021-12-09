//
// @author thinhth on 12/08/2021
//

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MySwitchLanguage extends StatelessWidget {
  const MySwitchLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onChange(bool value) {
      final Locale locale = Locale(value ? 'en' : 'vi');
      EasyLocalization.of(context)!.setLocale(locale);
    }

    return Switch(
      onChanged: onChange,
      value: context.locale == const Locale('en'),
    );
  }
}
