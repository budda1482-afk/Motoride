import 'package:flutter/material.dart';

void main() {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // 🚀 START THE APP FIRST — NO WAITING!
  runApp(const MyApp());
  
  // 🔄 Run background init AFTER app starts
  initializeAppAfterLaunch();
}

// ✅ Background initialization — defined BEFORE use
Future<void> initializeAppAfterLaunch() async {
  try {
    print('App initialization running in background...');
    // Add your init logic here later
  } catch (e) {
    print('Init error (non-blocking): $e');
  }
}

// ✅ Simple SplashScreen — NO extra file needed!
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🏍️ MotoRide', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Colors.purple),
          ],
        ),
      ),
    );
  }
}

// ✅ Main App — unchanged
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotoRide',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const SplashScreen(),
    );
  }
}
