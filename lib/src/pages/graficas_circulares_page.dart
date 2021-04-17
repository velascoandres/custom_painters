import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key key}) : super(key: key);

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentaje += 10;
          if (porcentaje > 100) {
            porcentaje = 0;
          }
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: Text(
          '$porcentaje %',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}
