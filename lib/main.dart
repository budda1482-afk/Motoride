import 'package:flutter/material.dart';

void main() {
  // Ensure Flutter bindings are initialized (required for Flutter setup)
  WidgetsFlutterBinding.ensureInitialized();
  
  // 🚀 START THE APP FIRST — NO WAITING!
  runApp(const MyApp());
  
  // 🔄 Do ALL your initialization/loading work AFTER the app starts
  // Move your old await/fetch/setup code HERE instead of before runApp
  initializeAppAfterLaunch();
}

// Async init runs IN THE BACKGROUND — never blocks startup!
Future<void> initializeAppAfterLaunch() async {
  try {
    // Add your original init logic here:
    // - SharedPreferences / local storage loads
    // - API / config fetches (with timeouts!)
    // - User auth checks
    // - Database setup
    print('App initialization running in background...');
  } catch (e) {
    print('Init error (non-blocking): $e');
  }
}

// Keep your MyApp widget unchanged below
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotoRide',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const SplashScreen(), // Your loading/home screen
    );
  }
}
