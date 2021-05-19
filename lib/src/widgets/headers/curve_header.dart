part of 'headers.dart';

class CurveHeader extends StatelessWidget {

  final Color color;

  const CurveHeader({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _CurveHeaderPainter(this.color),
      ),
    );
  }
}

class _CurveHeaderPainter extends CustomPainter {

  final Color color;

  _CurveHeaderPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    // The pencil
    final paint = Paint();

    // Pencil Properties
    paint.color = this.color;
    paint.style = PaintingStyle.fill; // .stroke solo es para lineas
    paint.strokeWidth = 21.0;

    final path = new Path();
    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.2);
    // El primer punto es por donde pasara la curva
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.4,
      size.width,
      size.height * 0.2,
    );
    path.lineTo(size.width, 0);
    // Cuando esta con .fill automaticamente cierra la figura y pinta
    // path.lineTo(0, size.height * 0.5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
