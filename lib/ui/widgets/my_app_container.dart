//
// @author thinhth on 12/03/2021
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/blocs.dart';
import 'package:todo_bloc/ui/ui.dart';
import 'package:todo_bloc/utils/utils.dart';

class MyAppContainer extends StatelessWidget {
  const MyAppContainer(
      {Key? key,
      this.child,
      this.hideHeader,
      this.title,
      this.hideLeft,
      this.leftWidget,
      this.rightWidget})
      : super(key: key);

  final Widget? child;
  final bool? hideHeader;
  final String? title;
  final bool? hideLeft;
  final Widget? leftWidget;
  final Widget? rightWidget;

  @override
  Widget build(BuildContext context) {
    final hideHeaderContainer = hideHeader ?? false;
    final headerTitle = title ?? "";

    Future<bool> onBackPressed() async {
      Loggers.d("onBackPressed");
      //TODO do something
      return true;
    }

    return WillPopScope(
        child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  hideHeaderContainer
                      ? Container()
                      : HeaderContainer(
                      hideLeft: hideLeft,
                      leftWidget: leftWidget,
                      headerTitle: headerTitle,
                      rightWidget: rightWidget),
                  child ?? Container(),
                ],
              ),
              const ModalContainer(),
            ],
          ),
        ),
        onWillPop: onBackPressed);
  }
}

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    Key? key,
    required this.hideLeft,
    required this.leftWidget,
    required this.headerTitle,
    required this.rightWidget,
  }) : super(key: key);

  final bool? hideLeft;
  final Widget? leftWidget;
  final String headerTitle;
  final Widget? rightWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyMetrics.height(76) + MyMetrics.getTopPadding(context),
      padding: EdgeInsets.fromLTRB(MyMetrics.spacingXL,
          MyMetrics.getTopPadding(context), MyMetrics.spacingXL, 0),
      color: MyColors.grey,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: hideLeft == true
                  ? Container(width: MyMetrics.defaultIconSize)
                  : leftWidget ??
                      MyIconButton(
                        icon: Icons.arrow_back_ios,
                        onPress: () {
                          Navigation.pop();
                        },
                        alignment: Alignment.centerLeft,
                      )),
          Flexible(
            child: MyText(
              text: headerTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: MyFonts.titleSize, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: rightWidget ??
                Container(
                  width: MyMetrics.defaultIconSize,
                ),
          ),
        ],
      ),
    );
  }
}
