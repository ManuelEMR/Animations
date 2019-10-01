import 'package:animations/motion_restaurant/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:math';

class PanelView extends StatefulWidget {
  @override
  _PanelViewState createState() => _PanelViewState();
}

class _PanelViewState extends State<PanelView> {
  final controller = PanelController();
  double _panelSlide = 0;
  bool _canSetState = false;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(fontSize: 15);
    return SlidingUpPanel(
      controller: controller,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      onPanelSlide: _setPanelPosition,
      maxHeight: 340,
      panel: Column(
        children: <Widget>[
          GestureDetector(
            onTap: _togglePanel,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Shopping Cart Summary',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Transform.rotate(
                  angle: _panelSlide * pi,
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    color: mainColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Number of items:', style: defaultTextStyle),
              Text('3', style: defaultTextStyle)
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Subtotal:', style: defaultTextStyle),
              Text('25.75€', style: defaultTextStyle)
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Tax:', style: defaultTextStyle),
              Text('1€', style: defaultTextStyle)
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Total:', style: defaultTextStyle),
              Text('26.75€', style: defaultTextStyle.apply(color: mainColor))
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 58,
                width: 58,
                child: OutlineButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29)),
                  onPressed: () => print('delete'),
                  child: Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                height: 58,
                width: 58,
                child: OutlineButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29)),
                  onPressed: () => print('delete'),
                  child: Icon(
                    Icons.bookmark,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 58,
                  child: RaisedButton(
                    color: mainColor,
                    onPressed: () => print('Checkout'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _canSetState = true;
    });
  }

  void _setPanelPosition(double offset) {
    if (!_canSetState) return;

    setState(() {
      _panelSlide = offset;
    });
  }

  void _togglePanel() {
    if (controller.isPanelClosed()) {
      controller.open();
    } else {
      controller.close();
    }
  }
}
