import 'package:custom_painters/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:custom_painters/src/pages/launcher_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => new ThemeChanger(1),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final appTheme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: appTheme.currentTheme,
      title: 'Diseños App',
      debugShowCheckedModeBanner: false,
      home: LauncherPage(),
    );
  }
}
