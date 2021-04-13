part of 'headers.dart';


class WaveHeader extends StatelessWidget {
  const WaveHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _WaveHeaderPainter(),
      ),
    );
  }
}

class _WaveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // The pencil
    final paint = Paint();

    // Pencil Properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .stroke solo es para lineas
    paint.strokeWidth = 21.0;

    final path = new Path();
    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    // El primer punto es por donde pasara la curva
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.30,
      size.width * 0.5,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.2,
      size.width,
      size.height * 0.25,
    );

    path.lineTo(size.width, 0);
    // Para la wave invertida
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    // Cuando esta con .fill automaticamente cierra la figura y pinta
    // path.lineTo(0, size.height * 0.5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
