import 'package:flutter/material.dart';
import 'package:scale_example/custom_gesture_detector.dart';

typedef GestureMultiTapDown = void Function(int pointerCount, TapDownDetails details);

class Detector extends StatefulWidget {
  final Widget child;
  final GestureMultiTapDown? onMultiTapDown;
  final VoidCallback? onMultiTapCancel;
  final GestureScaleUpdateCallback? onScaleUpdate;
  final GestureScaleStartCallback? onScaleStart;
  final GestureScaleEndCallback? onScaleEnd;

  const Detector({
    Key? key,
    this.onMultiTapDown,
    this.onMultiTapCancel,
    this.onScaleUpdate,
    this.onScaleStart,
    this.onScaleEnd,
    required this.child,
  }) : super(key: key);

  @override
  State<Detector> createState() => _DetectorState();
}

class _DetectorState extends State<Detector> {
  int multiTapCounter = 0;

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetector(
      onMultiTapDown: (pointer, details) {
        widget.onMultiTapDown?.call(++multiTapCounter, details);
      },
      onMultiTapUp: (pointer, details) {
        // print(pointer);
      },
      onMultiTapCancel: (pointer) {
        if (multiTapCounter != 0) {
          widget.onMultiTapCancel?.call();
        }
        multiTapCounter = 0;
      },
      onHorizontalDragUpdate: (d) {
        print(d);
      },
      onScaleEnd: widget.onScaleEnd,
      onScaleStart: widget.onScaleStart,
      onScaleUpdate: widget.onScaleUpdate,
      child: widget.child,
    );
  }
}
