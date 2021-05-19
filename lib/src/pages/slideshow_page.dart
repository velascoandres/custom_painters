import 'package:custom_painters/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:custom_painters/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final primaryColor = appTheme.currentTheme.primaryColor;

    return Scaffold(
      backgroundColor: (appTheme.darkTheme) ? primaryColor : Colors.white,
      body: Column(
        children: [
          Expanded(child: MiSlideShow()),
          Expanded(child: MiSlideShow()),
        ],
      ),
    );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideShow(
        slides: [
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-4.svg'),
          SvgPicture.asset('assets/svgs/slide-5.svg'),
          SvgPicture.asset('assets/svgs/slide-6.svg'),
        ],
        dotsTop: false,
        primaryColor: Colors.black87,
        secondaryColor: Colors.white,
        primaryDotSize: 25.0,
        secondaryDotSize: 12.0);
  }
}
