//
// @author thinhth on 12/04/2021
//

import 'package:flutter/material.dart';

class Navigation {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void push(String routeName) {
    navigatorKey.currentState?.pushNamed(routeName);
    // BuildContext? buildContext = navigatorKey.currentContext;
    // if (buildContext != null) {
    //   Navigator.pushNamed(buildContext, routeName);
    // }
  }

  static void pop() {
    navigatorKey.currentState?.maybePop();
  }

  static getCurrentRouteName(BuildContext context) {
    // return ModalRoute.of(context)!.settings.name;

    BuildContext? _context = navigatorKey.currentContext;
    if (_context != null) {
      ModalRoute? modalRoute = ModalRoute.of(_context);
      if (modalRoute != null) {
        return modalRoute.settings.name;
      }
      return null;
    }
    return null;
  }

  static isRouteName(String routeName) {
    return ModalRoute.withName(routeName);
  }
}
