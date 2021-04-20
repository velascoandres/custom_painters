import 'package:custom_painters/src/widgets/pinterest_meu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

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

    return Positioned.fill(
      bottom: 10,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: PinterestMenu(
          show: provider.show,
          activeColor: Colors.red,
          backgroundColor: Colors.amber,
          inactiveColor: Colors.black45,
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
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
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
