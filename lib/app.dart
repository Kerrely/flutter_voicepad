import 'package:flutter/material.dart';
import 'package:voice_pad/ui/pages/category_selection/category_selection.dart';

class VoicePadApp extends StatelessWidget {
  const VoicePadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategorySelectionPage(),
    );
  }
}
