import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  // Que tipo de cosa se quiere animar
  Animation<double> rotacion;

  @override
  void initState() {
    this.animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );
    this.rotacion = Tween(
      begin: 0.0,
      end: 2.0,
    ).animate(this.animationController);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Play - Reproduccion
    this.animationController.forward();

    return AnimatedBuilder(
      animation: this.animationController,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        
        return Transform.rotate(
          angle: rotacion.value,
          child: child,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
