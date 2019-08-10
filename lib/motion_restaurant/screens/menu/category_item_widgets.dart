import 'package:animations/motion_restaurant/main_screen.dart';
import 'package:animations/motion_restaurant/screens/menu/menu_screen.dart';
import 'package:flutter/material.dart';

class PlateInfo extends StatefulWidget {
  final MenuItem menuItem;
  final ValueChanged<bool> onExpand;

  const PlateInfo({Key key, @required this.onExpand, @required this.menuItem})
      : super(key: key);

  @override
  _PlateInfoState createState() => _PlateInfoState();
}

class _PlateInfoState extends State<PlateInfo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _showAnim;
  final _contentKey = GlobalKey();

  bool get _expanded => _animationController.value == 1;

  @override
  void initState() {
    super.initState();

    _setupAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDescription,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.fromLTRB(90, 25, 30, 25),
        child: Column(
          key: _contentKey,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizeTransition(
              axis: Axis.vertical,
              sizeFactor: _showAnim,
              child: SizedBox(height: 16),
            ),
            Text(
              widget.menuItem.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            SizeTransition(
              sizeFactor: _showAnim,
              child: FadeTransition(
                opacity: _showAnim,
                child: _LargeDescription(description: widget.menuItem.description),
              ),
            ),
            SizeTransition(
              axis: Axis.vertical,
              sizeFactor: _showAnim,
              child: SizedBox(
                height: 12,
              ),
            ),
            _Rating(rating: widget.menuItem.rating, totalStars: 5),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${widget.menuItem.weigth} g',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  '${widget.menuItem.price} €',
                  style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _setupAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    final curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _showAnim = Tween(begin: 0.0, end: 1.0).animate(curvedAnimation);

    _animationController.addListener(() => setState(() => {}));
  }

  void _showDescription() {
    _expanded ? _animationController.reverse() : _animationController.forward();

    // We need to send next expanded state.
    widget.onExpand(!_expanded);
  }
}

class _Rating extends StatelessWidget {
  final int rating;
  final int totalStars;

  const _Rating({Key key, this.rating = 0, @required this.totalStars})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = List<Widget>();
    for (var i = 0; i < totalStars; i++) {
      list.add(Icon(
        i < rating ? Icons.star : Icons.star_border,
        color: Colors.yellow,
      ));
    }

    return Row(children: list);
  }
}

class _LargeDescription extends StatelessWidget {
  final String description;

  const _LargeDescription({this.description});

  @override
  Widget build(BuildContext context) {
    return Text(description);
  }
}
