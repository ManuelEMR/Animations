import 'package:animations/cool_login/cool_tabs.dart';
import 'package:animations/cool_login/login_page.dart';
import 'package:animations/cool_login/signup_page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.orange, Colors.pink],
                stops: [0.4, 0.8])),
        child: SafeArea(
          top: true,
          child: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const SizedBox(height: 40),
        Image.asset(
          'assets/cool_login/hk.png',
          width: 120,
          height: 120,
        ),
        Expanded(flex: 1, child: const SizedBox(height: 25)),
        CoolTab(
          pageController: _pageController,
          tabTitles: ['Existing', 'New'],
        ),
        Expanded(flex: 1, child: const SizedBox(height: 25)),
        Expanded(
          flex: 8,
          // height: 400,
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              LoginPage(),
              SignupPage(),
            ],
          ),
        )
      ],
    );
  }
}
