import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  RadialProgress({
    @required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.grosorSecundario = 20,
    this.grosorPrimario = 20,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double porcentajeAnterior = 0.0;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar) +
                  diferenciaAnimar * controller.value,
              widget.colorPrimario,
              widget.colorSecundario,
              widget.grosorSecundario,
              widget.grosorPrimario,
            ),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final double porcentaje;
  final Color primaryColor;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  _MiRadialProgress(
    this.porcentaje,
    this.primaryColor,
    this.colorSecundario,
    this.grosorSecundario,
    this.grosorPrimario,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // Texto Porcentaje
    TextSpan span = new TextSpan(
      style: new TextStyle(
        color: Colors.blue[800],
        fontSize: 24.0,
        fontFamily: 'Roboto',
      ),
      text: '${porcentaje.ceil()}%',
    );

    TextPainter tp = new TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
    tp.layout();
    tp.paint(
        canvas,
        new Offset(
          porcentaje < 10 ? size.width * 0.45 : size.width * 0.37,
          size.height * 0.4,
        ));

    // Circulo completado
    final paint = new Paint()
      ..strokeWidth = this.grosorSecundario
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height * 0.5);
    double radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    // Arco
    // final paintArco = new Paint()
    //   ..strokeWidth = this.grosorPrimario
    //   ..color = primaryColor
    //   ..style = PaintingStyle.stroke;

    // // Parte que se debera ir llenando

    // double arcAngle = 2 * pi * (porcentaje / 100);
    // canvas.drawArc(
    //   Rect.fromCircle(
    //       center: center, radius: radio), // Espacio donde se va ubicar
    //   -pi / 2,
    //   arcAngle,
    //   false,
    //   paintArco,
    // );
    // Circulos referencia
    final paintCirculoPequenios = new Paint()
      ..strokeWidth = this.grosorSecundario
      ..color = this.colorSecundario
      ..style = PaintingStyle.fill;
    this.dibujarCirculos(paintCirculoPequenios, canvas, 100.0, radio, 5);
    // Circulo progreso
    final paintCirculo = new Paint()
      ..strokeWidth = this.grosorPrimario
      ..color = this.primaryColor
      ..style = PaintingStyle.fill;
    this.dibujarCirculos(paintCirculo, canvas, porcentaje, radio, 10);
    // 360 / 18 = 20
    // angulo inicial = 0
    // x1, y1 = 0,r
    // sen(20) = x2/r
    // x2 = r * sen(20)
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void dibujarCirculos(
    Paint paint,
    Canvas canvas,
    double covertura,
    double radio,
    double radioCirculo,
  ) {
    for (int i = 0; i <= covertura.ceil(); i += 5) {
      double angulo = 2 * pi * (i / 100);
      double x2 = radio * sin(angulo);
      double y2 = radio * cos(angulo);
      print(angulo);
      canvas.drawCircle(
        Offset(x2 + radio, -y2 + radio),
        radioCirculo,
        paint,
      );
    }
  }
}
