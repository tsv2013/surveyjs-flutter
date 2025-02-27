import 'dart:async';

import 'model_base.dart';

class ModelBloc extends ModelBase {
  final _notifiers = <Symbol, StreamController>{};

  ModelBloc.fromJson(dynamic json, [String? type])
      : super.fromJson(json ?? {'type': 'modelbloc'}, type ?? 'modelbloc');

  @override
  add(String propertyName, [dynamic value]) {
    super.add(propertyName, value);
    _notifiers[Symbol(propertyName)] = StreamController.broadcast();
  }

  @override
  set(String key, dynamic value) {
    super.set(key, value);
    getChangesStreamController(key).add(value);
  }

  StreamController<T> getChangesStreamController<T>(String propertyName) =>
      _notifiers[Symbol(propertyName)] as StreamController<T>;

  void dispose() {
    for (var stream in _notifiers.values) {
      stream.close();
    }
  }
}
