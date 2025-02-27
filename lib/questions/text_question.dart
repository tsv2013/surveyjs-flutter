import 'package:flutter/material.dart';

import '../metadata.dart';
import './question.dart';

class TextQuestion extends Question {
  static final description = {
    'type': 'text',
    'parent': 'question',
    'properties': [
      'inputType',
    ]
  };
  TextQuestion([dynamic json, String? type])
      : super(json, type ?? TextQuestion.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(TextQuestion.description);
  }

  dynamic get inputType {
    return get('inputType');
  }

  set inputType(dynamic newValue) {
    set('inputType', newValue);
  }

  // @override
  // String get renderAs {
  //   return super.renderAs;
  // }

  getKeyboardType() {
    switch (inputType?.toString()) {
      case 'number':
        return TextInputType.number;
      case 'date':
      case 'time':
      case 'datetime-local':
        return TextInputType.datetime;
      case 'email':
        return TextInputType.emailAddress;
      case 'url':
        return TextInputType.url;
      case 'tel':
        return TextInputType.phone;
      // case 'password':
      //   return TextInputType.visiblePassword;
      default:
        return TextInputType.text;
    }
  }
}
