//
// @author: thinhth on 12/01/2021
//
import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/themes/colors.dart';
import 'package:todo_bloc/ui/ui.dart';

class MyText extends StatelessWidget {
  const MyText(
      {Key? key,
      this.text,
      this.padding,
      this.textAlign,
      this.maxLines,
      this.style})
      : super(key: key);

  final String? text;
  final EdgeInsets? padding;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final String txt = text ?? "";
    final EdgeInsets txtPadding = padding ?? const EdgeInsets.all(0.0);
    final TextAlign txtAlign = textAlign ?? TextAlign.start;
    final int txtMaxLines = maxLines ?? 1;
    final TextStyle defaultStyle = TextStyle(
        color: MyColors.black,
        fontSize: MyFonts.contentSize,
        height: 1.5,
        fontWeight: FontWeight.normal,
        fontFamily: 'Roboto');
    final TextStyle textStyle = defaultStyle.merge(style);

    return Container(
      padding: txtPadding,
      child: Text(
        txt,
        textAlign: txtAlign,
        maxLines: txtMaxLines,
        overflow: TextOverflow.ellipsis,
        style: textStyle,
      ),
    );
  }
}
