import 'package:flutter/material.dart';
import 'widgets/skeleton.dart';

class WidgetFactory {
  static final Map<String, dynamic> _widgets = {};
  static void register(String type, dynamic constructor) {
    _widgets[type] = constructor;
  }

  static Widget create(String type,
      [List<dynamic> argsp = const [], Map<String, dynamic> argsn = const {}]) {
    Map<Symbol, dynamic> args = argsn.map((k, v) => MapEntry(Symbol(k), v));
    var constructor = _widgets[type];
    return Function.apply(constructor ?? SkeletonWidget.new, argsp, args);
  }
}
