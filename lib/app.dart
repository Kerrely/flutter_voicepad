import 'package:flutter/material.dart';
import 'package:voice_pad/ui/pages/startup_page.dart';

class VoicePadApp extends StatelessWidget {
  const VoicePadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Voice Pad',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
      ),
      home: const StartupPage(),
    );
  }
}
