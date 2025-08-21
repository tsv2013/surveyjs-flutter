import './question.dart';
import '../metadata.dart';

class ImageQuestion extends Question {
  static final description = {
    'type': 'image',
    'parent': 'question',
    'properties': [
      {'name': 'imageLink', 'type': 'string'},
      {'name': 'altText', 'type': 'string'},
    ],
  };
  ImageQuestion([dynamic json])
    : super(json, ImageQuestion.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(ImageQuestion.description);
  }

  String? get imageLink => get('imageLink');
  set imageLink(String? value) => set('imageLink', value);

  String? get altText => get('altText');
  set altText(String? value) => set('altText', value);
}
