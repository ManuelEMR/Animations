import 'package:animations/motion_restaurant/screens/cart/cart_screen.dart';
import 'package:animations/motion_restaurant/screens/categories/selection_screen.dart';
import 'package:animations/motion_restaurant/screens/menu/menu_screen.dart';
import 'package:animations/motion_restaurant/utils.dart';
import 'package:flutter/material.dart';

const mainColor = Color(0xfff23e54);

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  PageController _pageController = PageController();
  var _currentView = 0;
  List<Widget> views = [];
  final int _fullViewAnimDuration = 1;
  int get _stepAnimDuration => ((_fullViewAnimDuration / 3) * 1000).toInt();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: _fullViewAnimDuration));
    _setupViews();
    _advanceAnim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            _ProgressBackground(
              animation: animationForProgressBackground(),
            ),
            PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: views,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                actions: <Widget>[
                  AnimatedOpacity(
                      opacity: _currentView > 0 ? 1 : 0,
                      duration: Duration(milliseconds: _stepAnimDuration),
                      child: _ShoppingCartIcon()),
                ],
                leading: IconButton(
                  icon: Icon(_currentView == 0 ? Icons.menu : Icons.arrow_back),
                  color: Colors.white,
                  onPressed: _onBackPressed,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Animation<RelativeRect> animationForProgressBackground() {
    final width = MediaQuery.of(context).size.width;

    final anim = RelativeRectTween(
            begin: RelativeRect.fromLTRB(0, 0, width, 0),
            end: RelativeRect.fromLTRB(0, 0, 0, 0))
        .animate(_animationController);
    return anim;
  }

  void _onBackPressed() {
    if (_currentView > 0) {
      setState(() {
        _currentView--;
        _gotoPage(_currentView);
        _advanceAnim();
      });
    }
  }

  void _advanceAnim() {
    double target = (_currentView + 1) / views.length;
    _animationController.animateTo(target);
  }

  void _gotoPage(int page) {
    _pageController.animateToPage(page,
        duration: Duration(milliseconds: _stepAnimDuration),
        curve: Curves.easeInOut);
  }

  void _setupViews() {
    views.addAll([
      SelectionScreen(
        onFoodTap: (_) {
          setState(() {
            _currentView = 1;
            _gotoPage(_currentView);
            _advanceAnim();
          });
        },
        dummyItems: dummyItems,
      ),
      MenuScreen(
        onAddTapped: () {
          setState(() {
            _currentView = 2;
            _gotoPage(_currentView);
            _advanceAnim();
          });
        },
      ),
      CartScreen()
    ]);
  }
}

class _ShoppingCartIcon extends StatelessWidget {
  const _ShoppingCartIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.shopping_basket, color: Colors.grey),
      onPressed: () => print('Go to shopping cart'),
    );
  }
}

class _ProgressBackground extends StatelessWidget {
  final Animation<RelativeRect> animation;

  const _ProgressBackground({Key key, @required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PositionedTransition(
      rect: animation,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: mainColor,
      ),
    );
  }
}
