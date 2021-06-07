import 'package:custom_painters/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:custom_painters/src/widgets/pinterest_meu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        // body: PinterestMenu()
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_MenuModel>(context);
    final appTheme = Provider.of<ThemeChanger>(context);
    final primaryColor = appTheme.currentTheme.primaryColor;
    final accentColor = appTheme.currentTheme.accentColor;
    final backgroundColor = appTheme.currentTheme.scaffoldBackgroundColor;

    return Positioned.fill(
      bottom: 10,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: PinterestMenu(
          items: [
            PinterestMenuButton(
              icon: Icons.pie_chart,
              onPressed: () {
                print('Icon pie_chart');
              },
            ),
            PinterestMenuButton(
              icon: Icons.search,
              onPressed: () {
                print('Icon search');
              },
            ),
            PinterestMenuButton(
              icon: Icons.notifications,
              onPressed: () {
                print('Icon notificartion');
              },
            ),
            PinterestMenuButton(
              icon: Icons.supervised_user_circle,
              onPressed: () {
                print('Icon supervised_user_circle');
              },
            ),
          ],
          show: provider.show,
          activeColor: accentColor,
          backgroundColor: backgroundColor,
          inactiveColor: Colors.grey,
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  PinterestGrid({Key key}) : super(key: key);

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    final provider = Provider.of<_MenuModel>(context, listen: false);
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        // Ocultar menu
        provider.show = false;
      } else {
        // Mostrar menu
        provider.show = true;
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count = 2;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    }

    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;

  set show(bool value) {
    this._show = value;
    notifyListeners();
  }
}
