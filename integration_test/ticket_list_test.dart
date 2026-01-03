// Focused test for capturing authenticated ticket list screen
//
// Usage:
//   chromedriver --port=4444 &
//   flutter drive \
//     --driver=test_driver/integration_test.dart \
//     --target=integration_test/ticket_list_test.dart \
//     --dart-define-from-file=dart_defines/test.env \
//     -d web-server --web-port=3505

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:moat/main.dart' as app;

const _testEmail = String.fromEnvironment('TEST_EMAIL', defaultValue: 'jake+ltestpass@moat.app');
const _testPassword = String.fromEnvironment('TEST_PASSWORD', defaultValue: 'Vo1tron.3');

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture_ticket_list_authenticated', (tester) async {
    // Start the app
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Check if we're on login screen
    if (find.text('Sign in to your account').evaluate().isNotEmpty) {
      debugPrint('On login screen, signing in with test credentials...');

      // Find and fill email field
      final textFields = find.byType(TextField);
      expect(textFields, findsAtLeast(2), reason: 'Should have email and password fields');

      await tester.enterText(textFields.first, _testEmail);
      await tester.pumpAndSettle();

      await tester.enterText(textFields.at(1), _testPassword);
      await tester.pumpAndSettle();

      // Find and tap sign in button
      final signInButton = find.widgetWithText(ElevatedButton, 'Sign In');
      if (signInButton.evaluate().isNotEmpty) {
        await tester.tap(signInButton);
        debugPrint('Tapped Sign In button, waiting for auth...');
      }

      // Wait for authentication and redirect (longer wait for network)
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle(const Duration(seconds: 10));

      // Check for auth errors
      final errorContainer = find.byType(SnackBar);
      if (errorContainer.evaluate().isNotEmpty) {
        debugPrint('Auth error detected - check backend is running');
      }
    }

    // Capture whatever screen we're on now
    await binding.takeScreenshot('10_ticket_list_after_login');
    debugPrint('Captured screenshot after login attempt');

    // Check if we made it to ticket list
    final openTicketsText = find.text('Open Tickets');
    if (openTicketsText.evaluate().isNotEmpty) {
      debugPrint('SUCCESS: On ticket list screen!');
      await binding.takeScreenshot('10_ticket_list_screen');
    } else {
      debugPrint('Not on ticket list screen yet, capturing current state...');
      // Log what we can see
      final allText = find.byType(Text);
      for (var i = 0; i < allText.evaluate().length && i < 10; i++) {
        final widget = allText.at(i).evaluate().first.widget as Text;
        debugPrint('Found text: ${widget.data}');
      }
    }
  });
}
