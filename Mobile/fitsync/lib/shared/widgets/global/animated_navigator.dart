import 'package:flutter/material.dart';

class AnimatedNavigator {

  void pushAndRemoveUntil(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context, 
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
      (route) => false,
    );
  }

  void push(BuildContext context, Widget screen) {
    Navigator.push(
      context, 
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    );
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }

  void pushReplacementScale(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context, 
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) => Transform.scale(
          scale: animation.value,
          child: child,
        ),
      ),
    );
  }
  
  void pushAndRemoveUntilScale(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context, 
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) => Transform.scale(
          scale: animation.value,
          child: child,
        ),
      ),
      (route) => false,
    );
  }

  void pushScale(BuildContext context, Widget screen) {
    Navigator.push(
      context, 
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) => Transform.scale(
          scale: animation.value,
          child: child,
        ),
      ),
    );
  }
}