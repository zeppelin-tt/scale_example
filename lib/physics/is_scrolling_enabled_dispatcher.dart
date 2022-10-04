import 'package:rxdart/rxdart.dart';

class IsScrollingEnabledDispatcher {
  final BehaviorSubject<bool> _value;

  IsScrollingEnabledDispatcher({
    required bool initialValue,
  }) : _value = BehaviorSubject.seeded(initialValue);

  bool get value => _value.value;

  set value(bool value) {
    _value.add(value);
  }
}
