import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  final ScrollController scrollController;
  final Widget child;

  const AnimatedText({
    super.key,
    required this.scrollController,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        final scrollOffset = scrollController.offset;
        final maxScroll = scrollController.position.maxScrollExtent;
        final progress = maxScroll > 0
            ? (scrollOffset / maxScroll).clamp(0.0, 1.0)
            : 0.0;
        final textProgress = (progress * 0.8).clamp(0.0, 1.0);

        return Transform.translate(
          offset: Offset(0, -50.0 + (50.0 * textProgress)),
          child: Opacity(opacity: textProgress, child: child),
        );
      },
      child: child,
    );
  }
}

class AnimatedMainImage extends StatelessWidget {
  final ScrollController scrollController;
  final Widget child;

  const AnimatedMainImage({
    super.key,
    required this.scrollController,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        final scrollOffset = scrollController.offset;
        final maxScroll = scrollController.position.maxScrollExtent;
        final progress = maxScroll > 0
            ? (scrollOffset / maxScroll).clamp(0.0, 1.0)
            : 0.0;

        return Transform.scale(
          scale: 0.8 + (0.2 * progress),
          child: Opacity(opacity: progress, child: child),
        );
      },
      child: child,
    );
  }
}

class AnimatedSecondaryElement extends StatelessWidget {
  final ScrollController scrollController;
  final Widget child;
  final double scaleBegin;
  final double scaleEnd;
  final double rotationBegin;
  final double rotationEnd;

  const AnimatedSecondaryElement({
    super.key,
    required this.scrollController,
    required this.child,
    this.scaleBegin = 0.9,
    this.scaleEnd = 1.0,
    this.rotationBegin = 0.0,
    this.rotationEnd = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        final scrollOffset = scrollController.offset;
        final maxScroll = scrollController.position.maxScrollExtent;
        final progress = maxScroll > 0
            ? (scrollOffset / maxScroll).clamp(0.0, 1.0)
            : 0.0;
        final elementProgress = (progress * 1.2).clamp(0.0, 1.0);

        return Transform.rotate(
          angle:
              rotationBegin + ((rotationEnd - rotationBegin) * elementProgress),
          child: Transform.scale(
            scale: scaleBegin + ((scaleEnd - scaleBegin) * elementProgress),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
