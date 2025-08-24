import 'package:flutter/material.dart';

PageRouteBuilder downTransitionPageRouteBuilder(Widget pageToGoTo) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => pageToGoTo,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}

PageRouteBuilder sideTransitionPageRouteBuilder(Widget pageToGoTo) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => pageToGoTo,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}
