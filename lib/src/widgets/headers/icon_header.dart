part of 'headers.dart';

class IconHeader extends StatelessWidget {
  final Color colorBlanco = Colors.white.withOpacity(0.7);

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color colorPrimario;
  final Color colorSecundario;

  IconHeader({
    Key key,
    @required this.icon,
    @required this.titulo,
    @required this.subtitulo,
    this.colorPrimario = Colors.white,
    this.colorSecundario = Colors.blueGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(
          color1: this.colorPrimario,
          color2: this.colorSecundario,
        ),
        Positioned(
          top: -50,
          child: FaIcon(
            this.icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            SizedBox(height: 80, width: double.infinity),
            Text(
              '${this.subtitulo}',
              style: TextStyle(fontSize: 20, color: this.colorBlanco),
            ),
            SizedBox(height: 20),
            Text(
              '${this.titulo}',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            FaIcon(
              this.icon,
              size: 80,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground({
    Key key,
    @required this.color1,
    @required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            this.color1,
            this.color2,
          ],
        ),
      ),
    );
  }
}
