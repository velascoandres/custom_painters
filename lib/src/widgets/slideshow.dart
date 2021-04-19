import 'package:custom_painters/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;

  const SlideShow({
    Key key,
    @required this.slides,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Center(
        child: Column(
          children: [
            Expanded(
              // Para utilizar todo el espacio posible
              child: _Slides(slides),
            ),
            _Dots(slides.length),
          ],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int size;

  const _Dots(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }

  List<Widget> _buildDots() {
    return List.generate(
      size,
      (index) => _Dot(index),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageIndex >= index - 0.5 && pageIndex < index + 0.5)
            ? Colors.blue
            : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

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
        children: widget.slides.map((child) => _Slide(child)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(10),
      child: slide,
    );
  }
}
