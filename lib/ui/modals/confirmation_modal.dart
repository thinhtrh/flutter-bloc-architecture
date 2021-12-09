//
// @author thinhth on 12/06/2021
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/blocs.dart';
import 'package:todo_bloc/ui/ui.dart';
import 'package:todo_bloc/utils/translations.dart';

class ConfirmationModal extends StatelessWidget {
  const ConfirmationModal(
      {Key? key,
      this.title,
      this.content,
      this.cancelText,
      this.submitText,
      this.onSubmit})
      : super(key: key);
  final String? title;
  final String? content;
  final String? cancelText;
  final String? submitText;
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModalsBloc, ModalsState>(
      builder: (context, state) {
        final modalsBloc = context.read<ModalsBloc>();

        final modalTitle = title ?? Translations.translate("confirmation");
        final modalContent = content ?? "";
        final modalCancelText = cancelText ?? Translations.translate("no");
        final modalSubmitText = submitText ?? Translations.translate("yes");
        final modalSubmitFunction = onSubmit ?? () {};

        return Container(
          width: MyMetrics.getScreenWidth(context) - MyMetrics.width(40) * 2,
          padding:
              EdgeInsets.fromLTRB(0, MyMetrics.spacingL, 0, MyMetrics.spacingL),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: MyColors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyText(
                text: modalTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MyFonts.titleSize,
                ),
              ),
              Container(
                padding: EdgeInsets.all(MyMetrics.spacingXL),
                child: MyText(
                  textAlign: TextAlign.center,
                  text: modalContent,
                  maxLines: 10,
                ),
              ),
              Container(
                height: 1,
                color: MyColors.black.withOpacity(0.1),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: MyTextButton(
                    text: modalCancelText,
                    onPress: () {
                      modalsBloc.add(HideModal1Event());
                    },
                  )),
                  Container(
                    height: MyMetrics.spacingXXL,
                    width: 1,
                    color: MyColors.black.withOpacity(0.1),
                  ),
                  Expanded(
                      child: MyTextButton(
                    text: modalSubmitText,
                    onPress: () {
                      modalsBloc.add(HideModal1Event());
                      modalSubmitFunction();
                    },
                  ))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
