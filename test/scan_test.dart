import 'package:flutter/material.dart';
import 'package:flutter_application_ab9/presentation/screen/qrdata.dart';
import 'package:flutter_application_ab9/presentation/screen/scan.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ScanPage navigates to DisplayDataPage on scanning a QR code',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScanPage(),
        routes: {
          '/displayDataPage': (context) =>
              DisplayDataPage(data: 'Mock QR Code Data'),
        },
      ),
    );

    expect(find.byType(ScanPage), findsOneWidget);

    tester.tap(find.byKey(Key('QR')));
    await tester.pumpAndSettle();

    expect(find.byType(DisplayDataPage), findsOneWidget);
    expect(find.text('Mock QR Code Data'), findsOneWidget);
  });
}
