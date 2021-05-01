import 'package:custom_painters/src/widgets/headers/headers.dart';
import 'package:flutter/material.dart';



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