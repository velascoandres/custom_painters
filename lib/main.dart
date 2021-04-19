import 'package:flutter/material.dart';

import 'package:custom_painters/src/pages/slideshow_page.dart';
import 'package:custom_painters/src/pages/graficas_circulares_page.dart';
import 'package:custom_painters/src/retos/cuadrado_animado_page.dart';
import 'package:custom_painters/src/pages/animations_page.dart';
import 'package:custom_painters/src/pages/headers_page.dart';
import 'package:custom_painters/src/pages/menu_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'menu-page',
      routes: {
        'wave-page': (context) => HeadersPage(),
        'square-page': (context) => SquareHeaderPage(),
        'diagonal-page': (context) => DiagonalHeaderPage(),
        'triangular-page': (context) => TriangularHeaderPage(),
        'circular-page': (context) => CircularHeadersPage(),
        'curve-page': (context) => CurveHeadersPage(),
        'pico-page': (context) => PicoHeaderPage(),
        'menu-page': (context) => MenuPage(),
        'gradient-page': (context) => GradientWaveHeaderPage(),
        'animations-page': (context) => AnimationsPage(),
        'cuadrado-animado-page': (context) => CuadradoAnimadoPage(),
        'circular-progress-page': (context) => GraficasCircularesPage(),
        'slideshow-page': (context) => SlideshowPage(),
      },
    );
  }
}
