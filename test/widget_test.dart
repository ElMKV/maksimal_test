// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maksimal_test/features/user_detail/data/models/repo.dart';
import 'package:maksimal_test/features/user_detail/presentation/widgets/user_card_detail.dart';
import 'package:maksimal_test/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();

  testWidgets('finds a Text widgets', (tester) async {
    final repo = Repo(
      updatedAt: DateTime.now(),
      name: 'Flutter',
      language: 'Dart',
        defaultBranch: 'master'
    );
    // Build an App with a Text widget that displays the letter 'H'.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
          body: UserCardDetail(
        repo: repo,
      )),
    ));

    expect(find.text(repo.defaultBranch), findsOneWidget);
  });
}
