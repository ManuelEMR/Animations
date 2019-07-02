import 'package:flutter/material.dart';

const double kInternalPadding = 3;

class CoolTab extends StatefulWidget {
  final PageController pageController;
  final List<String> tabTitles;

  CoolTab({@required this.pageController, this.tabTitles});

  @override
  _CoolTabState createState() => _CoolTabState();
}

class _CoolTabState extends State<CoolTab> {
  int _selectedTabIndex = 0;
  double _tabOffsetPercent = 0;

  @override
  Widget build(BuildContext context) {
    var tabs = List<Widget>();
    for (int i = 0; i < widget.tabTitles.length; i++) {
      tabs.add(Expanded(
        child: GestureDetector(
          onTap: () => _onTitleTap(i),
          child: Text(
            widget.tabTitles[i],
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: _selectedTabIndex == i ? Colors.black : Colors.white),
          ),
        ),
      ));
    }

    final double tabWidth = MediaQuery.of(context).size.width - 70;
    final tabIndicatorWidth = tabWidth / widget.tabTitles.length;

    return Container(
      height: 50,
      width: tabWidth,
      padding: const EdgeInsets.all(kInternalPadding),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: (tabIndicatorWidth * (widget.tabTitles.length - 1) -
                    kInternalPadding * 2) *
                _tabOffsetPercent,
            bottom: 0,
            top: 0,
            child: Container(
              width: tabIndicatorWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Row(
            children: tabs,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    widget.pageController.addListener(() {
      setState(() {
        _selectedTabIndex = widget.pageController.page.round();
        _tabOffsetPercent = widget.pageController.offset /
            widget.pageController.position.viewportDimension;
      });
    });
  }

  void _onTitleTap(int index) {
    widget.pageController.animateToPage(index, curve: Curves.ease, duration: Duration(milliseconds: 500));
  }
}
