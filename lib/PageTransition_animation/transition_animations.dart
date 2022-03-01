import 'package:flutter/cupertino.dart';

class SidePageTransition extends PageRouteBuilder {
  final Widget widget;
  SidePageTransition({required this.widget})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => widget,
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var curve = Curves.easeOut;
              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              final tweenAnimation = animation.drive(tween);

              return SlideTransition(child: widget, position: tweenAnimation);
            });
}

class VerticlePageTransition extends PageRouteBuilder {
  final Widget widget;
  VerticlePageTransition({required this.widget})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => widget,
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              var curve = Curves.easeOut;
              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              final tweenAnimation = animation.drive(tween);

              return SlideTransition(child: widget, position: tweenAnimation);
            });
}
