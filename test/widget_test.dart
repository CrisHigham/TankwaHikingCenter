import 'package:flutter_test/flutter_test.dart';

import 'package:thc/main.dart';

void main() {
  testWidgets('renders home page', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('THC'), findsOneWidget);
    expect(find.text('Map placeholder'), findsOneWidget);
  });
}
