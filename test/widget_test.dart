import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weartest/counter/counter_page.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CounterPage());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Counter decrements smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CounterPage());

    // Tap the '-' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that our counter has decremented.
    expect(find.text('-1'), findsOneWidget);
  });

  testWidgets('Counter reset test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CounterPage());

    // Tap the '+' icon twice and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented to 2.
    expect(find.text('2'), findsOneWidget);

    // Tap the 'reset' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.loop));
    await tester.pump();

    // Verify that our counter has reset to 0.
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Counter maximum limit test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CounterPage());

    // Tap the '+' icon 11 times and trigger a frame.
    for (int i = 0; i < 11; i++) {
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
    }

    // Verify that our counter has reached the maximum limit of 10.
    expect(find.text('10'), findsOneWidget);
  });

  testWidgets('Counter minimum limit test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CounterPage());

    // Tap the '-' icon 11 times and trigger a frame.
    for (int i = 0; i < 11; i++) {
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
    }

    // Verify that our counter has reached the minimum limit of -10.
    expect(find.text('-10'), findsOneWidget);
  });
}
