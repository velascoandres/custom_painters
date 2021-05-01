import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Headers'),
      ),
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
            ListTile(
              leading: Icon(Icons.waves_sharp),
              title: Text('Animations'),
              onTap: this._navigateTo(context, 'animations-page'),
            ),
             ListTile(
              leading: Icon(Icons.airplanemode_active),
              title: Text('Cuadrado animado'),
              onTap: this._navigateTo(context, 'cuadrado-animado-page'),
            ),
            ListTile(
              leading: Icon(Icons.airplanemode_active),
              title: Text('Circular progress'),
              onTap: this._navigateTo(context, 'circular-progress-page'),
            ),
            ListTile(
              leading: Icon(Icons.medical_services),
              title: Text('Emergency'),
              onTap: this._navigateTo(context, 'emergency-page'),
            ),
          ],
        ),
      ),
    );
  }

  _navigateTo(BuildContext context, String route) {
    return () => Navigator.of(context).pushNamed(route);
  }
}
