import 'package:flutter/material.dart';

import 'package:custom_painters/src/widgets/headers.dart';


class MenuHeadersPage extends StatelessWidget {
  const MenuHeadersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'wave-page': (context) => HeadersPage(),
        'square-page': (context) => SquareHeaderPage(),
        'diagonal-page': (context) => DiagonalHeaderPage(),
        'triangular-page': (context) => TriangularHeaderPage(),
        'circular-page': (context) => CircularHeadersPage(),
        'curve-page': (context) => CurveHeadersPage(),
        'pico-page': (context) => PicoHeaderPage(),
      },
      home: Scaffold(
        body: Container(
          child: ListView(
            children: [
              ListTile(
              leading: Icon(Icons.add_box),
              title: Text('Square'),
              onTap: this._navigateTo(context, 'square-page'),
            ),
            ListTile(
              leading: Icon(Icons.square_foot),
              title: Text('Diagonal'),
              onTap: this._navigateTo(context, 'diagonal-page'),
            ),
            ListTile(
              leading: Icon(Icons.text_rotation_angledown),
              title: Text('Triangular'),
              onTap: this._navigateTo(context, 'triangular-page'),
            ),
            ListTile(
              leading: Icon(Icons.square_foot),
              title: Text('Pico'),
              onTap: this._navigateTo(context, 'pico-page'),
            ),
            ListTile(
              leading: Icon(Icons.rounded_corner),
              title: Text('Circular'),
              onTap: this._navigateTo(context, 'circular-page'),
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text('Curve'),
              onTap: this._navigateTo(context, 'curve-page'),
            ),
            ListTile(
              leading: Icon(Icons.waves),
              title: Text('Wave'),
              onTap: this._navigateTo(context, 'wave-page'),
            ),
            ListTile(
              leading: Icon(Icons.waves_sharp),
              title: Text('Gradient Wave'),
              onTap: this._navigateTo(context, 'gradient-page'),
            ),
            ],
          ),
        ),
      ),
    );
  }
  _navigateTo(BuildContext context, String route) {
    return () => Navigator.of(context).pushNamed(route);
  }
}


class HeadersPage extends StatelessWidget {
  const HeadersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.menu),
      ),
      body: WaveHeader()
    );
  }
}

class CircularHeadersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.menu),
      ),
      body: CircularHeader()
    );
  }
}

class CurveHeadersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.menu),
      ),
      body: CurveHeader()
    );
  }
}

class DiagonalHeaderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.menu),
      ),
      body: DiagonalHeader()
    );
  }
}

class PicoHeaderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.menu),
      ),
      body: PicoHeader()
    );
  }
}

class TriangularHeaderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.menu),
      ),
      body: TriangularHeader()
    );
  }
}

class SquareHeaderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.menu),
      ),
      body: SquareHeader()
    );
  }
}

class GradientWaveHeaderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.menu),
      ),
      body: GradientWaveHeader()
    );
  }
}