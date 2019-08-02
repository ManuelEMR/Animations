import 'package:animations/motion_restaurant/main_screen.dart';
import 'package:animations/motion_restaurant/screens/menu/menu_screen.dart';
import 'package:flutter/material.dart';

class PlateInfo extends StatefulWidget {
  final MenuItem menuItem;

  const PlateInfo({Key key, @required this.menuItem}) : super(key: key);

  @override
  _PlateInfoState createState() => _PlateInfoState();
}

class _PlateInfoState extends State<PlateInfo> {
  var _showDescription = false;
  final _contentKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_layout);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _showDescription = !_showDescription),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.fromLTRB(90, 25, 30, 25),
        child: Column(
          key: _contentKey,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              widget.menuItem.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Visibility(
              visible: _showDescription,
              child:
                  _LargeDescription(description: widget.menuItem.description),
            ),
            _Rating(rating: widget.menuItem.rating, totalStars: 5),
            const SizedBox(
              height: 8,
            ),
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

  void _layout(_) {
    final RenderBox renderBox = _contentKey.currentContext.findRenderObject();
    print('Size: ${renderBox.size}');
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
