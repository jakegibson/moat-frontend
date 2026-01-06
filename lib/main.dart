import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'core/config/app_config.dart';
import 'core/di/injection.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart' as prod;
import 'firebase_options_staging.dart' as staging;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Select Firebase options based on environment
  final firebaseOptions = switch (AppConfig.environment) {
    'prod' => prod.DefaultFirebaseOptions.currentPlatform,
    _ => staging.DefaultFirebaseOptions.currentPlatform, // dev/staging use staging
  };

  // Initialize Firebase
  await Firebase.initializeApp(options: firebaseOptions);

  // Initialize dependency injection
  configureDependencies(AppConfig.environment);

  runApp(const MoatApp());
}

class MoatApp extends StatefulWidget {
  const MoatApp({super.key});

  @override
  State<MoatApp> createState() => _MoatAppState();
}

class _MoatAppState extends State<MoatApp> {
  @override
  void initState() {
    super.initState();
    // Listen for Firebase auth state changes and refresh router
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      appRouter.refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Moat',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      // Force light mode - dark theme not designed yet
      themeMode: ThemeMode.light,
      routerConfig: appRouter,
    );
  }
}
