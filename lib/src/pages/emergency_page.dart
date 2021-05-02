import 'package:custom_painters/src/widgets/fat_button.dart';
import 'package:custom_painters/src/widgets/headers/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BotonGordo(
          texto: 'Minor accident',
          onPress: () {
            print('Algo');
          },
        ),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      titulo: 'Asistencia Médica',
      subtitulo: 'Haz solicitado',
      colorPrimario: Color(0xff526BF6),
      colorSecundario: Color(0xff67ACF2),
    );
  }
}
