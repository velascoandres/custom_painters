import 'package:custom_painters/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:custom_painters/src/pages/launcher_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => new ThemeChanger(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños App',
      debugShowCheckedModeBanner: false,
      home: LauncherPage(),
      // initialRoute: 'menu-page',
    );
  }
}
