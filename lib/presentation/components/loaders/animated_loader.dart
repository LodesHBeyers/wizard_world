import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wizard_world/presentation/components/assets/app_animations.dart';

class AnimatedLoader extends StatelessWidget {
  const AnimatedLoader({
    super.key = const Key("animated_loader"),
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppAnimations.wavingWand,
    );
  }
}
