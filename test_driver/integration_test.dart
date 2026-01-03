// Test driver for Flutter web integration tests
//
// This driver handles screenshot persistence and test execution
// for web-based integration tests.
//
// Screenshots are saved to the screenshots/ directory.

// ignore_for_file: avoid_print

import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  // Ensure screenshots directory exists
  final screenshotsDir = Directory('screenshots');
  if (!screenshotsDir.existsSync()) {
    screenshotsDir.createSync(recursive: true);
  }

  await integrationDriver(
    onScreenshot: (String name, List<int> bytes, [Map<String, Object?>? args]) async {
      // Create timestamped filename for versioning
      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first;
      final filename = 'screenshots/${name}_$timestamp.png';

      // Also save as latest (without timestamp) for easy comparison
      final latestFilename = 'screenshots/$name.png';

      try {
        // Save timestamped version
        final file = File(filename);
        await file.writeAsBytes(bytes);
        print('Screenshot saved: $filename');

        // Save as latest
        final latestFile = File(latestFilename);
        await latestFile.writeAsBytes(bytes);
        print('Latest screenshot: $latestFilename');

        return true;
      } catch (e) {
        print('Failed to save screenshot: $e');
        return false;
      }
    },
  );
}
