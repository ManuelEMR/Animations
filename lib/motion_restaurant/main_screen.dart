import 'package:animations/motion_restaurant/menu_screen.dart';
import 'package:animations/motion_restaurant/screens/selection_screen.dart';
import 'package:flutter/material.dart';

const mainColor = Color(0xfff23e54);

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final dummyItems = [
    FoodItem("Pizza", 25),
    FoodItem("Salads", 30),
    FoodItem("Desserts", 30),
    FoodItem("Pasta", 44),
    FoodItem("Beverages", 30),
  ];

  AnimationController _animationController;
  var _currentView = 0;
  List<Widget> views = [];

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    views.addAll([
      SelectionScreen(
        onFoodTap: (_) {
          setState(() {
            _currentView = 1;
            _advanceAnim();
          });
        },
        dummyItems: dummyItems,
      ),
      MenuScreen(),
      Container()
    ]);
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
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: views[_currentView]),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                leading: IconButton(
                  icon: Icon(_currentView == 0 ? Icons.menu : Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    if (_currentView > 0) {
                      setState(() {
                        _currentView--;
                        _advanceAnim();
                      });
                    }
                  },
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

  void _advanceAnim() {
    double target = (_currentView + 1)/ views.length;
    print('Target: $target');
    _animationController.animateTo(target);
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
