import 'package:flutter/material.dart';
import 'package:scale_example/item_controller.dart';

class Item extends StatelessWidget {
  final bool isSelected;
  final Color color;
  final ItemController controller;
  final VoidCallback onTap;

  const Item({
    Key? key,
    required this.isSelected,
    required this.controller,
    required this.color,
    required this.onTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: StreamBuilder<double>(
        stream: controller.widthStream,
        initialData: controller.value.scalesWidth,
        builder: (context, scalesWidth) {
          return Container(
            height: 80,
            width: scalesWidth.requireData,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: color,
              border: isSelected ? Border.all(color: Colors.yellow, width: 3) : null,
            ),
          );
        }
      ),
    );
  }
}
