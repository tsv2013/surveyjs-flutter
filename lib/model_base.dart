import 'element_factory.dart';
import 'metadata.dart';

class ModelBase {
  late final String type;

  final _properties = <Symbol, String>{};
  final _values = <Symbol, dynamic>{};

  ModelBase({this.type = ''});

  ModelBase.fromJson(dynamic json, [String? type]) {
    this.type = type ?? (json['type'] ?? '');
    // assert(type != '', "Object type shouldn't be empty");
    List<PropertyDescriptor> dynamicProperties = getPropertyDescriptors();

    for (var propertyDescriptor in dynamicProperties) {
      dynamic value = json?[propertyDescriptor.name];
      if (propertyDescriptor.isArray) {
        if (propertyDescriptor.isComplexType) {
          value = (json?[propertyDescriptor.name] ?? [])
              .map((obj) => ElementFactory.create(
                  obj['type'] ?? propertyDescriptor.type, [obj]))
              .toList();
        }
        value ??= [];
      }
      add(propertyDescriptor.name, value);
    }
  }

  registerObjectDescription() {}

  List<PropertyDescriptor> getPropertyDescriptors() {
    if (Metadata.findObjectDescriptor(type) == null) {
      registerObjectDescription();
    }
    return Metadata.findPropertyDescriptors(type);
  }

  dynamic get(String key, [bool checkPropertyDefined = true]) {
    if (checkPropertyDefined) {
      assert(_values.containsKey(Symbol(key)),
          "Property should belong the object");
    }
    return _values[Symbol(key)];
  }

  set(String key, dynamic value) {
    assert(
        _values.containsKey(Symbol(key)), "Property should belong the object");
    _values[Symbol(key)] = value;
  }

  dynamic operator [](String key) => get(key);
  operator []=(String key, dynamic value) => set(key, value);

  add(String propertyName, [dynamic value]) {
    _properties[Symbol(propertyName)] = propertyName;
    _values[Symbol(propertyName)] = value;
  }

  @override
  noSuchMethod(Invocation invocation) {
    return _values[invocation.memberName];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    _properties.forEach(
        (symbol, propertyName) => json[propertyName] = _values[symbol]);
    return json;
  }
}
