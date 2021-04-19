import 'package:custom_painters/src/models/slider_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
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
          _Dot(0),
          _Dot(1),
          _Dot(2),
          _Dot(3),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageIndex = Provider.of<SliderModel>(context).currentPage;

    return Container(
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: pageIndex == index ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key key}) : super(key: key);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final PageController pageController = new PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      // Actualizar el provider, sliderModel
      // Siempre que se lo usa en el initState se lo pone en false
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageController.page;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageController,
        children: [
          _Slide(svg: 'assets/svgs/slide-1.svg'),
          _Slide(svg: 'assets/svgs/slide-2.svg'),
          _Slide(svg: 'assets/svgs/slide-3.svg'),
          _Slide(svg: 'assets/svgs/slide-4.svg'),
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
