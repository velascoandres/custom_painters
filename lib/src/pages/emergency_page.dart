import 'package:custom_painters/src/widgets/fat_button.dart';
import 'package:custom_painters/src/widgets/headers/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

final items = <ItemBoton>[
  new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
      Color(0xff906EF5)),
  new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
      Color(0xff536CF6)),
  new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      Color(0xffF2D572), Color(0xffE06AA3)),
  new ItemBoton(
      FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
  new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
      Color(0xff906EF5)),
  new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
      Color(0xff536CF6)),
  new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      Color(0xffF2D572), Color(0xffE06AA3)),
  new ItemBoton(
      FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
  new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
      Color(0xff906EF5)),
  new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
      Color(0xff536CF6)),
  new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      Color(0xffF2D572), Color(0xffE06AA3)),
  new ItemBoton(
      FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
];

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLarge = MediaQuery.of(context).size.height > 550;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top:  isLarge ? MediaQuery.of(context).size.height * 0.15 : 0,
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                isLarge ? SizedBox(height: 80) : Container(),
                ...items.map(
                  (item) => FadeInLeft(
                    duration: Duration(milliseconds: 500),
                    child: BotonGordo(
                      onPress: () {},
                      icon: item.icon,
                      texto: item.texto,
                      color1: item.color1,
                      color2: item.color2,
                    ),
                  ),
                )
              ],
            ),
          ),
          isLarge ? _Encabezado() : Container(),
        ],
      ),
    );
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia Médica',
          subtitulo: 'Haz solicitado',
          colorPrimario: Color(0xff66A9F2),
          colorSecundario: Color(0xff536CF6),
        ),
        Positioned(
          right: 0,
          top: 40,
          child: RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.0),
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white),
          ),
        )
      ],
    );
  }
}

class BotonTemp extends StatelessWidget {
  const BotonTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      texto: 'Minor accident',
      onPress: () {
        print('Algo');
      },
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
