import 'package:custom_painters/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlideshowPage();

  set currentPage(Widget page) {
    this._currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => this._currentPage;

}
