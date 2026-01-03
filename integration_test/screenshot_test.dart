// Flutter Web Integration Tests with Screenshot Capture
//
// This test suite navigates through all screens and captures screenshots
// for visual verification against Figma designs.
//
// Usage:
//   # Start ChromeDriver first (in a separate terminal)
//   chromedriver --port=4444
//
//   # Run tests with screenshot capture
//   flutter drive \
//     --driver=test_driver/integration_test.dart \
//     --target=integration_test/screenshot_test.dart \
//     -d web-server --web-port=3500
//
//   # Screenshots are saved to screenshots/ directory

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:moat/main.dart' as app;

/// Whether to capture screenshots (controlled via --dart-define=SCREENSHOT_MODE=true)
const _screenshotMode = bool.fromEnvironment('SCREENSHOT_MODE', defaultValue: true);

/// Test credentials (controlled via --dart-define-from-file=dart_defines/test.env)
const _testEmail = String.fromEnvironment('TEST_EMAIL', defaultValue: 'jake+ltestpass@moat.app');
const _testPassword = String.fromEnvironment('TEST_PASSWORD', defaultValue: 'Vo1tron.3');

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Authentication Screens', () {
    testWidgets('01_login_screen', (tester) async {
      await _initializeApp(tester);
      await tester.pumpAndSettle();

      // Should redirect to login when not authenticated
      await _captureScreenshot(binding, '01_login_screen');

      // Verify login screen elements
      expect(find.text('Moat'), findsOneWidget);
      expect(find.text('Sign in to your account'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Sign In'), findsOneWidget);
      expect(find.text('Sign in with Google'), findsOneWidget);
    });

    testWidgets('02_login_screen_with_error', (tester) async {
      await _initializeApp(tester);
      await tester.pumpAndSettle();

      // Try to submit with empty fields - find button by type
      final signInButton = find.widgetWithText(ElevatedButton, 'Sign In');
      if (signInButton.evaluate().isNotEmpty) {
        await tester.tap(signInButton);
        await tester.pumpAndSettle();
      }

      await _captureScreenshot(binding, '02_login_screen_with_error');
    });

    testWidgets('03_sign_up_screen', (tester) async {
      await _initializeApp(tester);
      await tester.pumpAndSettle();

      // Navigate to sign up
      await tester.tap(find.text('Sign up'));
      await tester.pumpAndSettle();

      await _captureScreenshot(binding, '03_sign_up_screen');

      expect(find.text('Create an account'), findsOneWidget);
    });

    testWidgets('04_forgot_password_screen', (tester) async {
      await _initializeApp(tester);
      await tester.pumpAndSettle();

      // Navigate to forgot password
      await tester.tap(find.text('Forgot password?'));
      await tester.pumpAndSettle();

      await _captureScreenshot(binding, '04_forgot_password_screen');

      expect(find.text('Reset Password'), findsAny);
    });
  });

  // Note: The following tests require authentication.
  // They use mock auth or test credentials for CI environments.
  group('Main App Screens (Requires Auth)', () {
    testWidgets('10_ticket_list_screen', (tester) async {
      await _initializeAppWithAuth(tester);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await _captureScreenshot(binding, '10_ticket_list_screen');

      // Verify key ticket list elements
      expect(find.text('Open Tickets'), findsOneWidget);
    });

    testWidgets('11_ticket_list_empty', (tester) async {
      await _initializeAppWithAuth(tester);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // This captures empty state if no tickets exist
      await _captureScreenshot(binding, '11_ticket_list_empty');
    });

    testWidgets('20_assets_screen', (tester) async {
      await _initializeAppWithAuth(tester);
      await tester.pumpAndSettle();

      // Navigate to assets
      await _navigateTo(tester, '/assets/list');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await _captureScreenshot(binding, '20_assets_screen');

      expect(find.text('Assets'), findsOneWidget);
    });

    testWidgets('30_settings_members_screen', (tester) async {
      await _initializeAppWithAuth(tester);
      await tester.pumpAndSettle();

      // Navigate to settings
      await _navigateTo(tester, '/settings/members');
      await tester.pumpAndSettle();

      await _captureScreenshot(binding, '30_settings_members_screen');
    });

    testWidgets('31_settings_roles_screen', (tester) async {
      await _initializeAppWithAuth(tester);
      await tester.pumpAndSettle();

      await _navigateTo(tester, '/settings/roles');
      await tester.pumpAndSettle();

      await _captureScreenshot(binding, '31_settings_roles_screen');
    });

    testWidgets('32_settings_locations_screen', (tester) async {
      await _initializeAppWithAuth(tester);
      await tester.pumpAndSettle();

      await _navigateTo(tester, '/settings/locations');
      await tester.pumpAndSettle();

      await _captureScreenshot(binding, '32_settings_locations_screen');
    });

    testWidgets('40_admin_overview_screen', (tester) async {
      await _initializeAppWithAuth(tester);
      await tester.pumpAndSettle();

      await _navigateTo(tester, '/admin/overview');
      await tester.pumpAndSettle();

      await _captureScreenshot(binding, '40_admin_overview_screen');
    });
  });

  group('Responsive Layout Tests', () {
    testWidgets('50_ticket_list_mobile', (tester) async {
      // Set mobile viewport
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 3.0;

      await _initializeAppWithAuth(tester);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await _captureScreenshot(binding, '50_ticket_list_mobile');

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });
    });

    testWidgets('51_ticket_list_tablet', (tester) async {
      // Set tablet viewport
      tester.view.physicalSize = const Size(768, 1024);
      tester.view.devicePixelRatio = 2.0;

      await _initializeAppWithAuth(tester);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await _captureScreenshot(binding, '51_ticket_list_tablet');

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });
    });

    testWidgets('52_ticket_list_desktop', (tester) async {
      // Set desktop viewport
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;

      await _initializeAppWithAuth(tester);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await _captureScreenshot(binding, '52_ticket_list_desktop');

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });
    });
  });
}

