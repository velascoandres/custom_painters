import 'package:custom_painters/src/pages/emergency_page.dart';
import 'package:custom_painters/src/pages/menu_page.dart';
import 'package:custom_painters/src/pages/pinterest_page.dart';
import 'package:flutter/material.dart';

import 'package:custom_painters/src/pages/slideshow_page.dart';
import 'package:custom_painters/src/pages/graficas_circulares_page.dart';
import 'package:custom_painters/src/retos/cuadrado_animado_page.dart';
import 'package:custom_painters/src/pages/animations_page.dart';
import 'package:custom_painters/src/pages/headers_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'menu-page',
      routes: {
        'menu-page': (context) => MenuPage(),
        'painters-page': (context) => MenuHeadersPage(),
        'animations-page': (context) => AnimationsPage(),
        'cuadrado-animado-page': (context) => CuadradoAnimadoPage(),
        'circular-progress-page': (context) => GraficasCircularesPage(),
        'emergency-page': (context) => EmergencyPage(),
        'slideshow-page': (context) => SlideshowPage(),
        'pinterest-page': (context) => PinterestPage(),
      },
    );
  }
}
