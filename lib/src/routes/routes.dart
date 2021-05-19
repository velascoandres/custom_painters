import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:custom_painters/src/pages/animations_page.dart';
import 'package:custom_painters/src/pages/emergency_page.dart';
import 'package:custom_painters/src/pages/graficas_circulares_page.dart';
import 'package:custom_painters/src/pages/headers_page.dart';
import 'package:custom_painters/src/pages/pinterest_page.dart';
import 'package:custom_painters/src/pages/slideshow_page.dart';
import 'package:custom_painters/src/pages/sliver_list_page.dart';
import 'package:custom_painters/src/retos/cuadrado_animado_page.dart';


final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', MenuHeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Animated Square', CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Animated Circles', GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.pinterest, 'Slivers', SliverListPage()),
  _Route(FontAwesomeIcons.play, 'Animations', AnimationsPage()),
];




class _Route {

  final IconData icon;
  final String title;
  final Widget page;

  _Route(
    this.icon,
    this.title,
    this.page
  );


}