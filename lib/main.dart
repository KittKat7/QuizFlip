import 'package:flutter/material.dart';
import 'package:kittkatflutterlibrary/kittkatflutterlibrary.dart';

import 'models/cardlist.dart';
import 'pages/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppTheme appTheme = AppTheme();
  CardList.getMaster();
  runApp(ThemedWidget(widget: MyApp(), theme: appTheme));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme.getThemeDataLight(context),
      darkTheme: appTheme.getThemeDataDark(context),
      themeMode: appTheme.getThemeMode(context),
      home: const HomePage(),
    );
  }
}
