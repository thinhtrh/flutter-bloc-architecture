//
// @author thinhth on 12/04/2021
//

import 'package:flutter/material.dart';

typedef StringToVoidFunc = void Function(String);

class MyTextInput extends StatelessWidget {
  const MyTextInput(
      {Key? key, this.onTextChange, this.autoFocus, this.capitalization})
      : super(key: key);

  final StringToVoidFunc? onTextChange;
  final bool? autoFocus;
  final TextCapitalization? capitalization;

  @override
  Widget build(BuildContext context) {
    final autofocus = autoFocus ?? false;
    final textCapitalization = capitalization ?? TextCapitalization.sentences;
    return TextField(
      autocorrect: false,
      autofocus: autofocus,
      textCapitalization: textCapitalization,
      onChanged: (text) {
        if (onTextChange != null) {
          onTextChange!(text);
        }
      },
    );
  }
}
