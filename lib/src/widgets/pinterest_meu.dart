import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenuButton {
  final Function onPressed;
  final IconData icon;

  PinterestMenuButton({this.onPressed, this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool show;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  final List<PinterestMenuButton> items;

  PinterestMenu({
    Key key,
    @required this.items,
    this.show = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Builder(
        builder: (BuildContext context) {
          final provider = Provider.of<_MenuModel>(context);
          provider.backgroundColor = this.backgroundColor;
          provider.activeColor = this.activeColor;
          provider.inactiveColor = this.inactiveColor;
          return AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: show ? 1 : 0,
            child: _PinterestMenuBackground(
              child: _MenuItems(items),
            ),
          );
        },
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({this.child});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_MenuModel>(context);
    return Container(
      child: this.child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: provider.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5),
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestMenuButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (index) => _PinterestMenuItem(index, menuItems[index]),
      ),
    );
  }
}

class _PinterestMenuItem extends StatelessWidget {
  final int index;
  final PinterestMenuButton item;

  _PinterestMenuItem(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_MenuModel>(context);
    final itemSeleccionado = provider.itemSeleccionado;
    final color = itemSeleccionado == index ? provider.activeColor : provider.inactiveColor;

    final double size = itemSeleccionado == index ? 30 : 25;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: size,
          color: color,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color _backgroundColor;
  Color _activeColor;
  Color _inactiveColor;

  int get itemSeleccionado => this._itemSeleccionado;

  Color get backgroundColor => this._backgroundColor;
  Color get activeColor => this._activeColor;
  Color get inactiveColor => this._inactiveColor;

  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }

  set backgroundColor(Color color) {
    this._backgroundColor = color;
    // notifyListeners();
  }

  set activeColor(Color color) {
    this._activeColor = color;
    // notifyListeners();
  }

  set inactiveColor(Color color) {
    this._inactiveColor = color;
    // notifyListeners();
  }
}
