import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Creates a loading animation line with three shapes that bounces smoothly
class LoadingBouncingLine extends ProgressIndicator {
  /// Sets an [AnimationController] is case you need to do something
  /// specific with it like play/pause animation.
  final AnimationController? controller;

  final BoxShape _shape;

  /// The color of the shape itself.
  ///
  /// Default color is set to [Colors.blueGrey].
  final Color backGroundColor;

  /// Size of the whole square containing the animation.
  ///
  /// Default size is set to [50].
  final double size;

  /// Size of the border of each shape in the line.
  ///
  /// Default size is set to [size/32].
  final double? borderSize;

  /// Total duration for one cycle of animation.
  ///
  /// Default value is set to [Duration(milliseconds: 3000)].
  final Duration duration;

  /// Sets an [IndexedWidgetBuilder] function to return
  /// your own customized widget.
  final IndexedWidgetBuilder? itemBuilder;

  /// Creates the LoadingBouncingLine animation with a circle shape
  const LoadingBouncingLine.circle({
    Key? key,
    this.controller,
    this.backGroundColor = Colors.blue,
    this.size = 50.0,
    this.borderSize,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 3000),
  })  : _shape = BoxShape.circle,
        super(key: key);

  /// Creates the LoadingBouncingLine animation with a square shape
  const LoadingBouncingLine.square({
    Key? key,
    this.controller,
    this.backGroundColor = Colors.blue,
    this.size = 500.0,
    this.borderSize,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 3000),
  })  : _shape = BoxShape.rectangle,
        super(key: key);

  @override
  _LoadingBouncingLineState createState() => _LoadingBouncingLineState();
}

class _LoadingBouncingLineState extends State<LoadingBouncingLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ??
        AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween(begin: -math.pi, end: math.pi).animate(_controller)
      ..addListener(() => setState(() {}));

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildShape(_animation, 0),
            SizedBox(width: widget.size / 8),
            _buildShape(_animation, 1),
            SizedBox(width: widget.size / 8),
            _buildShape(_animation, 2),
            SizedBox(width: widget.size / 8),
            _buildShape(_animation, 3),
            SizedBox(width: widget.size / 8),
            _buildShape(_animation, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildShape(Animation<double> animation, int index) {
    return Transform.scale(
      scale: math.sin(animation.value + (-0.5 * index)).abs(),
      child: _itemBuilder(index),
    );
  }

  Widget _itemBuilder(int index) {
    return SizedBox.fromSize(
      size: Size.square(widget.size / 4),
      child: widget.itemBuilder != null
          ? widget.itemBuilder!(context, index)
          : DecoratedBox(
              decoration: BoxDecoration(
                shape: widget._shape,
                color: widget.backGroundColor,
                border: Border.all(
                  width: widget.borderSize != null
                      ? widget.borderSize! / 4
                      : widget.size / 32,
                  style: BorderStyle.solid,
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
