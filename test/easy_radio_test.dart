import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_radio/src/easy_radio.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        body: EasyRadio<int>(
          value: 1,
          groupValue: 1,
          onChanged: (value) {},
        ),
      ),
    );
  }

  group('EasyRadio', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final easyRadioFinder = find.byType(EasyRadio<int>);
      expect(easyRadioFinder, findsOneWidget);

      final radioWidget = tester.widget<EasyRadio<int>>(easyRadioFinder);
      expect(radioWidget.value, 1);
      expect(radioWidget.groupValue, 1);
    });

    testWidgets(
      'calls onChanged when selected',
      (WidgetTester tester) async {
        int? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: EasyRadio<int>(
                value: 1,
                groupValue: null,
                onChanged: (value) {
                  selectedValue = value;
                },
              ),
            ),
          ),
        );

        final easyRadioFinder = find.byType(EasyRadio<int>);
        expect(easyRadioFinder, findsOneWidget);

        await tester.tap(easyRadioFinder);
        expect(selectedValue, 1);
      },
    );
  });
}
