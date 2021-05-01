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
              title: Text('Headers Painters'),
              onTap: this._navigateTo(context, 'painters-page'),
            ),
            ListTile(
              leading: Icon(Icons.waves_sharp),
              title: Text('Animations'),
              onTap: this._navigateTo(context, 'animations-page'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_outlined),
              title: Text('Cuadrado animado'),
              onTap: this._navigateTo(context, 'cuadrado-animado-page'),
            ),
            ListTile(
              leading: Icon(Icons.blur_circular),
              title: Text('Circular progress'),
              onTap: this._navigateTo(context, 'circular-progress-page'),
            ),
            ListTile(
              leading: Icon(Icons.medical_services),
              title: Text('Emergency'),
              onTap: this._navigateTo(context, 'emergency-page'),
            ),
            ListTile(
              leading: Icon(Icons.slideshow_rounded),
              title: Text('Slideshow'),
              onTap: this._navigateTo(context, 'slideshow-page'),
            ),
            ListTile(
              leading: Icon(Icons.photo_camera_sharp),
              title: Text('Pinterest Page'),
              onTap: this._navigateTo(context, 'pinterest-page'),
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
