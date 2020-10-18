import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simple_carousel/simple_carousel.dart';

void main() {
  Widget simpleCarousel;

  setUp(() {
    simpleCarousel = MaterialApp(
      home: Scaffold(
        body: Container(
          height: 200,
          child: SimpleCarousel(
            numberPages: 2,
            children: [
              Center(
                key: ValueKey('item1'),
                child: Text('Teste1'),
              ),
              Center(
                child: Text('Teste2'),
              ),
            ],
          ),
        ),
      ),
    );
  });

  testWidgets('Simple carousel shoud be open successfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(simpleCarousel);
    expect(find.byKey(ValueKey('circleBar0')), findsOneWidget);
    expect(find.byKey(ValueKey('circleBar1')), findsOneWidget);
    expect(find.text('Teste1'), findsOneWidget);
  });

  testWidgets('If the user makes a scroll the next item should is open',
      (WidgetTester tester) async {
    await tester.pumpWidget(simpleCarousel);
    await tester.drag(
        find.byKey(ValueKey('PageViewKey')), const Offset(-200.0, 0.0));
    await tester.pump(Duration(milliseconds: 100));

    expect(find.text('Teste2'), findsOneWidget);
  });
}
