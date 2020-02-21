import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:crud_fire/app/modules/cliente/cliente_page.dart';

main() {
  testWidgets('ClientePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ClientePage(title: 'Cliente')));
    final titleFinder = find.text('Cliente');
    expect(titleFinder, findsOneWidget);
  });
}
