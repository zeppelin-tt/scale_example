import 'package:scale_example/dispatcher.dart';
import 'package:scale_example/item_data.dart';

class ItemController extends Dispatcher<ItemData> {

  ItemController({
    required super.initialData,
  });

  Stream<double> get widthStream => stream.map((data) => data.scalesWidth).distinct();

  void setScale(double scale) {
    add(value.copyWith(scale: scale));
  }

  void saveNewWidth() {
    add(value.copyWith(width: value.scalesWidth, scale: 1));
  }
}
