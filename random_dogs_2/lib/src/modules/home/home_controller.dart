class HomeController {
  int _actualIndex = 1;

  get actualIndex => _actualIndex;

  void onTabTapped(int index) {
    _actualIndex = index;
  }
}
