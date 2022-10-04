class ItemData {
  final double defaultWidth;
  final double width;
  final double scale;

  const ItemData({
    required this.defaultWidth,
    required this.width,
    required this.scale,
  });

  ItemData copyWith({
    double? defaultWidth,
    double? width,
    double? scale,
  }) {
    return ItemData(
      defaultWidth: defaultWidth ?? this.defaultWidth,
      width: width ?? this.width,
      scale: scale ?? this.scale,
    );
  }

  double get scalesWidth => width * scale;
}