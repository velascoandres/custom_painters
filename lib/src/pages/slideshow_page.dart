import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              // Para utilizar todo el espacio posible
              child: _Slides(),
            ),
            _Dots(),
          ],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(),
          _Dot(),
          _Dot(),
          _Dot(),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatelessWidget {
  const _Slides({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [
          _Slide(
            svg: 'assets/svgs/slide-1.svg',
          ),
          _Slide(
            svg: 'assets/svgs/slide-2.svg',
          ),
          _Slide(
            svg: 'assets/svgs/slide-3.svg',
          ),
          _Slide(
            svg: 'assets/svgs/slide-4.svg',
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide({
    Key key,
    @required this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(10),
      child: SvgPicture.asset('$svg'),
    );
  }
}
