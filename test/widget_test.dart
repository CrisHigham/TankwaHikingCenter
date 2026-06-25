import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:thc/main.dart';

void main() {
  testWidgets('home page renders title and body', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Tankwa Hiking Center'), findsOneWidget);
    expect(find.text('Home page'), findsOneWidget);
  });

  testWidgets('home page has menu button', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.byIcon(Icons.menu), findsOneWidget);
  });

  testWidgets('drawer shows Home, Map and About Us in order', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    final home = tester.getTopLeft(find.text('Home'));
    final map = tester.getTopLeft(find.text('Map'));
    final aboutUs = tester.getTopLeft(find.text('About Us'));

    expect(home.dy, lessThan(map.dy));
    expect(map.dy, lessThan(aboutUs.dy));
  });

  testWidgets('Map replaces home body without back button', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Map'));
    await tester.pumpAndSettle();

    expect(find.text('Map placeholder'), findsOneWidget);
    expect(find.byType(BackButton), findsNothing);
  });

  testWidgets('About Us replaces home body without back button', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.text('About Us'));
    await tester.pumpAndSettle();

    expect(find.text('About Us placeholder'), findsOneWidget);
    expect(find.byType(BackButton), findsNothing);
  });

  testWidgets('Home drawer item returns to home body', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Map'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    expect(find.text('Home page'), findsOneWidget);
  });
}
