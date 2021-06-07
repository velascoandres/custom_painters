import 'package:custom_painters/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final textColor = Provider.of<ThemeChanger>(context).currentTheme.accentColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Headers'),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text('Headers Painters', style: TextStyle(color: textColor)),
              onTap: this._navigateTo(context, 'painters-page'),
            ),
            ListTile(
              leading: Icon(Icons.waves_sharp),
              title: Text('Animations', style: TextStyle(color: textColor)),
              onTap: this._navigateTo(context, 'animations-page'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_outlined),
              title: Text('Cuadrado animado', style: TextStyle(color: textColor)),
              onTap: this._navigateTo(context, 'cuadrado-animado-page'),
            ),
            ListTile(
              leading: Icon(Icons.blur_circular),
              title: Text('Circular progress', style: TextStyle(color: textColor)),
              onTap: this._navigateTo(context, 'circular-progress-page'),
            ),
            ListTile(
              leading: Icon(Icons.medical_services),
              title: Text('Emergency', style: TextStyle(color: textColor)),
              onTap: this._navigateTo(context, 'emergency-page'),
            ),
            ListTile(
              leading: Icon(Icons.slideshow_rounded),
              title: Text('Slideshow', style: TextStyle(color: textColor)),
              onTap: this._navigateTo(context, 'slideshow-page'),
            ),
            ListTile(
              leading: Icon(Icons.photo_camera_sharp),
              title: Text('Pinterest Page', style: TextStyle(color: textColor)),
              onTap: this._navigateTo(context, 'pinterest-page'),
            ),
            ListTile(
              leading: Icon(Icons.slow_motion_video),
              title: Text('Sliver Page', style: TextStyle(color: textColor)),
              onTap: this._navigateTo(context, 'sliver-page'),
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