/// Initialize the app without authentication
Future<void> _initializeApp(WidgetTester tester) async {
  app.main();
  await tester.pumpAndSettle();
}

/// Initialize the app with authentication using test credentials
/// Credentials are loaded from dart_defines/test.env
Future<void> _initializeAppWithAuth(WidgetTester tester) async {
  app.main();
  await tester.pumpAndSettle();

  // If we're on login screen, sign in with test credentials
  if (find.text('Sign in to your account').evaluate().isNotEmpty) {
    debugPrint('Signing in with test credentials...');

    // Enter email
    final emailField = find.byType(TextField).first;
    await tester.enterText(emailField, _testEmail);
    await tester.pumpAndSettle();

    // Enter password
    final passwordField = find.byType(TextField).at(1);
    await tester.enterText(passwordField, _testPassword);
    await tester.pumpAndSettle();

    // Tap Sign In button
    final signInButton = find.text('Sign In');
    if (signInButton.evaluate().isNotEmpty) {
      await tester.tap(signInButton);
      // Wait longer for authentication to complete
      await tester.pumpAndSettle(const Duration(seconds: 5));
      debugPrint('Sign in attempted, waiting for redirect...');
    }
  }
}

/// Navigate to a specific route
Future<void> _navigateTo(WidgetTester tester, String path) async {
  // Use go_router's testing capabilities
  // This works if the router is properly set up
  // For web, we might need to use URL-based navigation

  // Find sidebar navigation elements
  if (path.startsWith('/assets')) {
    final assetButton = find.text('Assets');
    if (assetButton.evaluate().isNotEmpty) {
      await tester.tap(assetButton.first);
    }
  } else if (path.startsWith('/tickets')) {
    final ticketButton = find.text('Tickets');
    if (ticketButton.evaluate().isNotEmpty) {
      await tester.tap(ticketButton.first);
    }
  } else if (path.startsWith('/settings')) {
    final settingsButton = find.text('Settings');
    if (settingsButton.evaluate().isNotEmpty) {
      await tester.tap(settingsButton.first);
    }
  } else if (path.startsWith('/admin')) {
    final adminButton = find.text('Admin');
    if (adminButton.evaluate().isNotEmpty) {
      await tester.tap(adminButton.first);
    }
  }

  await tester.pumpAndSettle();
}

/// Capture a screenshot with the given name
Future<void> _captureScreenshot(
  IntegrationTestWidgetsFlutterBinding binding,
  String name,
) async {
  if (!_screenshotMode) return;

  try {
    await binding.takeScreenshot(name);
    debugPrint('Screenshot captured: $name');
  } catch (e) {
    debugPrint('Failed to capture screenshot $name: $e');
  }
}
