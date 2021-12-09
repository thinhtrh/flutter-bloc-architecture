//
// @author thinhth on 12/02/2021
//

import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/ui.dart';
import 'package:todo_bloc/utils/utils.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({Key? key, this.text, this.onPress}) : super(key: key);

  final String? text;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final buttonText = text ?? "";
    final VoidCallback onPressed = onPress ??
        () {
          Loggers.d("MyTextButton pressed");
        };

    return Container(
      child: TextButton(
        child: MyText(text: buttonText),
        onPressed: onPressed,
        style: const ButtonStyle(),
      ),
    );
  }
}
