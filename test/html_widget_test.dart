import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surveyjs_flutter/questions/html_question.dart';
import 'package:surveyjs_flutter/widgets/html.dart';

import 'helpers.dart';

void main() {
  testWidgets('HtmlWidget renders html text', (WidgetTester tester) async {
    final q = HtmlQuestion();
    q.html = '<b>Hello</b> world';
    await tester.pumpWidget(buildTestableWidget(HtmlWidget(q)));
    await tester.pumpAndSettle();
    expect(find.byType(Html), findsOneWidget);
    var html = tester.widget<Html>(find.byType(Html));
    expect(html.data, '<b>Hello</b> world');
  });
}
