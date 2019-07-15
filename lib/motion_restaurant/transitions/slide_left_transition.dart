import 'package:flutter/widgets.dart';

class SlideLeftTransition<T> extends PageRouteBuilder<T> {
  final Widget widget;

  SlideLeftTransition({RouteSettings settings, @required this.widget})
      : super(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
