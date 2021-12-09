import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/blocs.dart';
import 'package:todo_bloc/ui/ui.dart';
import 'package:todo_bloc/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await EasyLocalization.ensureInitialized();
  // await initializeDateFormatting('en_EN', null);
  BlocOverrides.runZoned(() => runApp(
        EasyLocalization(
            useOnlyLangCode: true,
            supportedLocales: const [Locale('en'), Locale('vi')],
            path:
                'assets/translations', // <-- change the path of the translation files
            fallbackLocale: const Locale('en'),
            child: BlocProvider(
              create: (_) => ModalsBloc(),
              child: const TodosApp(),
            )),
      ));
}

class TodosApp extends StatelessWidget {
  const TodosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // routes: MainRoutes.routes(context),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale, //const Locale('vi', ''),
        navigatorKey: Navigation.navigatorKey,
        initialRoute: MainRoutes.home,
        onGenerateRoute: (settings) => MainRoutes.onGenerateRoute(settings));
  }
}
