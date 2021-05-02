import 'package:flutter/material.dart';

class BotonGordo extends StatelessWidget {
  const BotonGordo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BotonGordoBackground();
  }
}

class _BotonGordoBackground extends StatelessWidget {
  const _BotonGordoBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Color(0xff6989F5),
            Color(0xff906EF5),
          ],
        ),
      ),
    );
  }
}
