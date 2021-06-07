import 'package:custom_painters/src/models/layout_model.dart';
import 'package:custom_painters/src/pages/launcher_tablet_page.dart';
import 'package:custom_painters/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:custom_painters/src/pages/launcher_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeChanger>(
            create: (_) => new ThemeChanger(1),
          ),
           ChangeNotifierProvider<LayoutModel>(
            create: (_) => new LayoutModel(),
          ),
        ],
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
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
    );
  }
}
