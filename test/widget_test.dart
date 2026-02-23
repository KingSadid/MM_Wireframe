import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app1_mm/main.dart';

void main() {
  testWidgets('App renders wireframe elements correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const SketchCloneApp());

    expect(find.text('0'), findsNothing);
    expect(find.byIcon(Icons.add), findsNothing);

    expect(find.text('Explore Categories'), findsOneWidget);
    expect(find.byIcon(Icons.pause), findsOneWidget);
    expect(find.byIcon(Icons.play_circle_outline), findsOneWidget);
  });
}
