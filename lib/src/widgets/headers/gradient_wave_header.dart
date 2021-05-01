part of 'headers.dart';

class GradientWaveHeader extends StatelessWidget {
  const GradientWaveHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _GradientWaveHeaderPainter(),
      ),
    );
  }
}

class _GradientWaveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      stops: [
        0.2, // Valores porcentuales de cada color
        0.5,
        1.0,
      ]
    );

    final rect = new Rect.fromCircle(
        center: Offset(0.0, size.height * 0.15), radius: 180);

    // The pencil
    final paint = Paint()..shader = gradient.createShader(rect);

    // Pencil Properties
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
