import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scaffloldbasics/myapp.dart';

void main() {
  testWidgets('renders the scaffold showcase and records actions', (tester) async {
    await tester.pumpWidget(const ScaffoldBasicsApp());

    expect(find.text('Scaffold Basics Showcase'), findsOneWidget);
    expect(find.text('Actions performed: 0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Actions performed: 1'), findsOneWidget);
    expect(find.text('Action recorded successfully.'), findsOneWidget);
  });

  testWidgets('switches to the widgets section', (tester) async {
    await tester.pumpWidget(const ScaffoldBasicsApp());

    await tester.tap(find.text('Widgets').last);
    await tester.pumpAndSettle();

    expect(find.text('FloatingActionButton'), findsOneWidget);
    expect(find.text('NavigationBar'), findsOneWidget);
  });
}
