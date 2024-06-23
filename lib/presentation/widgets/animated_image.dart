import 'package:flutter/material.dart';
import '../../logic/animation_logic.dart';

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({super.key});

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    final animationLogic = AnimationLogic(vsync: this);
    _controller = animationLogic.controller;
    _opacityAnimation = animationLogic.createOpacityAnimation();
    _sizeAnimation = animationLogic.createSizeAnimation();

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.scale(
            scale: _sizeAnimation.value,
            child: Image.asset(
              'assets/images/Aldi-Pc-Bild.webp',
            ),
          ),
        );
      },
    );
  }
}
