import 'package:flutter/material.dart';
import 'package:scale_example/physics/is_scrolling_enabled_dispatcher.dart';

class CustomScrollPhysics extends ScrollPhysics {
  final IsScrollingEnabledDispatcher isScrollingEnabledDispatcher;

  const CustomScrollPhysics({
    super.parent,
    required this.isScrollingEnabledDispatcher,
  });

  @override
  bool get allowImplicitScrolling => false;

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(
      parent: buildParent(ancestor),
      isScrollingEnabledDispatcher: isScrollingEnabledDispatcher,
    );
  }

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) {
    return true;
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (parent == null) {
      return 0;
    }
    if (!isScrollingEnabledDispatcher.value) {
      return value - position.pixels;
    }
    return parent?.applyBoundaryConditions(position, value) ?? 0;
  }

  @override
  double get minFlingDistance => 10;
}
