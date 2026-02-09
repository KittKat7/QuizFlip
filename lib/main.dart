import 'package:flutter/material.dart';
import 'package:kittkatflutterlibrary/kittkatflutterlibrary.dart';

import 'lang/en_us.dart' as en_us;
import 'models/cardlist.dart';
import 'pages/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setLangMap(en_us.en_us);
  AppTheme appTheme = AppTheme();
  Aspect.aspectWidth = 3;
  Aspect.aspectHeight = 4;
  CardList.getMasterTest();
  runApp(ThemedWidget(widget: MyApp(), theme: appTheme));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: getLang('titleApp'),
      theme: appTheme.getThemeDataLight(context),
      darkTheme: appTheme.getThemeDataDark(context),
      themeMode: appTheme.getThemeMode(context),
      home: const HomePage(),
    );
  }
}
