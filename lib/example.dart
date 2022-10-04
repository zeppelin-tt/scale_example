import 'package:flutter/material.dart';
import 'package:scale_example/item.dart';
import 'package:scale_example/item_controller.dart';
import 'package:scale_example/item_data.dart';
import 'package:scale_example/physics/custom_scroll_physics.dart';
import 'package:scale_example/physics/is_scrolling_enabled_dispatcher.dart';

class Example extends StatefulWidget {
  const Example({
    Key? key,
  }) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int selected = -1;
  late final ScrollController scrollController;
  final isScrollingController = IsScrollingEnabledDispatcher(initialValue: false);

  final controllers = [
    ItemController(initialData: const ItemData(scale: 1, width: 120, defaultWidth: 120)),
    ItemController(initialData: const ItemData(scale: 1, width: 120, defaultWidth: 120)),
    ItemController(initialData: const ItemData(scale: 1, width: 120, defaultWidth: 120)),
    ItemController(initialData: const ItemData(scale: 1, width: 140, defaultWidth: 140)),
    ItemController(initialData: const ItemData(scale: 1, width: 120, defaultWidth: 120)),
    ItemController(initialData: const ItemData(scale: 1, width: 140, defaultWidth: 140)),
    ItemController(initialData: const ItemData(scale: 1, width: 120, defaultWidth: 120)),
  ];


  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    void selection(int id) {
      setState(() {
        if (selected == id) {
          selected = -1;
        } else {
          selected = id;
        }
      });
    }

    return Material(
      color: Colors.black,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          print(details);
        },
        onScaleStart: (details) {
          // if (details.pointerCount != 2) {
          //   return;
          // }
          print('start');
          isScrollingController.value = false;
          for (final controller in controllers) {
            controller.saveNewWidth();
          }
        },
        onScaleEnd: (details) {
          if (details.pointerCount != 2) {
            return;
          }
          print('end');
          isScrollingController.value = true;
        },
        onScaleUpdate: (details) {
          if (details.pointerCount != 2) {
            return;
          }
          debugPrint(details.scale.toString());
          for (final controller in controllers) {
            controller.setScale(details.scale);
          }
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Item(
                    onTap: () => selection(0),
                    controller: controllers[0],
                    isSelected: selected == 0,
                    color: Colors.blue,
                  ),
                  Item(
                    onTap: () => selection(1),
                    controller: controllers[1],
                    isSelected: selected == 1,
                    color: Colors.red,
                  ),
                  Item(
                    onTap: () => selection(2),
                    controller: controllers[2],
                    isSelected: selected == 2,
                    color: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  Item(
                    onTap: () => selection(3),
                    controller: controllers[3],
                    color: Colors.red,
                    isSelected: selected == 3,
                  ),
                  Item(
                    onTap: () => selection(4),
                    controller: controllers[4],
                    color: Colors.green,
                    isSelected: selected == 4,
                  ),
                  Item(
                    onTap: () => selection(5),
                    controller: controllers[5],
                    color: Colors.red,
                    isSelected: selected == 5,
                  ),
                  Item(
                    onTap: () => selection(6),
                    controller: controllers[6],
                    color: Colors.blue,
                    isSelected: selected == 6,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}