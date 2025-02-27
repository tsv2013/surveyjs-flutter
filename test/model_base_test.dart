import 'dart:async';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:surveyjs_flutter/metadata.dart';
import 'package:surveyjs_flutter/model_base.dart';
import 'package:surveyjs_flutter/model_bloc.dart';

void main() {
  group('ModelBase', () {
    test('Simple deserialization', () {
      var raw = '''{"type": "text", "value": "some string"}''';
      var jsonObj = json.decode(raw);
      var obj = ModelBase.fromJson(jsonObj);
      expect(obj.type, 'text');
      expect(() => obj['value'], throwsA(const TypeMatcher<AssertionError>()));
      Metadata.registerObjectDescription({
        'type': 'text',
        "properties": [
          {"name": 'value', "type": 'string'},
        ],
      });
      obj = ModelBase.fromJson(jsonObj);
      expect(obj.type, 'text');
      expect(obj['value'], 'some string');
      obj = ModelBase.fromJson({'value': 'some string'}, 'text');
      expect(obj.type, 'text');
      expect(obj['value'], 'some string');
    });
    test('Get/set methods', () {
      var obj = ModelBase();
      expect(obj.type, '');
      obj.add('value');
      obj['value'] = 'some string';
      expect(obj['value'], 'some string');
      obj = ModelBase(type: 'some');
      expect(obj.type, 'some');
    });
    test('Deserialize array', () {
      Metadata.registerObjectDescription({
        'type': 'custom',
        "properties": [
          {"name": 'elements', "type": 'element[]'},
        ],
      });
      var obj = ModelBase.fromJson({
        'type': 'custom',
        'elements': [
          {'type': 'element', 'title': 'Title'},
        ],
      });
      var elements = obj['elements'] as List<dynamic>;
      // ignore: unnecessary_null_comparison
      expect(elements != null, true);
      expect(elements.length, 1);
      expect(elements[0].type, 'element');
      expect(elements[0].title, 'Title');
    });
  });
  group('ModelBloc', () {
    test(
      'Changes stream controller add stream',
      () async {
        var controller = StreamController.broadcast();
        controller.addStream(Stream.fromIterable([1, 2, 3]));
        await expectLater(controller.stream, emitsInOrder([1, 2, 3]));
      },
      timeout: const Timeout(Duration(milliseconds: 10)),
    );
    test('Notify value changed', () async {
      Completer completer = Completer();
      var obj = ModelBloc.fromJson({});
      obj.add('value');
      obj.getChangesStreamController('value').stream.listen((event) {
        completer.complete(event);
      });
      obj['value'] = 'some string';
      expect(await completer.future, 'some string');
    }, timeout: const Timeout(Duration(milliseconds: 10)));
  });
}
