//
// @author thinhth on 12/03/2021
//

import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/ui.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton(
      {Key? key,
      this.icon,
      this.color,
      this.onPress,
      this.iconSize,
      this.alignment})
      : super(key: key);

  final IconData? icon;
  final Color? color;
  final VoidCallback? onPress;
  final double? iconSize;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    final IconData buttonIcon = icon ?? Icons.add;
    final Color buttonColor = color ?? MyColors.black;
    final VoidCallback onButtonPress = onPress ?? () {};
    final double buttonIconSize = iconSize ?? MyMetrics.defaultIconSize;
    final Alignment buttonAlignment = alignment ?? Alignment.center;
    return IconButton(
        icon: Icon(buttonIcon),
        color: buttonColor,
        onPressed: onButtonPress,
        iconSize: buttonIconSize,
        alignment: buttonAlignment,
        padding: const EdgeInsets.all(0.0));
  }
}
