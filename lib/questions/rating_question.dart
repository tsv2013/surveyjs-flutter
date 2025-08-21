import './question.dart';
import '../metadata.dart';

class RatingQuestion extends Question {
  static final description = {
    'type': 'rating',
    'parent': 'question',
    'properties': [
      {'name': 'rateMin', 'type': 'number'},
      {'name': 'rateMax', 'type': 'number'},
      {'name': 'minRateDescription', 'type': 'string'},
      {'name': 'maxRateDescription', 'type': 'string'},
    ],
  };
  RatingQuestion([dynamic json])
    : super(json, RatingQuestion.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(RatingQuestion.description);
  }

  int get rateMin => get('rateMin') ?? 1;
  set rateMin(int value) => set('rateMin', value);

  int get rateMax => get('rateMax') ?? 5;
  set rateMax(int value) => set('rateMax', value);

  String? get minRateDescription => get('minRateDescription');
  set minRateDescription(String? value) => set('minRateDescription', value);

  String? get maxRateDescription => get('maxRateDescription');
  set maxRateDescription(String? value) => set('maxRateDescription', value);
}
