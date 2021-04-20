import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsTop;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryDotSize;
  final double secondaryDotSize;

  const SlideShow({
    Key key,
    @required this.slides,
    this.dotsTop = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryDotSize = 12,
    this.secondaryDotSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SliderModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SliderModel>(context).primaryColor =
                  this.primaryColor;
              Provider.of<_SliderModel>(context).secondaryColor =
                  this.secondaryColor;
              Provider.of<_SliderModel>(context).primaryDotSize =
                  this.primaryDotSize;
              Provider.of<_SliderModel>(context).secondaryDotSize =
                  this.secondaryDotSize;
              return _SliderShowStruct(dotsTop: dotsTop, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _SliderShowStruct extends StatelessWidget {
  const _SliderShowStruct({
    Key key,
    @required this.dotsTop,
    @required this.slides,
  }) : super(key: key);

  final bool dotsTop;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.dotsTop) _Dots(slides.length),
        Expanded(
          // Para utilizar todo el espacio posible
          child: _Slides(slides),
        ),
        if (!this.dotsTop) _Dots(slides.length),
      ],
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
    final slideModel = Provider.of<_SliderModel>(context);
    double dotSize = 0;
    Color dotColor;
    if (slideModel.currentPage >= index - 0.5 &&
        slideModel.currentPage < index + 0.5) {
      dotColor = slideModel.primaryColor;
      dotSize = slideModel.primaryDotSize;
    } else {
      dotColor = slideModel.secondaryColor;
      dotSize = slideModel.secondaryDotSize;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: dotSize,
      height: dotSize,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: dotColor,
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
      Provider.of<_SliderModel>(context, listen: false).currentPage =
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

class _SliderModel with ChangeNotifier {
  double _currentPage = 0;

  Color _primaryColor;
  Color _secondaryColor;

  double _primaryDotSize;
  double _secondaryDotSize;

  double get primaryDotSize => this._primaryDotSize;
  double get secondaryDotSize => this._secondaryDotSize;

  double get currentPage => this._currentPage;

  Color get primaryColor => this._primaryColor;
  Color get secondaryColor => this._secondaryColor;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  set primaryColor(Color color) {
    this._primaryColor = color;
  }

  set secondaryColor(Color color) {
    this._secondaryColor = color;
  }

  set secondaryDotSize(double size) {
    this._secondaryDotSize = size;
  }

  set primaryDotSize(double size) {
    this._primaryDotSize = size;
  }
}
