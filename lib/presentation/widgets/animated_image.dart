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
  late Animation<double> _rotationAnimation;
  bool isAnimating = true;

  @override
  void initState() {
    super.initState();
    final animationLogic = AnimationLogic(vsync: this);
    _controller = animationLogic.controller;
    _opacityAnimation = animationLogic.createOpacityAnimation();
    _sizeAnimation = animationLogic.createSizeAnimation();
    _rotationAnimation = animationLogic.createRotationAnimation();

    _controller.repeat(reverse: true);
  }

  void _toggleAnimation() {
    setState(() {
      if (isAnimating) {
        _controller.stop();
      } else {
        _controller.repeat(reverse: true);
      }
      isAnimating = !isAnimating;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateZ(_rotationAnimation.value)
                  ..scale(_sizeAnimation.value),
                child: Image.asset(
                  'assets/images/Aldi-Pc-Bild.webp',
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _toggleAnimation,
          child: Text(isAnimating ? 'Stop Animation' : 'Start Animation'),
        ),
      ],
    );
  }
}
