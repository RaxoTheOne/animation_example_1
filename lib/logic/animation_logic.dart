import 'package:flutter/material.dart';

class AnimationLogic {
  final TickerProvider vsync;
  late AnimationController controller;

  AnimationLogic({required this.vsync}) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 5),
    );
  }

  Animation<double> createOpacityAnimation() {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  Animation<double> createSizeAnimation() {
    return Tween<double>(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  Animation<double> createRotationAnimation() {
    return Tween<double>(begin: 0.0, end: 2 * 3.141592653589793).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOutQuad),
    );
  }
}
